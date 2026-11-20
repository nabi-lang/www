# 로드맵

<div class="lead-sm">만들고 있는 것을 나오는 순서대로 적었습니다. 버전은 할 일이 끝나면 나오며, 날짜는 정하지 않습니다. 항목마다 <a href="https://github.com/nabi-lang/nabi/milestones">GitHub 마일스톤</a>에서 추적합니다.</div>

<div class="rm-legend"><span class="rm-pill now">진행 중</span><span class="rm-pill next">다음</span><span class="rm-pill later">나중</span><span class="rm-pill done">출시됨</span></div>

## 진행 중

<div class="rm">
<section class="rm-card now">
<header><span class="rm-ver">0.1.0</span><span class="rm-pill now">진행 중</span></header>
<h3>첫 릴리스</h3>
<ul>
<li>툴체인: 자체 코드 생성기와 링커를 갖춘 <code>nabic</code>, <code>nabi</code>, <code>nabils</code>, REPL, Jupyter 커널</li>
<li>호스트 여덟 곳의 압축 파일과 <code>nabi.sh</code>의 설치 스크립트: Apple 실리콘 macOS, x64와 arm64 Windows, x64와 arm64 Linux(glibc와 정적 musl), x64 FreeBSD</li>
<li>실제로 돌아가는 환경에서 하나하나 시험한 빌드 대상 17개: 호스트 여덟 곳, 32비트 x86 Linux와 Windows, 32비트 ARM Linux(glibc와 musl), WebAssembly(브라우저, WASI preview 2, 스레드를 쓰는 WASI preview 1), 에뮬레이터의 Android x86-64, iOS 시뮬레이터</li>
</ul>
</section>
</div>

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

## 라이브러리

<div class="lead-sm">표준 라이브러리는 좁게 유지합니다. 언어 지원, 컬렉션, 텍스트, 수, 시간, 입출력, 네트워크, TLS까지입니다. 나머지는 버전을 따로 매기는 공식 패키지로, <a href="https://packages.nabi-lang.org">packages.nabi-lang.org</a>에 공개합니다. 공식 패키지는 툴체인과 함께 설치되므로, 코드에서 쓰기만 하면 첫 빌드 때 추가되고 <code>nabi add</code>는 필요 없습니다.</div>

<div class="rm">
<section class="rm-card now">
<header><span class="rm-ver">0.1</span><span class="rm-pill now">진행 중</span></header>
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
