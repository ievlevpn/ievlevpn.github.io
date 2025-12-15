# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an academic personal website built with Jekyll 4.3+ and designed for Obsidian integration. The site uses Computer Modern typography and deploys to GitHub Pages via GitHub Actions.

## Common Commands

```bash
# Install dependencies
bundle install

# Run local development server
bundle exec jekyll serve --host 127.0.0.1 --port 4000

# Build site for production
bundle exec jekyll build
```

## Architecture

### Content Structure

All content lives in `vault/` directory (Obsidian vault):
- `vault/_pages/` - Main website pages (index, cv, publications, research, teaching, talks, contact)
- `vault/_publications/` - Academic publications (output: true)
- `vault/_education/` - Degrees and education (output: false, data only)
- `vault/_teaching/` - Courses taught
- `vault/_talks/` - Presentations and seminars
- `vault/_experience/` - Professional positions
- `vault/templates/` - Obsidian templates for creating new content

### Jekyll Configuration

- Collections are defined in `_config.yml` with `collections_dir: vault`
- Layouts in `_layouts/`: default, publication, experience, talk, teaching
- Styles in `assets/css/main.scss`
- MathJax enabled for LaTeX rendering (configured in `_layouts/default.html`)

### Content Front Matter

Publications use YAML front matter with: layout, title, date, year, authors (array), venue, type, status, abstract, keywords, doi, arxiv, pdf, code.

### Deployment

Pushes to `master` branch trigger GitHub Actions workflow (`.github/workflows/jekyll.yml`) which builds and deploys to GitHub Pages.

### Design Updates

Run `./update-design.sh` to pull template design updates without affecting content in `vault/`.
