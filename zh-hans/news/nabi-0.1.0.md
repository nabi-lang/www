# Nabi 0.1.0 发布

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.0 是 Nabi 的第一个版本：一门编译型语言、它的工具链、一个包注册表，以及围绕它们的网站。本文介绍其中包含什么、在哪些平台上运行、哪些尚未完成，以及如何参与。</div>

## Nabi 是什么

Nabi 是一门静态类型的编译型语言，具有封闭的和类型，没有 null，错误写在函数签名中。程序是带有垃圾回收运行时的原生可执行文件（或 WebAssembly 模块）。其设计遵循[语言规范](docs:spec/index.html)中的两条原则：精简的核心配上丰富的库，以及清晰的规则，并在规则之内给用户自由。类型、分派、内存模型和求值顺序由语言一次性确定；库的设计、领域建模和代码结构则交给你。

第一个程序：

```sh
nabi new hello
cd hello
nabi run
```

## 0.1.0 包含什么

- 编译器 `nabic`。它有自己的代码生成器和链接器：不依赖 LLVM、系统链接器或 C 编译器。内置的 C 前端可以为 `nabi bindgen` 读取 C 头文件，并通过 `nabi cc` 编译 C 源文件。
- 构建与包管理工具 `nabi`：`new`、`build`、`run`、`test`、`bench`、`fmt`、`lint`、`doc`、`add`、`publish`、用于安装和切换版本的 `toolchain` 等（`nabi help` 会列出全部命令）。
- 语言服务器 `nabils`、REPL（`nabi repl`）和 Jupyter 内核（`nabi jupyter install`）。
- 运行时，带有支持多线程的分代、移动式垃圾回收器，以及异步任务。
- 分为 `bare`、`core` 和 `std` 三层的标准库：集合类型、文本、数值、时间、文件、进程、网络和 TLS。其 API 见 [docs.nabi-lang.org](docs:std/index.html)。
- 包注册表 [packages.nabi-lang.org](https://packages.nabi-lang.org)，带有 20 个官方包：`autodiff`、`csv`、`http`、`interpolate`、`json`、`linalg`、`markdown`、`nabi-syntax`、`ode`、`optimize`、`plot`、`regex`、`signal`、`sparse`、`spatial`、`special`、`stats`、`table`、`toml` 和 `units`。它们随工具链提供：使用某个官方包的代码在首次使用时会自动把它加入清单，无需联网。
- 通过 `nabils` 提供的编辑器支持：[VS Code](https://github.com/nabi-lang/nabi.vscode)、[Vim](https://github.com/nabi-lang/nabi.vim) 和 [Zed](https://github.com/nabi-lang/nabi.zed)。
- [Playground](https://playground.nabi-lang.org)，它把程序编译为 WebAssembly 并在浏览器中运行。
- 文档：指南、示例、语言和标准库规范、标准库 API，以及每个错误码各一页的说明，提供英文和韩文版本。

## 平台

工具链在 8 个主机上运行，每个主机一个发布压缩包：

| 主机 | triple |
|------|--------|
| macOS，Apple 芯片 | `aarch64-apple-darwin` |
| Windows 11，x64 | `x86_64-pc-windows-msvc` |
| Windows 11，arm64 | `aarch64-pc-windows-msvc` |
| Linux x64，glibc 2.34+ | `x86_64-unknown-linux-gnu` |
| Linux arm64，glibc 2.34+ | `aarch64-unknown-linux-gnu` |
| Linux x64，静态（musl） | `x86_64-unknown-linux-musl` |
| Linux arm64，静态（musl） | `aarch64-unknown-linux-musl` |
| FreeBSD 14+，x64 | `x86_64-unknown-freebsd` |

它可以为 17 个已支持目标构建：这 8 个主机，加上 `i686-unknown-linux-gnu`、`i686-pc-windows-msvc`、`armv7-unknown-linux-gnueabihf`、`armv7-unknown-linux-musleabihf`、`wasm32-unknown-unknown`（浏览器）、`wasm32-wasip2`、`wasm32-wasip1-threads`、`x86_64-linux-android`（在模拟器上测试）和 `aarch64-apple-ios-sim`（iOS 模拟器）。一个目标在其真实环境中通过测试后即为已支持。每个压缩包都带有所有已支持目标的运行时，因此 `nabi build --target <triple>` 可以在任何主机上交叉编译；Apple 目标只能在 macOS 上构建，Android 目标需要 NDK。

有六个目标正在进行中。代码已经就绪，但它们只在模拟环境中运行过，因此 `--target` 会拒绝它们，并说明目前该用什么：

- `aarch64-linux-android`（Android 设备）
- `aarch64-apple-ios`（iOS 设备）
- `riscv64gc-unknown-linux-gnu`
- `powerpc64le-unknown-linux-gnu`
- `s390x-unknown-linux-gnu`
- `riscv32imac-unknown-none-elf`（嵌入式 RISC-V）

[路线图](../roadmap.html)把它们排在 0.2 系列。

## 稳定性

Nabi 处于 1.0 之前，对于 0.x 遵循 Cargo 对语义化版本的解读：次版本号是破坏性变更的位置。0.2.0 可能破坏为 0.1 编写的代码；0.1.1、0.1.2 等版本增加功能和修复，但不会破坏它。在 1.0 之前，每个次版本都可能有破坏性变更。只有最新的系列会得到修复，包括安全修复。

## 安装

macOS、Linux 和 FreeBSD：

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11（x64 或 arm64），在 PowerShell 中运行：

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

脚本会为你的机器选择压缩包，校验其 SHA-256，然后解压到 `~/.nabi`（Windows：`%USERPROFILE%\.nabi`）。[下载页面](../download.html)提供压缩包和其他安装方式；Nix 用户可以运行 `nix profile install github:nabi-lang/nabi`。

## 验证下载的文件

每个版本都有一个 `SHA256SUMS` 文件，用 [minisign](https://jedisct1.github.io/minisign/) 签名（`SHA256SUMS.minisig`），并为每个压缩包提供 GitHub 构建来源证明。发布签名密钥：

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS
gh attestation verify nabi-0.1.0-x86_64-unknown-linux-gnu.tar.xz --repo nabi-lang/nabi
```

各系统的具体步骤见[下载页面](../download.html#验证下载的文件)。

## 已知限制

- TLS 栈和 `core::crypto` 中的密码学实现是 Nabi 自己的代码，已用 NIST CAVP 和 Wycheproof 测试向量测试，但尚未经过独立审计。请将它们视为实验性的，暂时不要依赖它们保护真正的机密。
- 二进制文件没有代码签名：目前既没有 macOS 公证，也没有 Windows Authenticode。对于用浏览器下载的压缩包，Gatekeeper 和 SmartScreen 会发出警告；`curl | sh` 和 `irm | iex` 安装方式不受影响。目前请用上述 minisign 签名和来源证明来校验下载的文件。
- 有六个目标正在进行中（见上文）。
- 目前只有注册表的维护者可以发布包。任何人都可以登录并使用包；对于尚不能发布的账户，`nabi login` 会给出说明。
- 为 `-gnu` Linux 目标构建的程序需要 glibc 2.34 或更高版本。在较旧的系统上，安装程序会选择静态 musl 压缩包。
- 工具链的构建缓存上限为 5 GiB；设置 `NABI_CACHE_MAX_SIZE`（`2G`、`off`）可以修改上限，`nabi cache prune` 或 `nabi cache clean` 可以缩减缓存。
- Nabi 目前没有公开的性能对比。它的代码生成器还很年轻；请自己测量你的工作负载。

## 参与进来

- 提问、想法和作品展示：[GitHub Discussions](https://github.com/nabi-lang/nabi/discussions)。
- bug：在相关仓库中提交 [issue](https://github.com/nabi-lang/nabi/issues)。
- 代码和文档：请阅读 [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md)。每个提交都要带 DCO 签署（`git commit -s`）；不需要签 CLA。
- 安全问题：不要公开报告。请使用 GitHub 的私密漏洞报告，或写信至 security@nabi-lang.org（[SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md)）。
- 常见问题：见[常见问题](../faq.html)。

## 致谢

感谢所有试用早期构建、报告问题和审阅文档草稿的人，也感谢 Nabi 借鉴和依托的项目：编写 Nabi 所用的 Rust 工具链，以及 musl、wasi-libc、mingw-w64 和 [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES) 中列出的其他项目。
