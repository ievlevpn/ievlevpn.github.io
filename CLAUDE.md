# CLAUDE.md

Technical guidance for Claude Code when working with this Jekyll academic website.

## Overview

Academic personal website for Pavel Ievlev built with Jekyll 4.3+ and deployed to GitHub Pages. Content is managed via Obsidian in the `vault/` directory with full wikilink support.

## Commands

```bash
./serve.sh                    # Local dev server (port 4000, live reload)
bundle exec jekyll build      # Production build (use serve.sh wrapper for correct Ruby env)
bundle install                # Install dependencies
```

**Important:** Always use `./serve.sh` instead of raw Jekyll commands - it initializes rbenv for the correct Ruby environment.

## Directory Structure

```
/
├── _config.yml                 # Site configuration
├── _layouts/                   # Page templates
│   ├── default.html           # Base layout (header, nav, MathJax, footer)
│   ├── publication.html       # Publication detail pages
│   ├── talk.html              # Talk detail pages
│   └── teaching.html          # Course detail pages
├── _includes/
│   └── publication-links.html  # DOI/arXiv/PDF link badges
├── _plugins/
│   └── wikilinks.rb           # Obsidian [[wikilink]] support
├── assets/
│   ├── css/main.scss          # All styles (SCSS)
│   └── images/favicon.svg     # Site favicon
├── vault/                      # Obsidian vault (collections_dir)
│   ├── _pages/                # Main pages (index, cv, publications, etc.)
│   ├── _publications/         # Academic papers (12 files)
│   ├── _talks/                # Presentations (2 files)
│   ├── _teaching/             # Courses (6 files)
│   ├── _education/            # Degrees (data only, output: false)
│   ├── assets/                # PDFs, slides, photos
│   └── .obsidian/             # Obsidian config & templates
├── .github/workflows/
│   └── jekyll.yml             # CI/CD pipeline
├── serve.sh                   # Dev server script
└── Gemfile                    # Ruby dependencies
```

## Collections

All collections use `collections_dir: vault` in `_config.yml`.

### Publications (`vault/_publications/`)
**Permalink:** `/publications/:name/`

| Field | Type | Description |
|-------|------|-------------|
| layout | string | Always `publication` |
| title | string | Full paper title |
| date | date | Publication date (YYYY-MM-DD) |
| year | number | Year for grouping |
| authors | array | List of author names |
| venue | string | Journal/conference name |
| type | string | `academic`, `conference`, `journal`, `preprint` |
| status | string | `published`, `accepted`, `submitted`, `in-prep` |
| abstract | text | Paper abstract (markdown) |
| keywords | array | Keyword list |
| doi | string | DOI (without `https://doi.org/`) |
| arxiv | string | arXiv ID (without URL) |
| pdf | string | Path to PDF file |
| code | string | URL to code repository |
| bibtex | text | Full BibTeX entry (multiline) |

### Talks (`vault/_talks/`)
**Permalink:** `/talks/:name/`

| Field | Type | Description |
|-------|------|-------------|
| layout | string | Always `talk` |
| title | string | Talk title |
| date | date | Talk date |
| year | number | Year |
| venue | string | Conference/event name |
| location | string | City, Country |
| type | string | `invited`, `contributed`, `keynote`, `seminar` |
| slides | string | URL/path to slides |
| video | string | URL to recording |
| abstract | text | Talk abstract |
| topics | array | Topics covered |

### Teaching (`vault/_teaching/`)
**Permalink:** `/teaching/:name/`

| Field | Type | Description |
|-------|------|-------------|
| layout | string | Always `teaching` |
| title | string | Course name |
| course_code | string | Course code (optional) |
| semester | string | `Fall`, `Spring`, `Summer` |
| year | number | Academic year |
| years | string | Year range (e.g., `2024-2025`) |
| institution | string | University name |
| role | string | `Instructor`, `Teaching Assistant`, etc. |
| level | string | `Undergraduate`, `Graduate`, `Mixed` |
| current | boolean | Is course ongoing |
| description | text | Course description |
| topics | array | Topics covered |

### Education (`vault/_education/`)
**Output:** `false` (data only, used on CV page)

| Field | Type | Description |
|-------|------|-------------|
| degree | string | `Ph.D.`, `M.S.`, `B.S.` |
| field | string | Field of study |
| institution | string | University |
| graduation_year | number | Year |
| thesis_title | string | Thesis/dissertation title |
| thesis_pdf | string | Path to thesis PDF |
| advisor | string | Advisor name |

## Wikilinks Plugin

**File:** `_plugins/wikilinks.rb`

