# 下载 Nabi

<div class="lead-sm">Nabi {release}：一行命令即可安装，也可以从下方获取压缩包。工具链自成一体：<code>nabic</code> 自带代码生成器和链接器。</div>

## 安装脚本

macOS、Linux 和 FreeBSD：

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11（x64 或 arm64），在 PowerShell 中运行：

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

脚本会为你的机器选择压缩包（在 Windows 上按机器的架构选择，因此即使在模拟运行的 x64 PowerShell 中也会选 arm64），校验其 SHA-256，然后解压到 `~/.nabi`（Windows：`%USERPROFILE%\.nabi`）。`install.sh --version <v>` 和 `install.ps1 -Version <v>` 按确切版本号（`{release}`）选择版本；不指定时安装最新版本。

工具链自带官方包，因此使用官方包的代码无需联网即可构建。如果不想安装它们：运行 `curl -fsSL https://nabi.sh | sh -s -- --no-packages`，或在运行任一脚本前设置 `NABI_NO_PACKAGES=1`（从文件运行时用 `install.ps1 -NoPackages`）。这会在安装完成后运行 `nabi component remove packages`。

## 如果 GitHub 访问缓慢或受阻

版本默认从 GitHub 下载。`dist.nabi-lang.org` 以相同的目录结构镜像了每一个版本；设置 `NABI_DIST` 即可改为从镜像下载：

```sh
curl -fsSL https://nabi.sh | NABI_DIST=https://dist.nabi-lang.org sh
```

在 PowerShell 中：

```powershell
$env:NABI_DIST = "https://dist.nabi-lang.org"
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

`nabi toolchain update` 也会读取 `NABI_DIST`，因此若要一直通过镜像更新，请把它写进 shell 配置文件（Windows：设为用户环境变量）。从镜像下载的文件同样会用该版本的 `SHA256SUMS` 校验；装有 `minisign` 时还会校验其签名。下方的压缩包在镜像上的路径相同：把 `https://github.com/nabi-lang/nabi/releases` 换成 `https://dist.nabi-lang.org` 即可。

## 压缩包

<div class="dl">
<div class="dl-os"><span class="dl-glyph os-apple" aria-hidden="true"></span><h3>macOS</h3><p>Apple 芯片</p><code>aarch64-apple-darwin</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64, glibc 2.34+</p><code>x86_64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64, glibc 2.34+</p><code>aarch64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64，静态（musl）</p><code>x86_64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64，静态（musl）</p><code>aarch64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, x64</p><code>x86_64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, arm64</p><code>aarch64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-freebsd" aria-hidden="true"></span><h3>FreeBSD</h3><p>x86_64，FreeBSD 14 或更高版本</p><code>x86_64-unknown-freebsd</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz.sha256">.tar.gz sha256</a></p></div>
</div>

每个压缩包旁边都有一个 `.sha256` 文件。先校验，再用压缩包安装：

```sh
shasum -a 256 -c nabi-{release}-aarch64-apple-darwin.tar.xz.sha256
sh install.sh --archive nabi-{release}-aarch64-apple-darwin.tar.xz
```

`.tar.xz` 约为 `.tar.gz` 的一半大小；在 Linux 上，tar 需要 `xz` 才能解压。压缩包解压后，也可以直接运行其中的 `install.sh`（Windows：`install.ps1`）完成安装。

## 验证下载的文件

安装脚本会校验所下载压缩包的 SHA-256。如果要自己校验压缩包，每个版本还提供：

