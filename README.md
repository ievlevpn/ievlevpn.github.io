# Academic CV & Publication Website

A professional academic website built with Jekyll and optimized for seamless Obsidian integration. Features Computer Modern typography, responsive design, and complete content management through an Obsidian vault.

## 🌟 Features

- **Complete Obsidian Integration**: All content managed through Obsidian vault with automated Jekyll publishing
- **Academic Typography**: Professional Computer Modern fonts for that LaTeX-quality appearance
- **Responsive Design**: Mobile-first design with clean, academic aesthetics
- **Rich Content Types**: Dedicated collections for publications, experience, education, talks, and teaching
- **Automated Deployment**: GitHub Actions workflow for continuous deployment to GitHub Pages
- **SEO Optimized**: Built-in SEO tags, structured data, and RSS feeds
- **Professional Layout**: Header contact information, refined navigation, and print-friendly styles

## 🚀 Live Demo

**Website URL**: [https://mechanicpanic.github.io/academic-website/](https://mechanicpanic.github.io/academic-website/)

## 🚀 Quick Start (Template Usage)

### 1. Use This Template
1. Click the green **"Use this template"** button above
2. Create your new repository (e.g., `your-username/academic-website`)
3. Clone your new repository locally

### 2. Customize Your Site
1. **Edit `_config.yml`** - Add your name, email, social links
2. **Edit `vault/_pages/index.md`** - Write your bio
3. **Add content** using Obsidian or directly editing markdown files
4. **See `USER_CONFIG.md`** for detailed customization guide

### 3. Deploy
1. Push to GitHub
2. Enable GitHub Pages in repository Settings → Pages
3. Your site will be live at `https://your-username.github.io/your-repo-name/`

### 4. Keep Design Updated
- Run `./update-design.sh` to get latest template improvements
- Your content stays safe, only design files update

## 🏗️ Architecture

### Technology Stack
- **Static Site Generator**: Jekyll 4.3+
- **Content Management**: Obsidian vault with templates
- **Typography**: Computer Modern web fonts via CDN
- **Styling**: Modern SCSS with CSS custom properties
- **Deployment**: GitHub Actions + GitHub Pages
- **Version Control**: Git with automated CI/CD

### Project Structure
```
your-academic-website/              # Your repository from template
├── _config.yml                    # 🎯 YOUR SETTINGS - Edit this!
├── _layouts/                      # 🔧 Template files (updated via script)
│   ├── default.html              # Base layout with header/nav/footer
│   ├── publication.html          # Publication detail page
│   ├── experience.html           # Experience detail page
│   ├── talk.html                 # Talk detail page
│   └── teaching.html             # Teaching detail page
├── assets/css/main.scss          # 🎨 Styles (customize colors here)
├── Gemfile                       # Ruby dependencies
├── vault/                        # 📝 YOUR CONTENT - All yours!
│   ├── _pages/                   # Website pages
│   │   ├── index.md             # 📝 Homepage - Write your bio here
│   │   ├── cv.md                # 📝 Your CV page
│   │   ├── publications.md       # Publications listing page
│   │   ├── research.md          # Research overview page
│   │   ├── teaching.md          # Teaching portfolio page
│   │   ├── talks.md             # Talks & presentations page
│   │   └── contact.md           # Contact information page
│   ├── _publications/           # 📝 Add your papers here
│   ├── _experience/             # 📝 Add your work experience
│   ├── _education/              # 📝 Add your degrees
│   ├── _talks/                  # 📝 Add your presentations
│   ├── _teaching/               # 📝 Add your courses
│   └── .obsidian/               # Obsidian configuration
│       └── templates/           # Content creation templates
├── .github/workflows/jekyll.yml  # 🔧 Automated deployment
├── update-design.sh             # 🔄 Design update script
├── USER_CONFIG.md               # 📚 Your customization guide
└── README.md                    # This documentation
```

**Legend:**
- 📝 **YOUR CONTENT** - Edit freely, these are your files
- 🎯 **YOUR SETTINGS** - Customize for your site
- 🎨 **STYLE CUSTOMIZATION** - Safe to modify colors/fonts
- 🔧 **TEMPLATE FILES** - Updated via `update-design.sh`
- 🔄 **UPDATE TOOLS** - Keep your design current

## 🎯 Getting Started

### Prerequisites
- [Ruby](https://www.ruby-lang.org/) 3.2+
- [Bundler](https://bundler.io/)
- [Obsidian](https://obsidian.md/) (for content management)
- [Git](https://git-scm.com/)

### Installing Ruby on macOS (Recommended Method)

**⚠️ Important**: Don't use the system Ruby that comes with macOS! It can cause permission issues and path conflicts.

#### Option 1: Homebrew (Simplest)

1. **Install Homebrew** (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Ruby via Homebrew**:
   ```bash
   brew install ruby
   ```

3. **Add Homebrew Ruby to your PATH**:
   Add this to your `~/.zshrc` (or `~/.bash_profile` if using bash):
   ```bash
   export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
   export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
   export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
   export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
   ```

4. **Reload your shell**:
   ```bash
   source ~/.zshrc
   ```

5. **Verify installation**:
   ```bash
   which ruby
   # Should show: /opt/homebrew/opt/ruby/bin/ruby
   ruby -v
   # Should show: ruby 3.x.x
   ```

#### Option 2: rbenv (Most Flexible)

1. **Install rbenv via Homebrew**:
   ```bash
   brew install rbenv ruby-build
   ```

2. **Initialize rbenv**:
   ```bash
   rbenv init
   ```

3. **Add rbenv to your shell** (add to `~/.zshrc`):
   ```bash
   eval "$(rbenv init - zsh)"
   ```

4. **Install and set Ruby version**:
   ```bash
   rbenv install 3.2.0
   rbenv global 3.2.0
   ```

5. **Verify installation**:
   ```bash
   which ruby
   # Should show: /Users/yourusername/.rbenv/shims/ruby
   ruby -v
   # Should show: ruby 3.2.0
   ```

#### Installing Bundler

After installing Ruby with either method:
```bash
gem install bundler
```

#### Troubleshooting Ruby Installation

**If you see permission errors**:
- ❌ **Don't use `sudo`** with gem commands
- ✅ **Use Homebrew or rbenv** as described above

**If `bundle install` fails**:
```bash
# Set bundle to install gems locally
bundle config set --local path 'vendor/bundle'
bundle install
```

**Check your Ruby setup**:
```bash
# Verify you're not using system Ruby
which ruby
# Should NOT show: /usr/bin/ruby

# Check gem environment
gem env
# Look for paths under /opt/homebrew or ~/.rbenv
```

### Local Development

1. **Use this template to create your repository**
   - Click "Use this template" button
   - Clone YOUR new repository locally

2. **Install Jekyll dependencies**
   ```bash
   cd your-academic-website
   bundle install
   ```

3. **Customize your site**
   ```bash
   # Edit your basic settings
   nano _config.yml
   
   # Edit your homepage bio
   nano vault/_pages/index.md
   ```

4. **Run local development server**
   ```bash
   bundle exec jekyll serve --host 127.0.0.1 --port 4000
   ```

5. **View the site**
   Open [http://127.0.0.1:4000](http://127.0.0.1:4000) in your browser

### Content Management with Obsidian

1. **Open Obsidian**
2. **Open vault**: Point to `your-academic-website/vault/`
3. **Use templates**: Cmd/Ctrl+P → "Templater: Create new note from template"
4. **Available templates**:
   - Publication.md - Research papers and publications
   - Experience.md - Professional positions
   - Education.md - Academic degrees
   - Talk.md - Presentations and seminars
   - Teaching.md - Courses and educational activities
   - Page.md - General website pages

**💡 Pro tip**: All your content lives in the `vault/` directory, making it easy to manage everything through Obsidian while keeping design updates separate!

## 📝 Content Creation Workflow

### Adding a New Publication

1. In Obsidian: Cmd/Ctrl+P → "Templater: Create new note from template"
2. Select "Publication" template
3. Fill in the front matter:
   ```yaml
   ---
   layout: publication
   title: "Your Paper Title"
   date: 2024-01-15
   year: 2024
   authors:
     - "Your Name"
     - "Co-author Name"
   venue: "Conference/Journal Name"
   type: "conference"
   status: "published"
   abstract: |
     Brief description of your research...
   keywords:
     - "keyword1"
     - "keyword2"
   doi: "10.1000/123456"
   arxiv: "2401.12345"
   pdf: "/assets/pdfs/paper.pdf"
   code: "https://github.com/user/repo"
   ---
   ```
4. Save in `vault/_publications/` directory
5. Jekyll automatically rebuilds the site

### Updating Site Configuration

Edit `academic-website/docs/_config.yml`:
```yaml
title: "Your Name"
subtitle: "Your Position"
email: your.email@university.edu
orcid: 0000-0000-0000-0000
scholar: your_scholar_id
github_username: your_username
linkedin: your_linkedin
```

## 🎨 Customization

### Colors and Typography

Edit `academic-website/docs/assets/css/main.scss`:
```scss
:root {
  --primary-text: #2d3748;      // Dark gray-blue
  --secondary-text: #4a5568;    // Medium gray
  --accent-color: #5a67d8;      // Muted indigo
  --background: #ffffff;        // Pure white
  --surface: #f7fafc;          // Very light gray
}
```

### Layout Modifications

- **Header**: `academic-website/docs/_layouts/default.html`
- **Publication display**: `academic-website/docs/_layouts/publication.html`
- **Page structure**: Individual layout files in `_layouts/`

## 🚀 Deployment

### Automatic Deployment (Recommended)

The site automatically deploys to GitHub Pages via GitHub Actions:

1. **Push changes** to the `master` branch
2. **GitHub Actions** builds the Jekyll site
3. **Deploys** to `https://yourusername.github.io/academic-website/`

### Manual Deployment

```bash
cd academic-website/docs
bundle exec jekyll build
# Upload _site/ directory to your web server
```

## 🔧 Advanced Features

### Custom Domain Setup

1. Add `CNAME` file to `academic-website/docs/`:
   ```
   yourdomain.com
   ```
2. Configure DNS to point to GitHub Pages
3. Enable HTTPS in repository settings

### Analytics Integration

Add to `_config.yml`:
```yaml
google_analytics: "G-XXXXXXXXXX"
```

### PDF CV Generation

The site includes print-optimized CSS for generating PDF versions of your CV directly from the browser.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🆘 Support

- **Documentation**: Check the comprehensive guides in this README
- **Issues**: Report bugs and request features via [GitHub Issues](https://github.com/mechanicpanic/academic-website/issues)
- **Discussions**: Join conversations in [GitHub Discussions](https://github.com/mechanicpanic/academic-website/discussions)

## 🙏 Acknowledgments

- **Jekyll**: Static site generator that powers the website
- **Obsidian**: Outstanding note-taking app that enables seamless content management
- **Computer Modern Fonts**: Beautiful typography courtesy of [dreampulse/computer-modern-web-font](https://github.com/dreampulse/computer-modern-web-font)
- **GitHub Pages**: Free hosting for academic websites

---

**Built with ❤️ for the academic community**

*Creating beautiful, maintainable academic websites should be simple. This template provides everything you need to showcase your research and professional work with the elegance of LaTeX typography and the convenience of modern web technologies.*