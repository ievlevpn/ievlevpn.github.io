# 🎯 User Configuration Guide

This file explains what YOU should customize when using this template.

## 📝 Essential Configuration

### 1. Site Information (`_config.yml`)

**Edit these settings first:**

```yaml
title: "Your Name"                    # ← Your full name
subtitle: "Your Position"             # ← Your academic title/position  
email: your.email@university.edu      # ← Your email address

# Social/Academic Profiles
github_username: your_username        # ← Your GitHub username
orcid: 0000-0000-0000-0000           # ← Your ORCID ID
scholar: your_scholar_id             # ← Your Google Scholar ID
linkedin: your_linkedin              # ← Your LinkedIn username

# Research Areas (update these!)
research_interests:
  - "Your Research Area 1"           # ← Replace with your actual research
  - "Your Research Area 2"           # ← interests and topics
  - "Your Research Area 3"
```

### 2. Your Content (`vault/` directory)

**This is YOUR space - customize everything here:**

```
vault/
├── _pages/           # Edit all pages here
│   ├── index.md     # Homepage - write your bio
│   ├── cv.md        # Your CV page
│   ├── research.md  # Your research overview
│   └── ...          # All other pages
├── _publications/   # Add your papers here
├── _experience/     # Add your work experience
├── _education/      # Add your degrees
├── _talks/          # Add your presentations
└── _teaching/       # Add your courses
```

### 3. Assets (`assets/` directory)

**Add your files here:**

```
assets/
├── images/          # Your photos, logos
├── pdfs/           # Your CV, papers (if hosting locally)
└── ...
```

## 🎨 Design Customization

### Colors (`assets/css/main.scss`)

**Find this section and customize:**

```scss
:root {
  --primary-text: #2d3748;      // Main text color
  --secondary-text: #4a5568;    // Secondary text color  
  --accent-color: #5a67d8;      // Links and highlights
  --background: #ffffff;        // Page background
  --surface: #f7fafc;          // Card backgrounds
}
```

### Fonts

**Already set to Computer Modern, but you can change in the same file:**

```scss
// Change this line to use different fonts
@import url('your-font-url-here');
```

## 🚫 DON'T Edit These (Template Files)

**Leave these alone - they'll be updated by the template:**

- `_layouts/` - Page templates
- `_includes/` - Reusable components  
- Most of `assets/css/main.scss` (except colors)
- `.github/workflows/` - Deployment automation
- `update-design.sh` - Design update script

## 🔄 Getting Template Updates

**When design improvements are available:**

1. Run: `./update-design.sh`
2. Review changes: `git diff`
3. Test: `bundle exec jekyll serve`
4. Commit if happy: `git add . && git commit -m "Update design"`

## 🆘 Getting Help

1. **Setup Issues**: Check the main README.md
2. **Content Questions**: Look in `vault/.obsidian/templates/`
3. **Design Problems**: Open an issue in the template repository
4. **Obsidian Help**: Check [Obsidian documentation](https://help.obsidian.md/)

---

## 📚 Quick Start Checklist

- [ ] Update `_config.yml` with your information
- [ ] Edit `vault/_pages/index.md` with your bio
- [ ] Add your first publication in `vault/_publications/`
- [ ] Add your experience in `vault/_experience/`
- [ ] Test locally: `bundle exec jekyll serve`
- [ ] Commit and push to GitHub
- [ ] Enable GitHub Pages in repository settings

**Happy academic website building!** 🎓