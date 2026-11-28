# Nabi 0.1.7: 연산자가 된 `->`

<!-- date: 2026-11-28 -->

<div class="lead-sm">Nabi 0.1.7에서는 트레이트가 두 값 사이의 <code>-></code>를 연산자로 묶을 수 있습니다. 그래서 단위 변환을 유니코드 화살표 없이 <code>5km -> mi</code>로 씁니다. <code>nabi toolchain update</code>로 올리거나 <a href="../download.html">내려받기 페이지</a>에서 다시 설치하세요.</div>

트레이트 메서드에 `#[infix("->", like = "|")]`를 붙이면 `a -> b`가 그 메서드를 부릅니다. `@`와 `~`를 묶을 수 있는 것과 같습니다. 반환 타입은 그대로 `->`로 씁니다(`fn f() -> T`). match 가드의 `n if n > 2 -> 1`은 여전히 `=>`를 잘못 쓴 것으로 알려 주니, 가드 안에서는 `(a -> b)`로 쓰세요.

`units` 0.1.2는 `->`로 변환하며(`1km + 500m -> m`) 0.1.7 이상이 필요합니다. 프로젝트에서 `nabi update`를 실행하면 받습니다. `→`로 쓰는 `units` 0.1.1도 그대로 빌드됩니다.

전체 변경 사항은 [릴리스 노트](https://github.com/nabi-lang/nabi/releases/tag/v0.1.7)에 있습니다.
