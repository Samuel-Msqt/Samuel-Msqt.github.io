#!/bin/bash
set -e

# Detect current branch (main, master, etc.)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Deploying from branch: $CURRENT_BRANCH"

# Make sure we have the latest changes from remote
echo "Pulling latest changes from origin/$CURRENT_BRANCH..."
git pull --rebase origin $CURRENT_BRANCH

# Push source branch to GitHub
echo "Pushing source branch to origin..."
git push origin $CURRENT_BRANCH

# Clean and rebuild the site
echo "Cleaning and rebuilding site..."
rm -rf _site
# bundle exec jekyll build

# Ensure production environment so generated URLs and sitemap use the real site URL
echo "Building site with JEKYLL_ENV=production..."
JEKYLL_ENV=production bundle exec jekyll build

# If a CNAME exists at repo root, copy it into the generated site so GitHub Pages
# preserves the custom domain when we push the _site subtree.
if [ -f CNAME ]; then
	echo "Copying CNAME into _site to preserve custom domain..."
	cp CNAME _site/CNAME
fi

# Push the contents of _site to gh-pages, overwriting the remote branch
echo "Deploying _site to gh-pages..."
git push origin "$(git subtree split --prefix _site $CURRENT_BRANCH)":gh-pages --force

echo "Deployment complete. Site should be live in a minute."