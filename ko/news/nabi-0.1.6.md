# Nabi 0.1.6: 단위를 섞었을 때 더 분명한 오류

<!-- date: 2026-11-28 -->

<div class="lead-sm">Nabi 0.1.6은 const 매개변수만 다른 두 타입을 분명히 구분해 알려 주고, <code>units</code> 패키지 0.1.1을 함께 담습니다. <code>nabi toolchain update</code>로 올리거나 <a href="../download.html">내려받기 페이지</a>에서 다시 설치하세요.</div>

`units`에서 `10kg + 3m`은 거부되지만, 도움말은 같은 제네릭 타입 두 개를 보여 주었습니다. 0.1.6은 둘이 서로 다른 타입이라고 말하고, 별칭을 그대로 써서 `Mass`와 `Length`로 보여 줍니다. const 매개변수로 만든 직접 정의한 타입에도 똑같이 적용됩니다.

`units` 0.1.1은 더 작은 단위로 정확히 변환합니다. `(10kg + 540g).value_in(g)`는 `10539.999999999998`이 아니라 `10540`입니다.

전체 변경 목록은 [릴리스 노트](https://github.com/nabi-lang/nabi/releases/tag/v0.1.6)에 있습니다.
