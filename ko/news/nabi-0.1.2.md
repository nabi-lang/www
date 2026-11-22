# Nabi 0.1.1과 0.1.2

<!-- date: 2026-11-22 -->

<div class="lead-sm">0.1 계열의 수정 릴리스 두 개입니다. 이제 패키지는 자기 의존성만 보고, <code>spatial</code>과 <code>sparse</code>처럼 타입이 <code>any</code>를 거치는 패키지도 다시 의존성으로 빌드됩니다. <code>nabi toolchain update</code>로 올리거나 <a href="../download.html">내려받기 페이지</a>에서 다시 설치하세요.</div>

## 패키지는 자기 의존성만 봅니다 (0.1.1)

패키지의 `x::` 경로는 그 패키지가 의존하는 패키지에만, 그 패키지가 붙인 이름으로 닿습니다. 전에는 이런 경로가 빌드 그래프의 아무 패키지로나 풀릴 수 있어서, `table` 0.1.0이 `csv` 패키지와 함께 있으면 빌드되지 않았습니다.

의존성과 하위 모듈의 이름이 같으면 이제 `x::`는 둘을 모두 밝히고 대신 쓸 것을 알려 주는 오류입니다. 의존성은 `::x::..`, 모듈은 `pkg::x::..`로 쓰세요. 규칙 전체는 [사양의 경로 장](docs:spec/index.html)과 가이드의 모듈과 패키지 장에 있습니다.

0.1.1은 갱신된 공식 패키지도 함께 담습니다. `table` 0.1.3, 그리고 튜토리얼이 [docs.nabi-lang.org/packages](https://docs.nabi-lang.org/packages)의 API 문서로 옮겨 간 `autodiff`, `linalg`, `ode`, `optimize`, `signal`, `sparse`, `stats` 0.1.1입니다.

## `any`를 쓰는 패키지가 다시 빌드됩니다 (0.1.2)

0.1.1에서는 `spatial`에, 또는 `spatial`과 `sparse`에 함께 의존하는 프로젝트가 빌드되지 않았습니다. 이제 `nabic`이 `any`에 담긴 패키지 타입을 위해 만드는 코드는 그 타입을 그 패키지가 보는 이름으로 부르고, 패키지는 의존하지 않는 패키지를 위한 그런 코드를 더는 싣지 않습니다.

그 밖의 수정:

- `any ::dep::Trait`가 다시 `any` 바운드로 파싱됩니다. 이름을 바꾼 의존성에서 `any al::Trait`가 실패하던 문제입니다.
- 패키지가 보는 의존성만 바뀌어도 이제 다시 빌드합니다. 전에는 오래된 결과를 재사용했습니다.

전체 목록은 [0.1.1](https://github.com/nabi-lang/nabi/releases/tag/v0.1.1)과 [0.1.2](https://github.com/nabi-lang/nabi/releases/tag/v0.1.2)의 릴리스 노트에 있습니다.
