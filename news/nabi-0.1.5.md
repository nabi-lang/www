# Nabi 0.1.5: table builds again

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.5 fixes a regression in 0.1.4 that stopped the <code>table</code> package, and every project that depends on it, from building. Update with <code>nabi toolchain update</code>, or install again from the <a href="../download.html">download page</a>.</div>

In 0.1.4, `x ?? d` inside a branch where `x is none` or `x != none` had narrowed `x` failed with E0064, which 0.1.3 accepted. The `table` package uses that form, so a project with `table` among its dependencies failed with `could not build dependency` on 0.1.4. 0.1.5 compiles it again, and every package on the registry passes `nabi check` with it.

If you are on 0.1.4, update now. The full list of changes is in the [release notes](https://github.com/nabi-lang/nabi/releases/tag/v0.1.5).
