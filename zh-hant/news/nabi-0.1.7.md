# Nabi 0.1.7：`->` 成為運算子

<!-- date: 2026-11-28 -->

<div class="lead-sm">在 Nabi 0.1.7 中，trait 可以把兩個值之間的 <code>-></code> 繫結為運算子，因此單位換算寫作 <code>5km -> mi</code>，不必輸入 Unicode 箭頭。以 <code>nabi toolchain update</code> 更新，或從<a href="../download.html">下載頁面</a>重新安裝。</div>

在 trait 方法上加上 `#[infix("->", like = "|")]`，`a -> b` 就會呼叫它，就像 `@` 與 `~` 已經可以繫結一樣。回傳型別仍寫作 `->`（`fn f() -> T`）。在 match 守衛中，`n if n > 2 -> 1` 仍會被回報為寫錯的 `=>`；在守衛裡請寫 `(a -> b)`。

`units` 0.1.2 以 `->` 換算（`1km + 500m -> m`），需要 0.1.7 或更新版本。在專案中執行 `nabi update` 即可取得。寫作 `→` 的 `units` 0.1.1 仍可建置。

完整的變更列表請見[發行說明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.7)。
