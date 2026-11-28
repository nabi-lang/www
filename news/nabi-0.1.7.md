# Nabi 0.1.7: `->` as an operator

<!-- date: 2026-11-28 -->

<div class="lead-sm">In Nabi 0.1.7 a trait can bind <code>-></code> between two values, so a unit conversion reads <code>5km -> mi</code> with no Unicode arrow to type. Update with <code>nabi toolchain update</code>, or install again from the <a href="../download.html">download page</a>.</div>

`#[infix("->", like = "|")]` on a trait method makes `a -> b` call it, as `@` and `~` can already be bound. A return type keeps `->` (`fn f() -> T`). In a match guard, `n if n > 2 -> 1` is still reported as a mistyped `=>`; write `(a -> b)` there.

`units` 0.1.2 converts with `->` (`1km + 500m -> m`) and needs 0.1.7. Run `nabi update` in a project to get it. `units` 0.1.1, which spells it `→`, still builds.

The full list of changes is in the [release notes](https://github.com/nabi-lang/nabi/releases/tag/v0.1.7).
