#!/bin/bash
set -e

# Detect current branch (main or master, etc.)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Build the site
bundle exec jekyll build

# Push the source repo to GitHub
git push origin $CURRENT_BRANCH

# Push the contents of _site to gh-pages, overwriting the remote branch
git push origin `git subtree split --prefix _site $CURRENT_BRANCH`:gh-pages --force

echo "Deployment complete. Site should be live in a minute."
