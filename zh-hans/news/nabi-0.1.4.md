# Nabi 0.1.4：告诉你该怎么写的错误

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.4 修复了模式和类型推断，并让来自其他语言习惯的写法得到说明应改写成什么的错误。用 <code>nabi toolchain update</code> 更新，或从<a href="../download.html">下载页面</a>重新安装。</div>

## 告诉你该怎么写的错误

按其他语言的习惯写的代码，现在会得到指出 Nabi 写法的错误：条件中的真值判断、对 `str` 使用 `for`、元组索引、`'text'`、用作名称的关键字、`self::f`、可反驳的 `let`、在返回 `()` 的函数中使用 `?` 等。任何 `nabi` 命令的选项拼错时，会给出最接近的选项；`nabi run x.nabi arg` 会说明如何把参数传给程序。

## 模式

`..` 现在可以用在所有元组和元组结构体模式中，适用于 `match`、`if let` 和 `let`：

```nabi
fn describe(t: (i32, i32, i32)) {
    match t {
        (0, ..) => println("starts at zero"),
        (h, ..rest) => println(f"{h} then {rest:?}"),
    }
}

fn main() {
    describe((0, 1, 2));
    describe((7, 8, 9)); // 7 then (8, 9)
}
```

`x is none` 会像 `x == none` 一样收窄 `x` 的类型；`none =>` 之后的兜底分支具有剩余的类型，即 `i32` 而不是 `i32 | none`。

## f-string

f-string 或 `print` 中无法推断类型的占位（例如递归调用）现在是错误；以前它什么也不输出。占位按从左到右的顺序格式化，因此后面的占位改变某个值，不会再影响前面的占位。

完整的变更列表见[发布说明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.4)。
