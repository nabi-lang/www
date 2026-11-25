# 下載 Nabi

<div class="lead-sm">Nabi {release}：一行指令即可安裝，也可以從下方取得壓縮檔。工具鏈自成一體：<code>nabic</code> 內建程式碼產生器與連結器。</div>

## 安裝指令碼

macOS、Linux 與 FreeBSD：

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11（x64 或 arm64），在 PowerShell 中執行：

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

指令碼會為你的電腦挑選壓縮檔（在 Windows 上依電腦的架構挑選，因此即使在模擬執行的 x64 PowerShell 中也會選 arm64），檢查其 SHA-256，再解壓縮到 `~/.nabi`（Windows：`%USERPROFILE%\.nabi`）。`install.sh --version <v>` 與 `install.ps1 -Version <v>` 依確切的版本號（`{release}`）挑選版本；未指定時安裝最新版本。

工具鏈內含官方套件，因此使用官方套件的程式碼不需網路即可建置。若不想安裝官方套件，可以執行 `curl -fsSL https://nabi.sh | sh -s -- --no-packages`，或在執行任一指令碼前設定 `NABI_NO_PACKAGES=1`（從檔案執行時用 `install.ps1 -NoPackages`）。這會在安裝完成後執行 `nabi component remove packages`。

## 如果 GitHub 連線緩慢或受阻

版本預設從 GitHub 下載。`dist.nabi-lang.org` 以相同的目錄結構鏡像了每一個版本；設定 `NABI_DIST` 即可改從鏡像下載：

```sh
curl -fsSL https://nabi.sh | NABI_DIST=https://dist.nabi-lang.org sh
```

在 PowerShell 中：

```powershell
$env:NABI_DIST = "https://dist.nabi-lang.org"
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

`nabi toolchain update` 也會讀取 `NABI_DIST`，因此若要一直透過鏡像更新，請把它寫進 shell 設定檔（Windows：設為使用者環境變數）。從鏡像下載的檔案同樣會以該版本的 `SHA256SUMS` 檢查；安裝了 `minisign` 時也會檢查其簽章。下方的壓縮檔在鏡像上的路徑相同：把 `https://github.com/nabi-lang/nabi/releases` 換成 `https://dist.nabi-lang.org` 即可。

## 壓縮檔

<div class="dl">
<div class="dl-os"><span class="dl-glyph os-apple" aria-hidden="true"></span><h3>macOS</h3><p>Apple 晶片</p><code>aarch64-apple-darwin</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64, glibc 2.34+</p><code>x86_64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64, glibc 2.34+</p><code>aarch64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64，靜態（musl）</p><code>x86_64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64，靜態（musl）</p><code>aarch64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, x64</p><code>x86_64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, arm64</p><code>aarch64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-freebsd" aria-hidden="true"></span><h3>FreeBSD</h3><p>x86_64，FreeBSD 14 以上</p><code>x86_64-unknown-freebsd</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz.sha256">.tar.gz sha256</a></p></div>
</div>

每個壓縮檔旁都有一個 `.sha256` 檔案。先檢查，再從壓縮檔安裝：

```sh
shasum -a 256 -c nabi-{release}-aarch64-apple-darwin.tar.xz.sha256
sh install.sh --archive nabi-{release}-aarch64-apple-darwin.tar.xz
```

`.tar.xz` 約為 `.tar.gz` 的一半大小；在 Linux 上，tar 需要 `xz` 才能解壓縮。壓縮檔解開後，也可以直接執行其中的 `install.sh`（Windows：`install.ps1`）完成安裝。

## 驗證下載的檔案

安裝指令碼會檢查所下載壓縮檔的 SHA-256。若要自行檢查壓縮檔，每個版本另外提供：

