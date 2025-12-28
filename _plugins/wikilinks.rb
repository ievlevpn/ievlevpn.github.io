# Obsidian-style wikilinks and callouts support for Jekyll
# Converts [[Page Title]] and [[Page Title|Display Text]] to proper links
#
# Supports:
# - Content wikilinks: [[Page]] becomes [Page](/page/)
# - YAML front matter: slides: [[filename.pdf]] becomes slides: /vault/assets/.../filename.pdf
# - Asset files: indexes PDFs, images, etc. from vault/assets/
# - Callouts: > [!type] Title becomes styled div blocks
# - Math protection: preserves LaTeX math from Kramdown processing

module Jekyll
  # Protects math blocks from Kramdown's markdown processing
  # Extracts math, replaces with placeholders, restores after rendering
  class MathProtector
    PLACEHOLDER_PREFIX = "MATHPROTECT"

    def initialize
      @math_blocks = {}
      @counter = 0
    end

    # Extract math blocks and replace with placeholders
    def protect(content)
      return content unless content

      # Display math: $$...$$ (including multiline)
      content = content.gsub(/\$\$(.+?)\$\$/m) do |match|
        store_and_placeholder(match)
      end

      # Display math: \[...\] (including multiline)
      content = content.gsub(/\\\[(.+?)\\\]/m) do |match|
        store_and_placeholder(match)
      end

      # Inline math: $...$ (single line, non-greedy)
      content = content.gsub(/(?<![\\$])\$(?!\$)([^$\n]+)\$(?!\$)/) do |match|
        store_and_placeholder(match)
      end

      # Inline math: \(...\)
      content = content.gsub(/\\\((.+?)\\\)/) do |match|
        store_and_placeholder(match)
      end

      content
    end

    # Restore math blocks from placeholders
    def restore(content)
      return content unless content

      @math_blocks.each do |placeholder, math|
        content = content.gsub(placeholder, math)
      end

      content
    end

    private

    def store_and_placeholder(math)
      @counter += 1
      placeholder = "<!--#{PLACEHOLDER_PREFIX}_#{@counter}-->"
      @math_blocks[placeholder] = math
      placeholder
    end
  end

  # Storage for math protectors per document
  @@math_protectors = {}

  def self.math_protector_for(doc_id)
    @@math_protectors[doc_id] ||= MathProtector.new
  end

  def self.clear_math_protector(doc_id)
    @@math_protectors.delete(doc_id)
  end

  class WikilinksConverter
    WIKILINK_PATTERN = /\[\[([^\]|]+)(?:\|([^\]]+))?\]\]/
    ASSET_EXTENSIONS = %w[.pdf .png .jpg .jpeg .gif .svg .webp .mp4 .mp3 .zip]

    # Callout header pattern: > [!type] Title
    CALLOUT_HEADER = /^> \[!(\w+)\]\s*(.*)$/

    # Callout types that should be rendered as lecture/publication items
    ITEM_CALLOUT_TYPES = %w[lecture note material exercise]

    def initialize(site)
      @site = site
      @lookup_table = nil
      @asset_table = nil
    end

    def lookup_table
      @lookup_table ||= build_lookup_table
    end

    def asset_table
      @asset_table ||= build_asset_table
    end

    def build_lookup_table
      table = {}

      # Add documents from all collections
      @site.collections.each do |name, collection|
        collection.docs.each do |doc|
          title = doc.data['title']
          next unless title

          entry = { url: doc.url, title: title, type: :page }

          # Index by title
          key = title.downcase.strip
          table[key] ||= entry

          # Also index by filename (basename without extension)
          basename = File.basename(doc.path, '.*').downcase
          table[basename] ||= entry
        end
      end

      # Add pages
      @site.pages.each do |page|
        title = page.data['title']
        next unless title

        entry = { url: page.url, title: title, type: :page }

        # Index by title
        key = title.downcase.strip
        table[key] ||= entry

        # Also index by filename
        basename = File.basename(page.path, '.*').downcase
        table[basename] ||= entry
      end

      table
    end

    def build_asset_table
      table = {}

      # Find vault/assets directory
      vault_assets = File.join(@site.source, 'vault', 'assets')
      return table unless File.directory?(vault_assets)

      # Recursively find all asset files
      Dir.glob(File.join(vault_assets, '**', '*')).each do |file_path|
        next unless File.file?(file_path)

        ext = File.extname(file_path).downcase
        next unless ASSET_EXTENSIONS.include?(ext)

        # Get the URL path (relative to site root)
        relative_path = file_path.sub(@site.source, '')
        url = relative_path.start_with?('/') ? relative_path : "/#{relative_path}"

        # Index by full filename (with extension)
        filename = File.basename(file_path).downcase
        table[filename] ||= { url: url, type: :asset }

        # Also index by filename without extension
        basename = File.basename(file_path, '.*').downcase
        table[basename] ||= { url: url, type: :asset }
      end

      table
    end

    def resolve(target)
      key = target.downcase.strip

      # First check pages/documents
      if (entry = lookup_table[key])
        return entry
      end

      # Then check assets
      if (entry = asset_table[key])
        return entry
      end

      nil
    end

    # Convert wikilinks in content (returns markdown link syntax)
    def convert_content(content, baseurl)
      return content unless content

      # First convert callouts to HTML
      content = convert_callouts(content, baseurl)

      # Then convert remaining wikilinks
      content.gsub(WIKILINK_PATTERN) do |match|
        link_target = Regexp.last_match(1).strip
        display_text = Regexp.last_match(2)&.strip || link_target

        if (entry = resolve(link_target))
          url = baseurl.to_s + entry[:url]
          "[#{display_text}](#{url})"
        else
          match
        end
      end
    end

    # Convert Obsidian callouts to styled HTML blocks
    def convert_callouts(content, baseurl)
      return content unless content

      result = []
      lines = content.lines
      i = 0

      while i < lines.length
        line = lines[i]

        # Check if this line starts a callout
        if line =~ CALLOUT_HEADER
          callout_type = Regexp.last_match(1).downcase
          title = Regexp.last_match(2).strip

          # Collect body lines (lines starting with > until we hit a non-> line)
          body_lines = []
          i += 1
          while i < lines.length && lines[i] =~ /^>/
            body_lines << lines[i].sub(/^>\s?/, '').rstrip
            i += 1
          end

          # Filter empty lines from body
          body_lines.reject!(&:empty?)

          if ITEM_CALLOUT_TYPES.include?(callout_type)
            result << render_item_callout(title, body_lines, baseurl, callout_type)
          else
            result << render_generic_callout(callout_type, title, body_lines, baseurl)
          end
        else
          result << line
          i += 1
        end
      end

      result.join
    end

    # Render lecture/note style callout as publication-item
    def render_item_callout(title, lines, baseurl, type)
      description = ''
      links = []

      lines.each do |line|
        # Check if line contains wikilinks (for assets)
        if line =~ WIKILINK_PATTERN
          line.scan(WIKILINK_PATTERN) do
            link_target = Regexp.last_match(1).strip
            display_text = Regexp.last_match(2)&.strip || 'pdf'

            if (entry = resolve(link_target))
              url = baseurl.to_s + entry[:url]
              links << { url: url, text: display_text }
            end
          end
        else
          # Regular description line
          description += line + ' '
        end
      end

      description = description.strip

      # Build HTML
      html = %(<div class="callout callout-#{type}">\n)
      html += %(<div class="title">#{title}</div>\n)
      html += %(<div class="venue">#{description}</div>\n) unless description.empty?

      unless links.empty?
        html += %(<div class="links">)
        links.each do |link|
          css_class = link[:text].downcase == 'pdf' ? 'link-pdf' : 'link-badge'
          html += %(<a href="#{link[:url]}" class="link-badge #{css_class}">#{link[:text]}</a>)
        end
        html += %(</div>\n)
      end

      html += %(</div>\n\n)
      html
    end

    # Render generic callout (info, warning, tip, etc.)
    def render_generic_callout(type, title, lines, baseurl)
      content = lines.map do |line|
        # Convert any wikilinks in the line
        line.gsub(WIKILINK_PATTERN) do
          link_target = Regexp.last_match(1).strip
          display_text = Regexp.last_match(2)&.strip || link_target

          if (entry = resolve(link_target))
            url = baseurl.to_s + entry[:url]
            %(<a href="#{url}">#{display_text}</a>)
          else
            "[[#{link_target}]]"
          end
        end
      end.join('<br>')

      html = %(<div class="callout callout-#{type}">\n)
      html += %(<div class="callout-title">#{title}</div>\n) unless title.empty?
      html += %(<div class="callout-content">#{content}</div>\n) unless content.empty?
      html += %(</div>\n\n)
      html
    end

    # Convert wikilinks in YAML value (returns just the URL)
    def convert_yaml_value(value, baseurl)
      return value unless value.is_a?(String)
      return value unless value.include?('[[')

      value.gsub(WIKILINK_PATTERN) do |match|
        link_target = Regexp.last_match(1).strip
        # Ignore display text for YAML - just return the URL

        if (entry = resolve(link_target))
          baseurl.to_s + entry[:url]
        else
          match
        end
      end
    end

    # Process all YAML front matter fields
    def process_yaml(data, baseurl)
      data.each do |key, value|
        case value
        when String
          data[key] = convert_yaml_value(value, baseurl)
        when Array
          data[key] = value.map { |v| v.is_a?(String) ? convert_yaml_value(v, baseurl) : v }
        when Hash
          process_yaml(value, baseurl)
        end
      end
    end
  end

  # Cache converter per site build
  @@wikilinks_converters = {}

  def self.wikilinks_converter(site)
    @@wikilinks_converters[site.object_id] ||= WikilinksConverter.new(site)
  end

  # Process documents BEFORE markdown conversion
  Hooks.register :documents, :pre_render do |doc|
    converter = Jekyll.wikilinks_converter(doc.site)
    baseurl = doc.site.config['baseurl']

    # Process content
    if doc.content
      # Protect math first
      protector = Jekyll.math_protector_for(doc.object_id)
      doc.content = protector.protect(doc.content)
      # Then convert wikilinks/callouts
      doc.content = converter.convert_content(doc.content, baseurl)
    end

    # Process YAML front matter
    converter.process_yaml(doc.data, baseurl)
  end

  # Restore math in documents AFTER markdown conversion
  Hooks.register :documents, :post_render do |doc|
    protector = Jekyll.math_protector_for(doc.object_id)
    doc.output = protector.restore(doc.output) if doc.output
    Jekyll.clear_math_protector(doc.object_id)
  end

  # Process pages BEFORE markdown conversion
  Hooks.register :pages, :pre_render do |page|
    converter = Jekyll.wikilinks_converter(page.site)
    baseurl = page.site.config['baseurl']

    # Process content
    if page.content
      # Protect math first
      protector = Jekyll.math_protector_for(page.object_id)
      page.content = protector.protect(page.content)
      # Then convert wikilinks/callouts
      page.content = converter.convert_content(page.content, baseurl)
    end

    # Process YAML front matter
    converter.process_yaml(page.data, baseurl)
  end

  # Restore math in pages AFTER markdown conversion
  Hooks.register :pages, :post_render do |page|
    protector = Jekyll.math_protector_for(page.object_id)
    page.output = protector.restore(page.output) if page.output
    Jekyll.clear_math_protector(page.object_id)
  end

  # Clear cache after site is written
  Hooks.register :site, :post_write do |site|
    @@wikilinks_converters.delete(site.object_id)
  end
end
