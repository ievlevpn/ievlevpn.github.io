#!/bin/bash
# Local development server for Jekyll site

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"

bundle exec jekyll serve --host 127.0.0.1 --port 4000 --livereload
