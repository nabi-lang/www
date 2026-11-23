# 常见问题

<div class="lead-sm">大家最先会问到的问题，以及简短的回答。当前版本的全貌见 <a href="news/nabi-0.1.0.html">0.1.0 发布公告</a>。</div>

## 为什么又要一门新语言？

Nabi 源于一个动机：用一门语言完成作者想做的所有事情。它不面向特定人群，也不为某种学术立场辩护。[语言规范](docs:spec/index.html)写明了所有设计决策最终依据的两条原则：精简的核心配上丰富的库，以及清晰的规则，并在规则之内给你自由。落到实践中，就是静态类型、封闭的和类型、没有 null、错误写在函数签名中、没有隐式数值提升，以及用垃圾回收器免去手动管理内存。

如果你已经在用一门满意的语言，Nabi 并不声称要取代它。[写给 Python 开发者的 Nabi](docs:learn/nabi-for-python.html) 和[写给 Rust 开发者的 Nabi](docs:learn/nabi-for-rust.html) 展示了它在日常代码中与这两门语言的对比。

## 为什么不用 LLVM？

为了让一个压缩包就是完整的工具链。`nabic` 自己生成机器码并完成链接，每个压缩包都带有所有已支持目标的运行时，因此 `nabi build --target <triple>` 可以在任何主机上交叉编译，无需安装系统链接器、C 编译器或 SDK（Apple 目标仍需要 Apple 的 SDK，Android 目标需要 NDK）。这也让编译器、链接器和运行时处在同一个代码库中，项目可以同步修改它们。

代价是代码生成器还比较年轻。Nabi 目前没有发布与基于 LLVM 的编译器的性能对比；请针对你自己的工作负载进行测量。可选的 LLVM 后端计划在 0.2 系列推出，作为组件安装、按构建配置选择（见[路线图](roadmap.html)）；默认仍是 Nabi 自己的代码生成器。

## 什么是稳定的？

1.0 之前没有任何部分是冻结的。对于 0.x，Nabi 遵循 Cargo 对语义化版本的解读：破坏性变更通过次版本号体现。0.2.0 可能破坏为 0.1 编写的代码；0.1.1、0.1.2 等版本增加功能和修复，但不会破坏它。在 1.0 之前，每个次版本都可能带来破坏性变更，具体变更列在发布说明中。

只有最新的系列会获得 bug 修复和安全修复。旧的压缩包仍可下载。`nabi toolchain update` 会把你升级到最新版本，包的 `toolchain` 字段可以固定构建它所用的系列。

## 支持哪些平台？

工具链在 8 个主机上运行：Apple 芯片上的 macOS；x64 和 arm64 上的 Windows 11；x64 和 arm64 上的 Linux（glibc 2.34+ 或静态 musl）；以及 x64 上的 FreeBSD 14+。它可以为 17 个已支持目标构建，在主机之外还包括 32 位 x86 Linux 和 Windows、32 位 ARM Linux、三个 WebAssembly 目标、Android x86-64 和 iOS 模拟器。另有六个目标（Android 和 iOS 设备、riscv64、ppc64le、s390x 和嵌入式 RISC-V）正在进行中：在真实硬件上运行之前，`--target` 会拒绝它们。完整的表格见[下载页面](download.html#平台)。

不支持 Intel Mac、32 位主机和 arm64 上的 FreeBSD。

## 包和注册表是怎么运作的？

一个包就是一个带有 `nabi.nabion` 清单的目录。`nabi add <name>` 从 [packages.nabi-lang.org](https://packages.nabi-lang.org) 添加依赖，`nabi.lock` 记录确切的版本，`nabi update` 更新它们。注册表的索引是一个 git 仓库 [nabi-lang/packages-index](https://github.com/nabi-lang/packages-index)：每个版本指向包自身仓库的一个提交，注册表保存该提交的压缩包及其 SHA-256，`nabi` 在下载时会校验它。

20 个官方包（`json`、`http`、`regex`、`table`、`stats`、`plot` 等）随工具链提供。使用某个官方包的代码在首次使用时会自动把它加入清单，无需 `nabi add`，也无需联网。

`nabi publish` 把一个版本发送到注册表。目前只有注册表的维护者可以发布；任何人都可以登录并使用包。见[发布包](docs:learn/18-features-and-publishing.html#发布包)。

## 许可证是什么？

编译器、工具、运行时、标准库和官方包采用 `MIT OR Apache-2.0`，由你选择。语言规范、文档和本网站的文字采用 CC BY 4.0。你用 Nabi 构建的程序可以按你的意愿授权；发布压缩包中还包含第三方运行时组件（musl、wasi-libc 等），它们各自采用自己的许可证，列在 [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES) 中。

## 如何验证下载的文件？

每个版本都有一个用 minisign 签名的 `SHA256SUMS` 文件，并为每个压缩包提供 GitHub 构建来源证明。步骤和公钥见[下载页面](download.html#验证下载的文件)。安装脚本会校验所下载压缩包的 SHA-256。

## 如何报告安全问题？

不要在公开的 issue 中报告。请使用 GitHub 的私密漏洞报告（仓库的 **Security** 标签页，**Report a vulnerability**），或写信到 security@nabi-lang.org。相关政策见 [SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md)。TLS 栈和 `core::crypto` 尚未经过独立审计，欢迎报告与它们有关的问题。

## 在哪里提问或参与？

在 [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions) 中提问，以 issue 的形式报告 bug。要贡献代码或文档，请阅读 [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md)：每个提交都要带 DCO 签署（`git commit -s`），不需要签 CLA。
