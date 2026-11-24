# Nabi 0.1.5: table이 다시 빌드됩니다

<!-- date: 2026-11-24 -->

<div class="lead-sm">Nabi 0.1.5는 0.1.4에서 <code>table</code> 패키지와 이에 의존하는 모든 프로젝트가 빌드되지 않던 회귀를 고칩니다. <code>nabi toolchain update</code>로 올리거나 <a href="../download.html">내려받기 페이지</a>에서 다시 설치하세요.</div>

0.1.4에서는 `x is none`이나 `x != none`으로 `x`의 타입이 좁혀진 갈래 안의 `x ?? d`가 E0064로 실패했습니다. 0.1.3은 받아들이던 코드입니다. `table` 패키지가 이 형태를 쓰기 때문에, 의존성에 `table`이 있는 프로젝트는 0.1.4에서 `could not build dependency`로 실패했습니다. 0.1.5는 이를 다시 컴파일하며, 레지스트리의 모든 패키지가 0.1.5에서 `nabi check`를 통과합니다.

0.1.4를 쓰고 있다면 지금 올리세요. 전체 변경 목록은 [릴리스 노트](https://github.com/nabi-lang/nabi/releases/tag/v0.1.5)에 있습니다.
