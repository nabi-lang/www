# Nabi 0.1.1 and 0.1.2

<!-- date: 2026-11-22 -->

<div class="lead-sm">Two fix releases on the 0.1 line. A package now sees only its own dependencies, and packages whose types go through <code>any</code>, such as <code>spatial</code> and <code>sparse</code>, build as dependencies again. Update with <code>nabi toolchain update</code>, or install again from the <a href="../download.html">download page</a>.</div>

## A package sees only its own dependencies (0.1.1)

A package's bare `x::` paths reach only the packages it depends on, under the names it gives them. Before, such a path could resolve to any package in the build graph, so `table` 0.1.0 failed to build next to the `csv` package.

When a dependency and a child module share a name, `x::` is now an error that names both and says what to write instead: `::x::..` for the dependency, `pkg::x::..` for the module. The [paths chapter of the specification](docs:spec/index.html) and the guide's chapter on modules and packages say the rule in full.

0.1.1 also bundles the updated official packages: `table` 0.1.3, and `autodiff`, `linalg`, `ode`, `optimize`, `signal`, `sparse` and `stats` 0.1.1, whose tutorials moved into their API docs on [docs.nabi-lang.org/packages](https://docs.nabi-lang.org/packages).

## Packages that use `any` build again (0.1.2)

0.1.1 failed to build a project that depends on `spatial`, or on `spatial` and `sparse` together. The code `nabic` writes for a package's types stored in `any` now names them as that package sees them, and a package no longer carries that code for packages it does not depend on.

Also fixed:

- `any ::dep::Trait` parses as an `any` bound again; with a renamed dependency, `any al::Trait` failed.
- Changing only which dependencies a package sees now rebuilds it; before, the build reused a stale result.

The full lists are in the release notes of [0.1.1](https://github.com/nabi-lang/nabi/releases/tag/v0.1.1) and [0.1.2](https://github.com/nabi-lang/nabi/releases/tag/v0.1.2).
