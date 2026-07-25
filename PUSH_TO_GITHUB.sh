#!/usr/bin/env bash
#
# Push this portfolio site to github.com/cchen744/cchen744.github.io
#
# A) With GitHub CLI installed and logged in (`gh auth login`):
#       ./PUSH_TO_GITHUB.sh
#
# B) Without gh: create an empty repo named exactly "cchen744.github.io" on
#    github.com first (New repository -> do NOT add README/.gitignore/license),
#    then run:
#       ./PUSH_TO_GITHUB.sh
#
# Run from inside this folder. Repo name MUST be cchen744.github.io for
# GitHub Pages to auto-serve it at https://cchen744.github.io

set -e

USER="cchen744"
REPO="cchen744.github.io"

git init -q 2>/dev/null || true
git add .
git commit -m "Portfolio site" -q 2>/dev/null || echo "(nothing new to commit)"
git branch -M main

if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI detected — creating/pushing $USER/$REPO"
  gh repo create "$USER/$REPO" --public --source=. --remote=origin --push 2>/dev/null || {
    git remote add origin "https://github.com/$USER/$REPO.git" 2>/dev/null || true
    git push -u origin main
  }
else
  echo "GitHub CLI not found/authenticated."
  echo "Make sure you've created an EMPTY repo named '$REPO' on github.com first."
  read -p "Press Enter once it exists, or Ctrl+C to cancel..."
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/$USER/$REPO.git"
  git push -u origin main
fi

echo ""
echo "Done. Enable Pages: Settings -> Pages -> Source: main / (root)"
echo "Site will be live at https://$USER.github.io"
