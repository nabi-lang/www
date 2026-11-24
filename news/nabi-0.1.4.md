# Nabi 0.1.4: errors that say what to write

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.4 fixes patterns and type inference, and makes the errors for habits from other languages say what to write instead. Update with <code>nabi toolchain update</code>, or install again from the <a href="../download.html">download page</a>.</div>

## Errors that say what to write

Code written the way another language would have it now gets an error that names the Nabi form: truthiness in a condition, `for` over a `str`, tuple indexing, `'text'`, a keyword used as a name, `self::f`, a refutable `let`, and `?` in a function that returns `()`, among others. A mistyped option of any `nabi` command names the closest one, and `nabi run x.nabi arg` says how to pass the argument to the program.

## Patterns

`..` works in every tuple and tuple struct pattern, in `match`, `if let` and `let`:

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

`x is none` narrows `x` like `x == none`, and a catch-all arm after `none =>` has the remaining type, `i32` rather than `i32 | none`.

## F-strings

A hole in an f-string or a `print` whose type cannot be inferred, such as a recursive call, is now an error; it used to print nothing. Holes are formatted left to right, so a later hole that changes a value no longer changes an earlier one.

The full list of changes is in the [release notes](https://github.com/nabi-lang/nabi/releases/tag/v0.1.4).
