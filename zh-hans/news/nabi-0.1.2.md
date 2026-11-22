# Nabi 0.1.1 和 0.1.2

<!-- date: 2026-11-22 -->

<div class="lead-sm">0.1 系列的两个修复版本。现在每个包只能看到自己的依赖，类型经过 <code>any</code> 的包（如 <code>spatial</code> 和 <code>sparse</code>）再次可以作为依赖构建。用 <code>nabi toolchain update</code> 更新，或从<a href="../download.html">下载页面</a>重新安装。</div>

## 每个包只能看到自己的依赖（0.1.1）

一个包中不带前缀的 `x::` 路径只能访问它所依赖的包，并使用它为这些包所起的名字。此前，这样的路径可能解析到构建图中的任何包，因此 `table` 0.1.0 与 `csv` 包同时存在时无法构建。

当一个依赖和一个子模块同名时，`x::` 现在会报错，错误信息会列出两者，并说明应该怎么写：依赖写作 `::x::..`，模块写作 `pkg::x::..`。[语言规范的路径一章](docs:spec/index.html)和指南中关于模块和包的一章完整说明了这条规则。

0.1.1 还附带了更新后的官方包：`table` 0.1.3，以及 `autodiff`、`linalg`、`ode`、`optimize`、`signal`、`sparse` 和 `stats` 0.1.1，它们的教程已移入 [docs.nabi-lang.org/packages](https://docs.nabi-lang.org/packages) 上各自的 API 文档。

## 使用 `any` 的包再次可以构建（0.1.2）

0.1.1 无法构建依赖 `spatial` 的项目，或同时依赖 `spatial` 和 `sparse` 的项目。现在，`nabic` 为存放在 `any` 中的包类型生成的代码，会按该包所看到的名字来命名这些类型；一个包也不再为它不依赖的包携带这类代码。

另外修复了：

- `any ::dep::Trait` 再次被解析为 `any` 约束；对于重命名的依赖，`any al::Trait` 之前会失败。
- 只改变包能看到哪些依赖时，现在会重新构建该包；此前构建会复用过时的结果。

完整列表见 [0.1.1](https://github.com/nabi-lang/nabi/releases/tag/v0.1.1) 和 [0.1.2](https://github.com/nabi-lang/nabi/releases/tag/v0.1.2) 的发布说明。
