# 로드맵

<div class="lead-sm">만들고 있는 것을 나오는 순서대로 적었습니다. 버전은 할 일이 끝나면 나오며, 날짜는 정하지 않습니다. 항목마다 <a href="https://github.com/nabi-lang/nabi/milestones">GitHub 마일스톤</a>에서 추적합니다.</div>

<div class="rm-legend"><span class="rm-pill now">진행 중</span><span class="rm-pill next">다음</span><span class="rm-pill later">나중</span><span class="rm-pill done">출시됨</span></div>

## 다음

<div class="rm">
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">다음</span></header>
<h3>선택형 LLVM 백엔드</h3>
<ul>
<li>선택 설치 구성 요소 <code>codegen-llvm</code>: <code>nabi component add codegen-llvm</code>으로 설치하고, <code>nabi.nabion</code>의 프로필(<code>profile: { "release": { codegen_backend: "llvm" } }</code>)이나 <code>-C codegen-backend=llvm</code>으로 고릅니다. 기본값은 계속 Nabi 자체 코드 생성기입니다</li>
<li><code>nabi test --cross-check=llvm</code>은 두 코드 생성기로 테스트를 빌드해 출력을 비교합니다</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">다음</span></header>
<h3>대상 늘리기</h3>
<ul>
<li>진행 중인 대상을 실제 하드웨어에서 돌려 본 뒤 지원: Android arm64와 iOS 기기(<code>aarch64-linux-android</code>, <code>aarch64-apple-ios</code>), RISC-V 64 Linux(<code>riscv64gc-unknown-linux-gnu</code>), IBM Power(<code>powerpc64le-unknown-linux-gnu</code>), IBM Z(<code>s390x-unknown-linux-gnu</code>), 임베디드 RISC-V(<code>riscv32imac-unknown-none-elf</code>)</li>
</ul>
</section>
</div>

## 나중

<div class="rm">
<section class="rm-card later">
<header><span class="rm-pill later">나중</span></header>
<h3>MLIR 커널</h3>
<ul>
<li><code>codegen-llvm</code> 구성 요소를 통한 MLIR: 표시한 커널 함수는 오프로드용으로 컴파일하고, 나머지 프로그램은 Nabi 자체 코드 생성기를 그대로 씁니다</li>
</ul>
</section>
</div>

## 출시됨

<div class="rm-log">
<div class="rm-entry"><span class="rm-ver">0.1.6</span><time datetime="2026-11-28">2026-11-28</time><p>const 매개변수만 다른 두 타입(단위 혼용 등)에 대한 오류가 더 분명해지고, <code>units</code> 패키지 0.1.1을 함께 담습니다. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.6">릴리스 노트</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.5</span><time datetime="2026-11-24">2026-11-24</time><p>수정 릴리스입니다. 0.1.4의 회귀로 빌드되지 않던 <code>table</code> 패키지와 이에 의존하는 프로젝트가 다시 빌드됩니다. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.5">릴리스 노트</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.4</span><time datetime="2026-11-24">2026-11-24</time><p>패턴과 추론을 고치고, 다른 언어의 습관에서 나온 코드에 무엇을 대신 쓸지 알려 주는 오류를 냅니다. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.4">릴리스 노트</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.3</span><time datetime="2026-11-22">2026-11-22</time><p><code>nabi audit</code>가 <code>nabi.lock</code>에 고정된 패키지를 레지스트리의 보안 권고와 대조합니다. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.3">릴리스 노트</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.2</span><time datetime="2026-11-22">2026-11-22</time><p>수정 릴리스입니다. <code>spatial</code>과 <code>sparse</code>처럼 타입이 <code>any</code>를 거치는 패키지가 다시 의존성으로 빌드됩니다. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.2">릴리스 노트</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.1</span><time datetime="2026-11-22">2026-11-22</time><p>수정 릴리스입니다. 각 패키지는 자기 의존성만 보고, toolchain은 갱신된 공식 패키지를 담습니다. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.1">릴리스 노트</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.0</span><time datetime="2026-11-22">2026-11-22</time><p>Nabi의 첫 릴리스입니다. 컴파일러, <code>nabi</code> 패키지 도구, 언어 서버, 런타임, 표준 라이브러리와 공식 패키지 20개를 담았고, Nabi 자체 코드 생성기와 링커로 지원 타겟 17개를, 릴리스 아카이브로 호스트 8개를 지원합니다. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.0">릴리스 노트</a></p></div>
</div>

## 라이브러리

<div class="lead-sm">표준 라이브러리는 좁게 유지합니다. 언어 지원, 컬렉션, 텍스트, 수, 시간, 입출력, 네트워크, TLS까지입니다. 나머지는 버전을 따로 매기는 공식 패키지로, <a href="https://packages.nabi-lang.org">packages.nabi-lang.org</a>에 공개합니다. 공식 패키지는 toolchain과 함께 설치되므로, 코드에서 쓰기만 하면 첫 빌드 때 추가되고 <code>nabi add</code>는 필요 없습니다.</div>

<div class="rm">
<section class="rm-card done">
<header><span class="rm-ver">0.1</span><span class="rm-pill done">출시됨</span></header>
<h3>공식 패키지</h3>
<ul>
<li>core의 <code>Array</code> 위의 과학 계산: <code>linalg</code>, <code>sparse</code>, <code>autodiff</code>, <code>signal</code>, <code>table</code>(Arrow와 Parquet 포함), <code>stats</code>, <code>special</code>, <code>optimize</code>, <code>interpolate</code>, <code>spatial</code>, <code>ode</code>, <code>units</code>, <code>plot</code></li>
<li>형식과 웹: <code>json</code>, <code>toml</code>, <code>csv</code>, <code>http</code>, <code>markdown</code>, 그리고 강조 표시용 <code>nabi-syntax</code></li>
<li><code>regex</code>: 선형 시간 매칭(백트래킹 없음), 유니코드 클래스, 캡처, 반복과 치환</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-pill next">다음</span></header>
<h3>일상용 패키지</h3>
<ul>
<li><code>cli</code>: 도움말과 하위 명령을 만들어 주는 인자 파싱</li>
<li><code>log</code>: 수준별 구조화 로깅, 출력 대상은 교체 가능</li>
<li><code>compress</code>: deflate, gzip, zstd, 스트리밍</li>
<li><code>uuid</code>: 버전 4와 7, 파싱과 서식</li>
<li><code>sqlite</code>: SQLite 바인딩</li>
</ul>
</section>
</div>

압축 파일과 설치 스크립트: [내려받기](download.html).
