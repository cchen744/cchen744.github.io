# cchen744.github.io

Personal portfolio site — static HTML/CSS/JS, no build step. Showcases 5 geospatial
data science projects (spatial statistics, street networks, remote sensing, clustering,
web scraping).

## Files

- `index.html` — page content
- `style.css` — styling
- `script.js` — scroll-reveal animation (vanilla JS, no dependencies)

## Preview locally

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

## Deploy to GitHub Pages

This repo must be named **exactly** `cchen744.github.io` for GitHub Pages to serve it
automatically at `https://cchen744.github.io`.

1. Create an empty repo on GitHub named `cchen744.github.io` (no README/.gitignore/license).
2. From this folder:

```bash
git init
git add .
git commit -m "Initial portfolio site"
git branch -M main
git remote add origin https://github.com/cchen744/cchen744.github.io.git
git push -u origin main
```

3. In the repo's Settings → Pages, set source to `main` branch, `/ (root)`. The site
   goes live at `https://cchen744.github.io` within a minute or two.

Or use the included `PUSH_TO_GITHUB.sh` if you have GitHub CLI (`gh`) installed and
authenticated — it creates the repo and pushes in one step.

## Before you push

The project cards link to `https://github.com/cchen744/<repo-name>` for all 5 projects.
Those repos need to be pushed first (see `../PUSH_TO_GITHUB.sh` in the portfolio folder)
or the links will 404 until you do.
