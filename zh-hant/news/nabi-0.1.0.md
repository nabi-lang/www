# Nabi 0.1.0 正式發布

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.0 是 Nabi 的第一個版本：一門編譯式語言、它的工具鏈、一個套件登錄庫，以及相關網站。本文介紹其中包含哪些內容、在哪些平台上執行、哪些尚未完成，以及如何參與。</div>

## Nabi 是什麼

Nabi 是一門靜態型別的編譯式語言，具有封閉的和型別，沒有 null，錯誤寫在函式簽章中。程式是帶有垃圾回收執行環境的原生執行檔（或 WebAssembly 模組）。其設計依循[語言規格](docs:spec/index.html)中的兩條原則：精簡的核心搭配豐富的函式庫，以及清楚的規則，並在規則之內給使用者自由。型別、分派、記憶體模型與求值順序由語言統一規定；函式庫的設計、領域建模與程式碼結構則交給你。

第一個程式：

```sh
nabi new hello
cd hello
nabi run
```

## 0.1.0 包含哪些內容

- 編譯器 `nabic`。它有自己的程式碼產生器與連結器：不需要 LLVM、系統連結器或 C 編譯器。內建的 C 前端可為 `nabi bindgen` 讀取 C 標頭檔，並透過 `nabi cc` 編譯 C 原始檔。
- 建置與套件工具 `nabi`：`new`、`build`、`run`、`test`、`bench`、`fmt`、`lint`、`doc`、`add`、`publish`、用於安裝與切換版本的 `toolchain` 等（`nabi help` 會列出所有指令）。
- 語言伺服器 `nabils`、REPL（`nabi repl`）與 Jupyter 核心（`nabi jupyter install`）。
- 執行環境，具備支援多執行緒的分代、移動式垃圾回收器，以及非同步任務。
- 分為 `bare`、`core` 與 `std` 三個層級的標準函式庫：集合型別、文字、數值、時間、檔案、行程、網路與 TLS。其 API 請見 [docs.nabi-lang.org](docs:std/index.html)。
- 套件登錄庫 [packages.nabi-lang.org](https://packages.nabi-lang.org)，內有 20 個官方套件：`autodiff`、`csv`、`http`、`interpolate`、`json`、`linalg`、`markdown`、`nabi-syntax`、`ode`、`optimize`、`plot`、`regex`、`signal`、`sparse`、`spatial`、`special`、`stats`、`table`、`toml` 與 `units`。它們隨工具鏈提供：使用某個官方套件的程式碼在第一次使用時會自動將它加入清單，不需要網路。
- 透過 `nabils` 提供的編輯器支援：[VS Code](https://github.com/nabi-lang/nabi.vscode)、[Vim](https://github.com/nabi-lang/nabi.vim) 與 [Zed](https://github.com/nabi-lang/nabi.zed)。
- [Playground](https://playground.nabi-lang.org)，它將程式編譯為 WebAssembly 並在瀏覽器中執行。
- 文件：指南、範例、語言與標準函式庫規格、標準函式庫 API，以及每個錯誤碼各一頁的說明，提供英文與韓文版本。

## 平台

工具鏈可在 8 個主機上執行，每個主機一個發行壓縮檔：

| 主機 | triple |
|------|--------|
| macOS，Apple 晶片 | `aarch64-apple-darwin` |
| Windows 11，x64 | `x86_64-pc-windows-msvc` |
| Windows 11，arm64 | `aarch64-pc-windows-msvc` |
| Linux x64，glibc 2.34+ | `x86_64-unknown-linux-gnu` |
| Linux arm64，glibc 2.34+ | `aarch64-unknown-linux-gnu` |
| Linux x64，靜態（musl） | `x86_64-unknown-linux-musl` |
| Linux arm64，靜態（musl） | `aarch64-unknown-linux-musl` |
| FreeBSD 14+，x64 | `x86_64-unknown-freebsd` |

它能為 17 個已支援目標建置：這 8 個主機，再加上 `i686-unknown-linux-gnu`、`i686-pc-windows-msvc`、`armv7-unknown-linux-gnueabihf`、`armv7-unknown-linux-musleabihf`、`wasm32-unknown-unknown`（瀏覽器）、`wasm32-wasip2`、`wasm32-wasip1-threads`、`x86_64-linux-android`（在模擬器上測試）與 `aarch64-apple-ios-sim`（iOS 模擬器）。目標在其真實環境中通過測試後即為已支援。每個壓縮檔都帶有所有已支援目標的執行環境，因此 `nabi build --target <triple>` 能在任何主機上交叉編譯；Apple 目標只能在 macOS 上建置，Android 目標需要 NDK。

有六個目標正在進行中。程式碼已經就緒，但它們只在模擬環境中執行過，因此 `--target` 會拒絕它們，並說明目前該用什麼：

- `aarch64-linux-android`（Android 裝置）
- `aarch64-apple-ios`（iOS 裝置）
- `riscv64gc-unknown-linux-gnu`
- `powerpc64le-unknown-linux-gnu`
- `s390x-unknown-linux-gnu`
- `riscv32imac-unknown-none-elf`（嵌入式 RISC-V）

[路線圖](../roadmap.html)將它們排在 0.2 系列。

## 穩定性

Nabi 尚未進入 1.0，對於 0.x 遵循 Cargo 對語意化版本的解讀：破壞性變更以次版本號標示。0.2.0 可能破壞為 0.1 撰寫的程式碼；0.1.1、0.1.2 等版本新增功能與修正，但不會破壞它。在 1.0 之前，每個次版本都可能有破壞性變更。只有最新的系列會收到修正，包括安全性修正。

## 安裝

macOS、Linux 與 FreeBSD：

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11（x64 或 arm64），在 PowerShell 中執行：

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

指令碼會為你的電腦挑選壓縮檔，檢查其 SHA-256，再解壓縮到 `~/.nabi`（Windows：`%USERPROFILE%\.nabi`）。[下載頁面](../download.html)提供壓縮檔與其他安裝方式；Nix 使用者可以執行 `nix profile install github:nabi-lang/nabi`。

## 驗證下載的檔案

每個版本都有一個 `SHA256SUMS` 檔案，以 [minisign](https://jedisct1.github.io/minisign/) 簽章（`SHA256SUMS.minisig`），並為每個壓縮檔提供 GitHub 建置來源證明。發行簽署金鑰：

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS
gh attestation verify nabi-0.1.0-x86_64-unknown-linux-gnu.tar.xz --repo nabi-lang/nabi
```

各系統的步驟請見[下載頁面](../download.html#驗證下載的檔案)。

## 已知限制

- TLS 堆疊與 `core::crypto` 中的密碼學實作是 Nabi 自己的程式碼，已以 NIST CAVP 與 Wycheproof 測試向量測試，但尚未經過獨立稽核。請將它們視為實驗性質，暫時不要依賴它們保護真正的機密。
- 二進位檔沒有程式碼簽署：目前既沒有 macOS 公證，也沒有 Windows Authenticode。對於用瀏覽器下載的壓縮檔，Gatekeeper 與 SmartScreen 會發出警告；`curl | sh` 與 `irm | iex` 安裝方式不受影響。目前請以上述 minisign 簽章與來源證明檢查下載的檔案。
- 有六個目標正在進行中（見上文）。
- 目前只有登錄庫的維護者可以發布套件。任何人都可以登入並使用套件；若帳戶尚無法發布，`nabi login` 會提示這一點。
- 為 `-gnu` Linux 目標建置的程式需要 glibc 2.34 以上。在較舊的系統上，安裝程式會挑選靜態 musl 壓縮檔。
- 工具鏈的建置快取上限為 5 GiB；設定 `NABI_CACHE_MAX_SIZE`（`2G`、`off`）可以變更上限，`nabi cache prune` 或 `nabi cache clean` 可以縮減快取。
- Nabi 目前尚未發表效能比較。它的程式碼產生器還很年輕；請以你自己的工作負載實際測量。

## 參與

- 提問、點子與作品分享：[GitHub Discussions](https://github.com/nabi-lang/nabi/discussions)。
- bug：在相關的儲存庫開 [issue](https://github.com/nabi-lang/nabi/issues)。
- 程式碼與文件：請閱讀 [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md)。每個提交都要附上 DCO 簽署（`git commit -s`）；不需要簽署 CLA。
- 安全性問題：不要公開回報。請使用 GitHub 的私人漏洞回報功能，或寫信至 security@nabi-lang.org（[SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md)）。
- 常見疑問：請見[常見問題](../faq.html)。

## 致謝

感謝所有試用早期建置、回報問題與審閱文件草稿的人，也感謝 Nabi 借鏡並仰賴的專案：撰寫 Nabi 所用的 Rust 工具鏈，以及 musl、wasi-libc、mingw-w64 與 [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES) 中列出的其他專案。
