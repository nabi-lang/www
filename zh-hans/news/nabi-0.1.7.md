# Nabi 0.1.7：`->` 成为运算符

<!-- date: 2026-11-28 -->

<div class="lead-sm">在 Nabi 0.1.7 中，trait 可以把两个值之间的 <code>-></code> 绑定为运算符，因此单位换算写作 <code>5km -> mi</code>，无需输入 Unicode 箭头。用 <code>nabi toolchain update</code> 更新，或从<a href="../download.html">下载页面</a>重新安装。</div>

在 trait 方法上加 `#[infix("->", like = "|")]`，`a -> b` 就会调用它，就像 `@` 和 `~` 已经可以绑定一样。返回类型仍写作 `->`（`fn f() -> T`）。在 match 守卫中，`n if n > 2 -> 1` 仍会被报告为写错的 `=>`；在守卫里请写 `(a -> b)`。

`units` 0.1.2 用 `->` 换算（`1km + 500m -> m`），需要 0.1.7 或更新版本。在项目中运行 `nabi update` 即可获取。写作 `→` 的 `units` 0.1.1 仍可构建。

完整的变更列表见[发布说明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.7)。
