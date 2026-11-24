# Nabi 0.1.5：table 恢復建置

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.5 修正了 0.1.4 中的一個回歸：<code>table</code> 套件以及所有相依於它的專案都無法建置。以 <code>nabi toolchain update</code> 更新，或從<a href="../download.html">下載頁面</a>重新安裝。</div>

在 0.1.4 中，如果 `x` 已被 `x is none` 或 `x != none` 縮小型別，該分支中的 `x ?? d` 會產生 E0064 錯誤，而 0.1.3 接受這種寫法。`table` 套件用到了這種寫法，因此相依於 `table` 的專案在 0.1.4 上會以 `could not build dependency` 失敗。0.1.5 恢復了對它的編譯，登錄庫中的所有套件都能在 0.1.5 上通過 `nabi check`。

如果您正在使用 0.1.4，請立即更新。完整的變更列表請見[發行說明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.5)。
