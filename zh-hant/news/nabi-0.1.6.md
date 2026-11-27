# Nabi 0.1.6：混用單位時的錯誤更清楚

<!-- date: 2026-11-28 -->

<div class="lead-sm">Nabi 0.1.6 會明確指出僅 const 參數不同的兩個型別是不同的型別，並附帶 <code>units</code> 套件 0.1.1。以 <code>nabi toolchain update</code> 更新，或從<a href="../download.html">下載頁面</a>重新安裝。</div>

使用 `units` 時，`10kg + 3m` 會被拒絕，但說明訊息顯示的是同一泛型型別的兩種寫法。0.1.6 會說明它們是兩個不同的型別，並沿用您的別名，顯示為 `Mass` 與 `Length`。以 const 參數定義的自訂型別同樣適用。

`units` 0.1.1 換算到更小的單位時結果精確：`(10kg + 540g).value_in(g)` 是 `10540`，而不是 `10539.999999999998`。

完整的變更列表請見[發行說明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.6)。
