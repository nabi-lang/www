# Contributing to the nabi-lang.org pages

This repository holds the pages of nabi-lang.org that do not change with a
release (home, download, roadmap), in English and Korean (`ko/`). It is
content only; the site is built by
[nabi-lang.org](https://github.com/nabi-lang/nabi-lang.org). Only `main` is
served.

## Keeping the editions in sync

A change to an English page is made to its Korean page under `ko/` in the
same pull request, with the same headings. If you cannot write the Korean,
say so in the pull request and a maintainer will add it before merging.

## Checks

Every `` ```nabi `` block is compiled and run, and every `` ```text check= ``
block compared with `nabi check` output, by the `content` workflow. To run
the same check locally, with a Nabi toolchain installed and
[nabi-lang/web](https://github.com/nabi-lang/web) cloned beside this
repository:

```sh
(cd ../web/tools/content && nabi build --release)
../web/tools/content/target/release/nabi_content check .
```

## Style

Plain and short. Examples are complete and run as written. "Nabi" in prose,
`nabi` for the command.

## Submitting

Open a pull request with the check above passing. The text is licensed
CC BY 4.0 (`LICENSE`); by contributing you agree to license your work the
same way.

## Sign your work

Nabi uses the [Developer Certificate of Origin 1.1](https://developercertificate.org/)
(DCO) instead of a CLA. By adding a `Signed-off-by` line to a commit you
certify that you wrote the change, or otherwise have the right to submit it
under this repository's license. `git commit -s` adds the line:

```text
Signed-off-by: Your Name <you@example.com>
```

Use your name and an email you can be reached at; the email must be the
commit's author email. The `DCO / Check sign-off` check fails a pull request with an
unsigned commit. To fix it, run `git commit --amend -s` (last commit) or
`git rebase --signoff main` (every commit), then push again. The full text
of the DCO is in the
[organization's CONTRIBUTING.md](https://github.com/nabi-lang/.github/blob/main/CONTRIBUTING.md#developer-certificate-of-origin).
