# Chrome & Blood — site source

This folder is the GitHub Pages site (`https://qcargile.github.io/Chrome-Blood/`), served straight from `docs/` on `main`. Plain HTML/CSS/JS — no build step. Pushing to `main` deploys.

## Pages

| File | Content model |
|---|---|
| `index.html` | Baked. Marketing home: hero, stats, system pillars, profiles, gallery, links, credits |
| `install.html` | Baked. Mirrors the repo `README.md` install guide — keep in sync by hand |
| `mods.html` | Live-rendered from `Modlist/Load Order.md` at view time |
| `changelog.html` | Live-rendered from `changelog.md` at view time |
| `faq.html` | Live-rendered from `Modlist/FAQ.md` at view time |

Live-rendered pages fetch the raw markdown from this repo via `assets/site.js` (marked.js + DOMPurify from CDN), so editing those markdown files updates the site with no further work.

## Conventions

- Palette lives in `assets/style.css` `:root` and follows the Crimson Echo HUD Painter preset: `--primary #ff2e44` (crimson), `--secondary #c9d7f0` (chrome). The favicon/brand SVG hexes are duplicated in each page head.
- Nav, footer, and head blocks are identical across all pages — change them everywhere or nowhere.
- Images are pre-compressed JPEGs (`assets/img/`, gallery ≤ ~150 KB each). Never commit raw screenshots.
- All paths relative — the site serves under `/Chrome-Blood/`.
