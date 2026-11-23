# 常見問題

<div class="lead-sm">大家最先問到的問題的簡短回答。目前版本的全貌請見 <a href="news/nabi-0.1.0.html">0.1.0 發布公告</a>。</div>

## 為什麼還要一門新語言？

Nabi 源自一個動機：用一門語言做到作者想做的所有事。它不鎖定特定族群，也不為某種學術立場辯護。[語言規格](docs:spec/index.html)寫明了所有設計決策最終依循的兩條原則：精簡的核心搭配豐富的函式庫，以及清楚的規則，並在規則之內給你自由。落實到實務上，就是靜態型別、封閉的和型別、沒有 null、錯誤寫在函式簽章中、沒有隱含的數值提升，以及以垃圾回收器免去手動管理記憶體。

如果你已經在用一門滿意的語言，Nabi 並不宣稱要取代它。[給 Python 開發者的 Nabi](docs:learn/nabi-for-python.html) 與[給 Rust 開發者的 Nabi](docs:learn/nabi-for-rust.html) 展示了它在日常程式碼中與這兩門語言的比較。

## 為什麼不用 LLVM？

為了讓一個壓縮檔就是完整的工具鏈。`nabic` 自行產生機器碼並完成連結，每個壓縮檔都帶有所有已支援目標的執行環境，因此 `nabi build --target <triple>` 能在任何主機上交叉編譯，不必安裝系統連結器、C 編譯器或 SDK（Apple 目標仍需要 Apple 的 SDK，Android 目標需要 NDK）。這也讓編譯器、連結器與執行環境位於同一個程式碼庫中，專案可以一起修改它們。

代價是程式碼產生器還很年輕。Nabi 目前沒有發布與基於 LLVM 的編譯器的效能比較；請自行測量你的工作負載。選用的 LLVM 後端預計在 0.2 系列推出，以元件安裝、依建置設定檔選擇（請見[路線圖](roadmap.html)）；預設仍是 Nabi 自己的程式碼產生器。

## 哪些部分是穩定的？

1.0 之前沒有任何部分是凍結的。對於 0.x，Nabi 遵循 Cargo 對語意化版本的解讀：次版本號是破壞性變更的位置。0.2.0 可能破壞為 0.1 撰寫的程式碼；0.1.1、0.1.2 等版本新增功能與修正，但不會破壞它。在 1.0 之前，每個次版本都可能有破壞性變更，變更會列在發行說明中。

只有最新的系列會收到修正與安全性修正。舊的壓縮檔仍可下載。`nabi toolchain update` 會將你升級到最新版本，套件的 `toolchain` 欄位可以固定建置它所用的系列。

## 支援哪些平台？

工具鏈可在 8 個主機上執行：Apple 晶片上的 macOS；x64 與 arm64 上的 Windows 11；x64 與 arm64 上的 Linux（glibc 2.34+ 或靜態 musl）；以及 x64 上的 FreeBSD 14+。它能為 17 個已支援目標建置，在主機之外還包括 32 位元 x86 Linux 與 Windows、32 位元 ARM Linux、三個 WebAssembly 目標、Android x86-64 與 iOS 模擬器。另有六個目標（Android 與 iOS 裝置、riscv64、ppc64le、s390x 與嵌入式 RISC-V）正在進行中：在實體硬體上執行之前，`--target` 會拒絕它們。完整的表格請見[下載頁面](download.html#平台)。

不支援 Intel Mac、32 位元主機與 arm64 上的 FreeBSD。

## 套件與登錄庫如何運作？

一個套件就是一個帶有 `nabi.nabion` 清單的目錄。`nabi add <name>` 從 [packages.nabi-lang.org](https://packages.nabi-lang.org) 加入相依套件，`nabi.lock` 記錄確切的版本，`nabi update` 更新它們。登錄庫的索引是一個 git 儲存庫 [nabi-lang/packages-index](https://github.com/nabi-lang/packages-index)：每個版本指向套件自身儲存庫的一個提交，登錄庫保存該提交的壓縮檔及其 SHA-256，`nabi` 在下載時會檢查它。

20 個官方套件（`json`、`http`、`regex`、`table`、`stats`、`plot` 等）隨工具鏈提供。使用某個官方套件的程式碼在第一次使用時會自動將它加入清單，不需要 `nabi add`，也不需要網路。

`nabi publish` 將一個版本送到登錄庫。目前只有登錄庫的維護者可以發布；任何人都可以登入並使用套件。請見[發布套件](docs:learn/18-features-and-publishing.html#發布套件)。

## 授權條款是什麼？

編譯器、工具、執行環境、標準函式庫與官方套件採用 `MIT OR Apache-2.0`，由你選擇。語言規格、文件與本網站的文字採用 CC BY 4.0。你用 Nabi 建置的程式可以依你的意願授權；發行壓縮檔中也包含第三方執行環境元件（musl、wasi-libc 等），各自採用其授權條款，列於 [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES)。

## 如何驗證下載的檔案？

每個版本都有一個以 minisign 簽章的 `SHA256SUMS` 檔案，並為每個壓縮檔提供 GitHub 建置來源證明。步驟與公開金鑰請見[下載頁面](download.html#驗證下載的檔案)。安裝指令碼會檢查所下載壓縮檔的 SHA-256。

## 如何回報安全性問題？

不要在公開的 issue 中回報。請使用 GitHub 的私下漏洞回報功能（儲存庫的 **Security** 分頁，**Report a vulnerability**），或寫信至 security@nabi-lang.org。相關政策請見 [SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md)。TLS 堆疊與 `core::crypto` 尚未經過獨立稽核，歡迎回報與它們相關的問題。

## 在哪裡提問或參與？

在 [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions) 提問，以 issue 回報 bug。若要貢獻程式碼或文件，請閱讀 [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md)：每個提交都要附上 DCO 簽署（`git commit -s`），不需要簽署 CLA。
