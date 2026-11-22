# Nabi 0.1.1 與 0.1.2

<!-- date: 2026-11-22 -->

<div class="lead-sm">0.1 系列的兩個修正版本。現在每個套件只看得到自己的相依套件，型別經過 <code>any</code> 的套件（例如 <code>spatial</code> 與 <code>sparse</code>）再次可以作為相依套件建置。以 <code>nabi toolchain update</code> 更新，或從<a href="../download.html">下載頁面</a>重新安裝。</div>

## 每個套件只看得到自己的相依套件（0.1.1）

套件中不帶前綴的 `x::` 路徑只能存取它所相依的套件，並使用它為這些套件取的名稱。先前，這樣的路徑可能解析到建置圖中的任何套件，因此 `table` 0.1.0 與 `csv` 套件同時存在時無法建置。

當一個相依套件與一個子模組同名時，`x::` 現在會產生錯誤，錯誤訊息會列出兩者，並說明應該怎麼寫：相依套件寫作 `::x::..`，模組寫作 `pkg::x::..`。[語言規格的路徑一章](docs:spec/index.html)與指南中關於模組與套件的一章完整說明了這條規則。

0.1.1 也內含更新後的官方套件：`table` 0.1.3，以及 `autodiff`、`linalg`、`ode`、`optimize`、`signal`、`sparse` 與 `stats` 0.1.1，它們的教學已移入 [docs.nabi-lang.org/packages](https://docs.nabi-lang.org/packages) 上各自的 API 文件。

## 使用 `any` 的套件再次可以建置（0.1.2）

0.1.1 無法建置相依於 `spatial` 的專案，或同時相依於 `spatial` 與 `sparse` 的專案。現在，`nabic` 為存放在 `any` 中的套件型別產生的程式碼，會依該套件所看到的名稱來稱呼這些型別；套件也不再為它不相依的套件攜帶這類程式碼。

另外修正了：

- `any ::dep::Trait` 再次被剖析為 `any` 約束；對於重新命名的相依套件，`any al::Trait` 先前會失敗。
- 只改變套件看得到哪些相依套件時，現在會重新建置該套件；先前建置會重複使用過時的結果。

完整列表請見 [0.1.1](https://github.com/nabi-lang/nabi/releases/tag/v0.1.1) 與 [0.1.2](https://github.com/nabi-lang/nabi/releases/tag/v0.1.2) 的發行說明。
