#!/bin/bash
set -e

# Build the site (uncomment if you want the script to build automatically)
# jekyll build
# hugo

# Push the contents of _site to gh-pages, overwriting the remote branch
git push origin `git subtree split --prefix _site main`:gh-pages --force

echo "Deployment complete. Site should be live in a minute."
