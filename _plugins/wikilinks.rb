# Obsidian-style wikilinks support for Jekyll
# Converts [[Page Title]] and [[Page Title|Display Text]] to proper links
#
# Uses pre_render hook to convert wikilinks BEFORE markdown processing,
# avoiding issues with pipe | being interpreted as table delimiter.

module Jekyll
  class WikilinksConverter
    WIKILINK_PATTERN = /\[\[([^\]|]+)(?:\|([^\]]+))?\]\]/

    def initialize(site)
      @site = site
      @lookup_table = nil
    end

    def lookup_table
      @lookup_table ||= build_lookup_table
    end

    def build_lookup_table
      table = {}

      # Add documents from all collections
      @site.collections.each do |name, collection|
        collection.docs.each do |doc|
          title = doc.data['title']
          next unless title

          entry = { url: doc.url, title: title }

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

        entry = { url: page.url, title: title }

        # Index by title
        key = title.downcase.strip
        table[key] ||= entry

        # Also index by filename
        basename = File.basename(page.path, '.*').downcase
        table[basename] ||= entry
      end

      table
    end

    def convert(content, baseurl)
      return content unless content

      content.gsub(WIKILINK_PATTERN) do |match|
        link_target = Regexp.last_match(1).strip
        display_text = Regexp.last_match(2)&.strip || link_target

        key = link_target.downcase
        if (entry = lookup_table[key])
          url = baseurl.to_s + entry[:url]
          # Use markdown link syntax since this runs before markdown processing
          "[#{display_text}](#{url})"
        else
          # Keep original for debugging unresolved links
          match
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
    next unless doc.content

    converter = Jekyll.wikilinks_converter(doc.site)
    doc.content = converter.convert(doc.content, doc.site.config['baseurl'])
  end

  # Process pages BEFORE markdown conversion
  Hooks.register :pages, :pre_render do |page|
    next unless page.content

    converter = Jekyll.wikilinks_converter(page.site)
    page.content = converter.convert(page.content, page.site.config['baseurl'])
  end

  # Clear cache after site is written
  Hooks.register :site, :post_write do |site|
    @@wikilinks_converters.delete(site.object_id)
  end
end
