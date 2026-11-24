# Nabi 0.1.4: 무엇을 쓸지 알려 주는 오류

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.4는 패턴과 타입 추론을 고치고, 다른 언어의 습관에서 나온 코드에 무엇을 대신 쓸지 알려 주는 오류를 냅니다. <code>nabi toolchain update</code>로 올리거나 <a href="../download.html">내려받기 페이지</a>에서 다시 설치하세요.</div>

## 무엇을 쓸지 알려 주는 오류

다른 언어처럼 쓴 코드에는 Nabi에서 쓰는 형태를 알려 주는 오류가 납니다. 조건의 참·거짓 판정(truthiness), `str`에 대한 `for`, 튜플 인덱싱, `'text'`, 이름으로 쓴 키워드, `self::f`, 반박 가능한 `let`, `()`를 돌려주는 함수 안의 `?` 등이 그렇습니다. `nabi` 명령의 옵션을 잘못 치면 가장 가까운 옵션을 알려 주고, `nabi run x.nabi arg`는 인자를 프로그램에 넘기는 방법을 알려 줍니다.

## 패턴

`..`는 이제 모든 튜플과 튜플 구조체 패턴에서 `match`, `if let`, `let` 모두에 쓸 수 있습니다.

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

`x is none`은 `x == none`처럼 `x`의 타입을 좁히고, `none =>` 뒤의 나머지 갈래는 남은 타입(`i32 | none`이 아니라 `i32`)을 갖습니다.

## f-string

f-string이나 `print`의 구멍(hole)에서 재귀 호출처럼 타입을 추론할 수 없는 값은 이제 오류입니다. 전에는 아무것도 출력하지 않았습니다. 구멍은 왼쪽에서 오른쪽으로 포맷되므로, 뒤의 구멍이 값을 바꿔도 앞의 구멍은 바뀌지 않습니다.

전체 변경 목록은 [릴리스 노트](https://github.com/nabi-lang/nabi/releases/tag/v0.1.4)에 있습니다.
