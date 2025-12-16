# CLAUDE.md

Guidance for Claude Code when working with this repository.

## Overview

Academic personal website built with Jekyll 4.3+ for GitHub Pages. Content is managed via Obsidian in the `vault/` directory.

## Commands

```bash
./serve.sh              # Start local dev server with live reload (port 4000)
bundle exec jekyll build  # Build for production
bundle install            # Install dependencies
```

Note: Use `./serve.sh` instead of raw Jekyll commands - it sets up the correct Ruby environment (rbenv).

## Structure

**Content** (in `vault/`):
- `_pages/` - Main pages (index, cv, publications, research, teaching, talks, contact)
- `_publications/` - Academic publications
- `_talks/` - Presentations and lectures
- `_teaching/` - Courses
- `_experience/` - Professional positions
- `_education/` - Degrees (data only, no output)

**Jekyll**:
- `_layouts/` - Page templates
- `assets/css/main.scss` - Styles
- `_config.yml` - Site configuration (collections defined with `collections_dir: vault`)

## Front Matter

Publications: layout, title, date, year, authors (array), venue, type, status, abstract, keywords, doi, arxiv, pdf, code

Talks: layout, title, date, year, venue, location, type, slides, video

## Deployment

Push to `master` triggers GitHub Actions (`.github/workflows/jekyll.yml`) which builds and deploys to GitHub Pages.
