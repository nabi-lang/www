# nabi-lang.org pages

[![Content](https://github.com/nabi-lang/www/actions/workflows/content.yml/badge.svg)](https://github.com/nabi-lang/www/actions/workflows/content.yml) [![License: CC BY 4.0](https://img.shields.io/badge/license-CC%20BY%204.0-blue)](LICENSE)

*Clear rules, free as a butterfly.*

Content for the pages of nabi-lang.org that do not change with a release: the home page, download, roadmap, FAQ and news, with their Korean editions in `ko/` (served under `/ko/`). The site renders these files; this repository holds only content. The home page's body is built by the site itself, so `index.md` gives only its title.

Only `main` is served. Versioned docs live in [nabi-lang/docs](https://github.com/nabi-lang/docs).

`news/` holds the posts (`news/<name>.md`, Korean ones in `ko/news/`); the site lists them on `news/index.md`'s page, newest first. A post's second line is `<!-- date: YYYY-MM-DD -->`, or `<!-- date: unreleased -->` until it goes out: set the date when the release it announces is published. `faq.md` is the FAQ.
