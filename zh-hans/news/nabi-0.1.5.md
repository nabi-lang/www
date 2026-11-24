# Nabi 0.1.5：table 恢复构建

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.5 修复了 0.1.4 中的一个回归：<code>table</code> 包以及所有依赖它的项目都无法构建。用 <code>nabi toolchain update</code> 更新，或从<a href="../download.html">下载页面</a>重新安装。</div>

在 0.1.4 中，如果 `x` 已被 `x is none` 或 `x != none` 收窄，那么该分支中的 `x ?? d` 会报 E0064 错误，而 0.1.3 接受这种写法。`table` 包用到了这种写法，因此依赖 `table` 的项目在 0.1.4 上会以 `could not build dependency` 失败。0.1.5 恢复了对它的编译，注册表中的所有包都能在 0.1.5 上通过 `nabi check`。

如果您正在使用 0.1.4，请立即更新。完整的变更列表见[发布说明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.5)。