- `SHA256SUMS`：该版本所有压缩包的 SHA-256，用 [minisign](https://jedisct1.github.io/minisign/) 签名，签名在 `SHA256SUMS.minisig` 中；
- 每个压缩包的 GitHub 构建来源证明，把压缩包与构建它的发布工作流运行关联起来。

发布签名密钥（密钥 ID `B33E6FE61BE5314C`）：

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

从[版本页面](https://github.com/nabi-lang/nabi/releases/tag/v{release})下载 `SHA256SUMS` 和 `SHA256SUMS.minisig`，放到压缩包所在的目录，然后验证签名和校验和：

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS            # Linux, FreeBSD
shasum -a 256 -c --ignore-missing SHA256SUMS        # macOS
```

在 Windows 上，在 PowerShell 中使用 minisign [发布页面](https://github.com/jedisct1/minisign/releases)提供的 `minisign.exe`：

```powershell
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
(Get-FileHash nabi-{release}-x86_64-pc-windows-msvc.zip -Algorithm SHA256).Hash.ToLower()
Select-String nabi-{release}-x86_64-pc-windows-msvc.zip SHA256SUMS
```

两个哈希值必须一致。使用 [GitHub CLI](https://cli.github.com) 可以验证压缩包的来源证明：

```sh
gh attestation verify nabi-{release}-aarch64-apple-darwin.tar.xz --repo nabi-lang/nabi
```

二进制文件目前还没有代码签名（没有 macOS 公证，也没有 Windows Authenticode），因此对于用浏览器下载的压缩包，Gatekeeper 和 SmartScreen 会发出警告。目前请用上述校验方式确认下载的文件可信。

## 平台

一个目标在其真实环境中通过测试后即为“已支持”。主机是运行工具链的平台，每个主机都有发布压缩包；构建目标是 `nabi build --target <triple>` 编译的目标平台。

| 主机 | triple | 级别 |
|------|--------|------|
| macOS，Apple 芯片 | `aarch64-apple-darwin` | 已支持 |
| Windows 11，x64 | `x86_64-pc-windows-msvc` | 已支持 |
| Windows 11，arm64 | `aarch64-pc-windows-msvc` | 已支持 |
| Linux x64，glibc 2.34+ | `x86_64-unknown-linux-gnu` | 已支持 |
| Linux arm64，glibc 2.34+ | `aarch64-unknown-linux-gnu` | 已支持 |
| Linux x64，静态（musl） | `x86_64-unknown-linux-musl` | 已支持 |
| Linux arm64，静态（musl） | `aarch64-unknown-linux-musl` | 已支持 |
| FreeBSD 14+，x64 | `x86_64-unknown-freebsd` | 已支持 |

| 构建目标 | triple | 级别 |
|--------------|--------|------|
| 上述 8 个主机 | | 已支持 |
| Linux x86，32 位 | `i686-unknown-linux-gnu` | 已支持 |
| Windows x86，32 位 | `i686-pc-windows-msvc` | 已支持 |
| Linux ARMv7，硬浮点 | `armv7-unknown-linux-gnueabihf` | 已支持 |
| Linux ARMv7，硬浮点，静态 | `armv7-unknown-linux-musleabihf` | 已支持 |
| WebAssembly，浏览器 | `wasm32-unknown-unknown` | 已支持 |
| WebAssembly，WASI preview 2 | `wasm32-wasip2` | 已支持 |
| WebAssembly，带线程的 WASI preview 1 | `wasm32-wasip1-threads` | 已支持 |
| Android x86-64（模拟器），API 29+ | `x86_64-linux-android` | 已支持 |
| iOS 模拟器，Apple 芯片 | `aarch64-apple-ios-sim` | 已支持 |
| Android arm64 设备 | `aarch64-linux-android` | 进行中 |
| iOS 设备 | `aarch64-apple-ios` | 进行中 |
| Linux RISC-V 64 | `riscv64gc-unknown-linux-gnu` | 进行中 |
| Linux IBM Power，小端 | `powerpc64le-unknown-linux-gnu` | 进行中 |
| Linux IBM Z | `s390x-unknown-linux-gnu` | 进行中 |
| 嵌入式 RISC-V 32，无操作系统 | `riscv32imac-unknown-none-elf` | 进行中 |

进行中的目标只在模拟环境中运行过；`--target` 会拒绝它们，并说明目前该用什么。[路线图](roadmap.html)把它们排在 0.2 系列。

只需下载适用于你自己机器的那一个压缩包：每个压缩包都带有所有已支持构建目标的运行时，因此在任何主机上都可以用 `nabi build --target <triple>` 为其他目标构建（Apple 目标只能在 macOS 上构建；Android 目标需要 NDK）。`nabic --print target-list` 会列出所有 triple。各目标的要求见[工具](docs:spec/refs-lang/009-tools/index.html)。

## 其他要求

- macOS：Xcode Command Line Tools（`xcode-select --install`），提供链接所需的 SDK。
- Linux：无需其他软件；需要 glibc 2.34 或更高版本（Ubuntu 22.04、Debian 12、RHEL 9 及更新版本），使用静态 musl 压缩包则任何发行版均可。
- FreeBSD：x86_64 上的 FreeBSD 14 或更高版本，安装脚本还需要 `curl`（`pkg install curl`）。
- Windows：x64 或 arm64 上的 Windows 11；无其他要求。

Intel Mac 和 arm64 上的 FreeBSD 没有发布压缩包，也不是构建目标。所有版本及其发布说明都在 [GitHub](https://github.com/nabi-lang/nabi/releases) 上。有疑问请看[常见问题](faq.html)。下一步：[入门](docs:learn/01-getting-started.html)。
