# Governance

<div class="lead-sm">Who decides what goes into Nabi today, and how a change gets in.</div>

## Who decides

[DaminStudio](https://daminstudio.com) started Nabi and maintains it: its maintainers review and merge changes, decide what each release holds, and cut the releases. There is no foundation, steering group or RFC process yet. If Nabi grows a wider group of maintainers, this page will say so and how they are chosen.

## How a change gets in

- Bugs and small changes: an [issue](https://github.com/nabi-lang/nabi/issues), or a pull request directly.
- Changes to the language or the standard library: start in [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions) or an issue, so the design is settled before the code. The [specification](https://github.com/nabi-lang/spec) defines the language; a change in observable behavior updates it in English and Korean in the same change.
- Every pull request passes the repository's checks and carries a DCO sign-off; [Community](community.html#contributing) has the details.

The reasons behind a decision are written where it is made: in the issue, the discussion or the pull request.

## Releases

Before 1.0, the minor version is the breaking slot: 0.2.0 may break code written for 0.1, while 0.1.x releases add features and fixes without breaking it. A version ships when its work is done; the [roadmap](roadmap.html) shows the order, and each release's notes are on [Releases](releases/index.html). Only the latest series gets fixes.

## Packages

The official packages are published from the [nabi-lang](https://github.com/nabi-lang) organization and maintained like the toolchain. Other packages on [packages.nabi-lang.org](https://packages.nabi-lang.org) belong to their owners; the registry's [usage policy](https://packages.nabi-lang.org/policy) says what it accepts and how a package is taken down.
