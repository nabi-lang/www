# Nabi 0.1.6: clearer errors for mixing units

<!-- date: 2026-11-28 -->

<div class="lead-sm">Nabi 0.1.6 says plainly when two types differ only in their const parameters, and bundles the <code>units</code> package 0.1.1. Update with <code>nabi toolchain update</code>, or install again from the <a href="../download.html">download page</a>.</div>

With `units`, `10kg + 3m` was rejected, but the help note named two copies of the same generic type. 0.1.6 says they are two different types, and uses your aliases, so the note reads `Mass` and `Length`. The same applies to your own types built on const parameters.

`units` 0.1.1 converts to smaller units exactly: `(10kg + 540g).value_in(g)` is `10540`, not `10539.999999999998`.

The full list of changes is in the [release notes](https://github.com/nabi-lang/nabi/releases/tag/v0.1.6).