Converts Obsidian-style wikilinks to proper markdown links before Jekyll's markdown processing.

### Syntax
```markdown
[[Page Title]]              # Link using title
[[Page Title|Display Text]] # Link with custom text
[[filename]]                # Link using filename (without .md)
```

### How It Works
1. Runs in `pre_render` hook (before markdown conversion)
2. Builds lookup table from all collections (title + filename, case-insensitive)
3. Converts `[[...]]` to `[text](url)` markdown syntax
4. Unresolved links stay as-is for debugging

### Examples
```markdown
[[Publications]]                    # → /publications/
[[cv|My CV]]                        # → /cv/ with "My CV" text
[[2023-parisian]]                   # → /publications/2023-parisian/
[[Optimization Methods in Management Science]] # → /teaching/2024-2025-optimization/
```

## Layouts

### default.html
Base layout with:
- Header (profile photo, name, social links)
- Navigation (Home, CV, Publications, Teaching, Talks, Contact)
- MathJax 3 configuration (inline: `$...$`, display: `$$...$$`)
- SEO meta tags (jekyll-seo-tag)
- Schema.org structured data (Person)
- Footer with copyright

### publication.html
Extends default. Displays:
- Title, authors, venue, date
- Link badges (DOI, arXiv, PDF, code)
- Abstract, keywords
- BibTeX in `<pre><code>` block

### talk.html
Extends default. Displays:
- Title, venue, location, date
- Type badge (invited/contributed)
- Slides/video links
- Abstract, topics

### teaching.html
Extends default. Displays:
- Title, course code, semester/year
- Institution, role, level
- Syllabus/website links
- Description, topics

## Styling

**File:** `assets/css/main.scss`

### Key CSS Variables
```scss
:root {
  --text: #111;        // Main text
  --text-light: #555;  // Secondary text
  --link: #111;        // Link color
  --bg: #fff;          // Background
}
```

### Typography
- Body: Georgia, Palatino, serif (17px)
- Code: Computer Modern Typewriter
- Line height: 1.65

### Responsive Breakpoint
- Desktop: 600px+
- Mobile: < 600px (single column, smaller fonts)

### Special Classes
- `.link-badge` - DOI/arXiv/PDF link styling
- `.card`, `.card-header` - Publication/CV item cards
- `.welcome-box` - Homepage intro box

## MathJax Configuration

```javascript
MathJax = {
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']],
    displayMath: [['$$', '$$'], ['\\[', '\\]']],
    packages: {'[+]': ['ams', 'newcommand', 'configmacros']}
  }
};
```

Loaded from CDN: `https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js`

**Important:** Use `\[...\]` for display math (not `$$...$$`). Kramdown requires blank lines around `$$` blocks, but `\[...\]` works inline without issues.

## Deployment

### GitHub Actions (`.github/workflows/jekyll.yml`)
- **Trigger:** Push to `master` or `main`
- **Build:** Ruby 3.2, `bundle exec jekyll build`
- **Deploy:** GitHub Pages via actions/deploy-pages

### Manual Build
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"
bundle exec jekyll build
# Output in _site/
```

## Common Tasks

### Add a Publication
1. Create `vault/_publications/YYYY-slug.md`
2. Add front matter (title, authors, venue, etc.)
3. Run `./serve.sh` to preview
4. Push to deploy

### Add a Talk
1. Create `vault/_talks/YYYY-venue-topic.md`
2. Add front matter (title, venue, location, slides)
3. Push to deploy

### Add a Course
1. Create `vault/_teaching/YYYY-course-name.md`
2. Set `current: true` if ongoing
3. Add topics and description

### Use Wikilinks
```markdown
Related work: [[2023-parisian|our paper on Parisian ruin]]
See also: [[Publications]] and [[cv|my CV]]
```

## Plugins

### Bundled (Gemfile)
- `jekyll-feed` - RSS feed at `/feed.xml`
- `jekyll-sitemap` - XML sitemap
- `jekyll-seo-tag` - Meta tags

### Custom (`_plugins/`)
- `wikilinks.rb` - Obsidian wikilink support

## Troubleshooting

### Ruby/Bundle Issues
Always use `./serve.sh` which sets up rbenv. Direct `bundle exec` may use wrong Ruby.

### Wikilinks Not Resolving
- Check exact title match (case-insensitive)
- Verify page has `title` in front matter
- Try using filename instead: `[[2023-parisian]]`

### MathJax Not Rendering
- Use `$...$` for inline, `$$...$$` for display
- Escape special chars in YAML front matter
- Check browser console for errors
