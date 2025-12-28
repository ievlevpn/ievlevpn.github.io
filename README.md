# Pavel Ievlev - Academic Website

Personal academic website built with Jekyll 4.3+ and Obsidian integration. Features publications, teaching portfolio, talks, and CV with LaTeX-quality typography.

**Live site:** [ievlevpn.github.io](https://ievlevpn.github.io)

## Features

- **Obsidian Integration** - Content managed via Obsidian vault with wikilink support
- **Academic Typography** - Computer Modern fonts for LaTeX-quality appearance
- **MathJax Support** - Full LaTeX math rendering (`$...$` inline, `$$...$$` display)
- **Collections** - Publications, talks, teaching, education with dedicated layouts
- **Responsive Design** - Mobile-first with clean academic aesthetics
- **SEO Optimized** - Meta tags, structured data (Schema.org), RSS feed, sitemap
- **Automated Deployment** - GitHub Actions builds and deploys on push

## Quick Start

### Prerequisites

- Ruby 3.2+ (via rbenv)
- Bundler
- Obsidian (optional, for content editing)

### Local Development

```bash
# Install dependencies
bundle install

# Start dev server with live reload
./serve.sh

# Site available at http://localhost:4000
```

**Note:** Always use `./serve.sh` - it sets up the correct Ruby environment via rbenv.

## Project Structure

```
/
├── vault/                      # Obsidian vault - all content here
│   ├── _pages/                # Main pages (index, cv, publications, etc.)
│   ├── _publications/         # Academic papers
│   ├── _talks/                # Presentations
│   ├── _teaching/             # Courses
│   ├── _education/            # Degrees (data only)
│   └── assets/                # PDFs, slides, photos
├── _layouts/                   # Page templates
├── _includes/                  # Partial templates
├── _plugins/                   # Custom plugins (wikilinks)
├── assets/css/                 # Styles (SCSS)
├── _config.yml                 # Site configuration
└── .github/workflows/          # CI/CD
```

## Content Management

### Using Obsidian

1. Open `vault/` folder as Obsidian vault
2. Use templates in `.obsidian/templates/` for new content
3. Wikilinks like `[[Publication Title]]` auto-convert to proper links

### Wikilinks

The site supports Obsidian-style wikilinks:

```markdown
[[Publications]]                # Link by page title
[[2023-parisian]]               # Link by filename
[[cv|My CV]]                    # Link with custom text
```

### Adding Content

**Publication:**
```yaml
# vault/_publications/2025-paper-name.md
---
layout: publication
title: "Paper Title"
date: 2025-01-15
year: 2025
authors: ["Author One", "Author Two"]
venue: "Journal Name"
status: published
abstract: |
  Abstract text here...
doi: "10.1000/example"
arxiv: "2501.12345"
---
```

**Talk:**
```yaml
# vault/_talks/2025-conference-topic.md
---
layout: talk
title: "Talk Title"
date: 2025-03-20
venue: "Conference Name"
location: "City, Country"
type: invited
slides: /vault/assets/slides/talk.pdf
---
```

**Course:**
```yaml
# vault/_teaching/2025-course-name.md
---
layout: teaching
title: "Course Name"
semester: Spring
year: 2025
institution: "University"
role: Instructor
level: Graduate
current: true
---
```

## Customization

### Site Settings

Edit `_config.yml`:
```yaml
title: "Your Name"
subtitle: "Your Position"
email: your.email@example.com
orcid: 0000-0000-0000-0000
scholar: your_scholar_id
github_username: username
```

### Styling

Edit `assets/css/main.scss`:
```scss
:root {
  --text: #111;        // Main text color
  --text-light: #555;  // Secondary text
  --link: #111;        // Link color
  --bg: #fff;          // Background
}
```

### Layouts

- `_layouts/default.html` - Base template (header, nav, footer)
- `_layouts/publication.html` - Publication detail pages
- `_layouts/talk.html` - Talk detail pages
- `_layouts/teaching.html` - Course detail pages

## Deployment

Push to `master` branch triggers automatic build and deploy via GitHub Actions.

```bash
git add .
git commit -m "Update content"
git push
```

Site deploys to GitHub Pages at `https://ievlevpn.github.io`.

## Technical Details

### MathJax

Configured for both inline and display math:
- Inline: `$E = mc^2$`
- Display: `$$\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}$$`

**Note:** Display math `$$...$$` requires **blank lines** before and after for Kramdown to parse correctly.

### BibTeX

Publications can include full BibTeX entries in the `bibtex` front matter field, displayed on publication detail pages.

### Structured Data

Automatic Schema.org markup for:
- Person (site-wide)
- ScholarlyArticle (publication pages)

### RSS Feed

Available at `/feed.xml` via jekyll-feed plugin.

## Dependencies

- Jekyll 4.3+
- jekyll-feed (RSS)
- jekyll-sitemap (XML sitemap)
- jekyll-seo-tag (SEO meta tags)
- Custom wikilinks plugin

## License

Content is copyrighted. Code structure available under MIT License.
