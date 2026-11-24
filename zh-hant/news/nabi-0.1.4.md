# Nabi 0.1.4：告訴你該怎麼寫的錯誤

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.4 修正了模式與型別推斷，並讓沿用其他語言習慣的寫法得到說明應改寫成什麼的錯誤。以 <code>nabi toolchain update</code> 更新，或從<a href="../download.html">下載頁面</a>重新安裝。</div>

## 告訴你該怎麼寫的錯誤

依其他語言的習慣寫成的程式碼，現在會得到指出 Nabi 寫法的錯誤：條件中的真值判斷、對 `str` 使用 `for`、元組索引、`'text'`、當作名稱的關鍵字、`self::f`、可反駁的 `let`、在回傳 `()` 的函式中使用 `?` 等。任何 `nabi` 命令的選項打錯時，會指出最接近的選項；`nabi run x.nabi arg` 會說明如何把引數傳給程式。

## 模式

`..` 現在可以用在所有元組與元組結構模式中，適用於 `match`、`if let` 與 `let`：

```nabi
match pair {
    (0, ..) => println("starts at zero"),
    (h, ..rest) => println(f"{h} then {rest:?}"),
}
```

`x is none` 會像 `x == none` 一樣縮小 `x` 的型別；`none =>` 之後的萬用分支具有其餘的型別，也就是 `i32` 而非 `i32 | none`。

## f-string

f-string 或 `print` 中無法推斷型別的佔位（例如遞迴呼叫）現在是錯誤；以前它什麼也不輸出。佔位依由左至右的順序格式化，因此後面的佔位改變某個值，不會再影響前面的佔位。

完整的變更列表請見[發行說明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.4)。
