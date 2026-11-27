# Nabi 0.1.6：混用单位时的错误更清楚

<!-- date: 2026-11-28 -->

<div class="lead-sm">Nabi 0.1.6 会明确指出仅 const 参数不同的两个类型是不同的类型，并附带 <code>units</code> 包 0.1.1。用 <code>nabi toolchain update</code> 更新，或从<a href="../download.html">下载页面</a>重新安装。</div>

使用 `units` 时，`10kg + 3m` 会被拒绝，但帮助信息显示的是同一泛型类型的两个写法。0.1.6 会说明它们是两个不同的类型，并沿用您的别名，显示为 `Mass` 和 `Length`。用 const 参数定义的自定义类型同样适用。

`units` 0.1.1 换算到更小的单位时结果精确：`(10kg + 540g).value_in(g)` 是 `10540`，而不是 `10539.999999999998`。

完整的变更列表见[发布说明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.6)。