- `SHA256SUMS`：該版本所有壓縮檔的 SHA-256，以 [minisign](https://jedisct1.github.io/minisign/) 簽章，簽章位於 `SHA256SUMS.minisig`；
- 每個壓縮檔的 GitHub 建置來源證明，可將壓縮檔追溯到建置它的那一次發行工作流程執行。

發行簽署金鑰（金鑰 ID `B33E6FE61BE5314C`）：

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

從[版本頁面](https://github.com/nabi-lang/nabi/releases/tag/v{release})下載 `SHA256SUMS` 與 `SHA256SUMS.minisig`，放到壓縮檔所在的目錄，再驗證簽章與總和檢查碼：

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS            # Linux, FreeBSD
shasum -a 256 -c --ignore-missing SHA256SUMS        # macOS
```

在 Windows 上，於 PowerShell 中使用 minisign [發行頁面](https://github.com/jedisct1/minisign/releases)提供的 `minisign.exe`：

```powershell
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
(Get-FileHash nabi-{release}-x86_64-pc-windows-msvc.zip -Algorithm SHA256).Hash.ToLower()
Select-String nabi-{release}-x86_64-pc-windows-msvc.zip SHA256SUMS
```

兩個雜湊值必須相同。使用 [GitHub CLI](https://cli.github.com) 可以驗證壓縮檔的來源證明：

```sh
gh attestation verify nabi-{release}-aarch64-apple-darwin.tar.xz --repo nabi-lang/nabi
```

二進位檔目前尚未經過程式碼簽署（沒有 macOS 公證，也沒有 Windows Authenticode），因此對於用瀏覽器下載的壓縮檔，Gatekeeper 與 SmartScreen 會發出警告。目前請以上述檢查確認下載的檔案可信。

## 平台

目標在其真實環境中通過測試後即為「已支援」。主機是執行工具鏈的平台，提供發行壓縮檔；建置目標是 `nabi build --target <triple>` 編譯的目標平台。

| 主機 | triple | 層級 |
|------|--------|------|
| macOS，Apple 晶片 | `aarch64-apple-darwin` | 已支援 |
| Windows 11，x64 | `x86_64-pc-windows-msvc` | 已支援 |
| Windows 11，arm64 | `aarch64-pc-windows-msvc` | 已支援 |
| Linux x64，glibc 2.34+ | `x86_64-unknown-linux-gnu` | 已支援 |
| Linux arm64，glibc 2.34+ | `aarch64-unknown-linux-gnu` | 已支援 |
| Linux x64，靜態（musl） | `x86_64-unknown-linux-musl` | 已支援 |
| Linux arm64，靜態（musl） | `aarch64-unknown-linux-musl` | 已支援 |
| FreeBSD 14+，x64 | `x86_64-unknown-freebsd` | 已支援 |

| 建置目標 | triple | 層級 |
|--------------|--------|------|
| 上述 8 個主機 | | 已支援 |
| Linux x86，32 位元 | `i686-unknown-linux-gnu` | 已支援 |
| Windows x86，32 位元 | `i686-pc-windows-msvc` | 已支援 |
| Linux ARMv7，硬體浮點 | `armv7-unknown-linux-gnueabihf` | 已支援 |
| Linux ARMv7，硬體浮點，靜態 | `armv7-unknown-linux-musleabihf` | 已支援 |
| WebAssembly，瀏覽器 | `wasm32-unknown-unknown` | 已支援 |
| WebAssembly，WASI preview 2 | `wasm32-wasip2` | 已支援 |
| WebAssembly，支援執行緒的 WASI preview 1 | `wasm32-wasip1-threads` | 已支援 |
| Android x86-64（模擬器），API 29+ | `x86_64-linux-android` | 已支援 |
| iOS 模擬器，Apple 晶片 | `aarch64-apple-ios-sim` | 已支援 |
| Android arm64 裝置 | `aarch64-linux-android` | 進行中 |
| iOS 裝置 | `aarch64-apple-ios` | 進行中 |
| Linux RISC-V 64 | `riscv64gc-unknown-linux-gnu` | 進行中 |
| Linux IBM Power，小端序 | `powerpc64le-unknown-linux-gnu` | 進行中 |
| Linux IBM Z | `s390x-unknown-linux-gnu` | 進行中 |
| 嵌入式 RISC-V 32，無作業系統 | `riscv32imac-unknown-none-elf` | 進行中 |

進行中的目標只在模擬環境中執行過；`--target` 會拒絕它們，並說明目前該用什麼。[路線圖](roadmap.html)將它們排在 0.2 系列。

只需下載一個壓縮檔，也就是適用於你自己電腦的那一個：每個壓縮檔都帶有所有已支援建置目標的執行環境，因此在任何主機上都能用 `nabi build --target <triple>` 為其他目標建置（Apple 目標只能在 macOS 上建置；Android 目標需要 NDK）。`nabic --print target-list` 會列出所有 triple。各目標的需求請見[工具](docs:spec/refs-lang/009-tools/index.html)。

## 其他需求

- macOS：Xcode Command Line Tools（`xcode-select --install`），提供連結所需的 SDK。
- Linux：無其他需求；需要 glibc 2.34 以上（Ubuntu 22.04、Debian 12、RHEL 9 及更新版本），若使用靜態 musl 壓縮檔，則任何發行版皆可。
- FreeBSD：x86_64 上的 FreeBSD 14 以上，安裝指令碼另需 `curl`（`pkg install curl`）。
- Windows：x64 或 arm64 上的 Windows 11；無其他需求。

Intel Mac 與 arm64 上的 FreeBSD 沒有發行壓縮檔，也不是建置目標。所有版本及其發行說明都在 [GitHub](https://github.com/nabi-lang/nabi/releases) 上。有疑問請看[常見問題](faq.html)。下一步：[入門](docs:learn/01-getting-started.html)。
