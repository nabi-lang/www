# Nabi 0.1.0 발표

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.0은 Nabi의 첫 릴리스입니다. 컴파일 언어와 그 툴체인, 패키지 레지스트리, 그리고 이를 둘러싼 사이트가 함께 나옵니다. 이 글은 무엇이 들어 있는지, 어디서 돌아가는지, 아직 안 된 것은 무엇인지, 어떻게 참여하는지를 적습니다.</div>

## Nabi는

Nabi는 정적 타입 컴파일 언어입니다. 닫힌 합 타입이 있고, null이 없으며, 에러는 함수 시그니처에 드러납니다. 프로그램은 가비지 컬렉션 런타임을 갖춘 네이티브 실행 파일(또는 WebAssembly 모듈)이 됩니다. 설계는 [사양](docs:spec/index.html)의 두 원칙을 따릅니다. 좁은 핵심과 풍부한 라이브러리, 그리고 규칙이 분명할수록 그 안에서 자유롭다는 것입니다. 타입, 디스패치, 메모리 모델, 평가 순서는 언어가 한 번에 정하고, 라이브러리 설계, 도메인 모델링, 코드 구조는 사용자에게 맡깁니다.

첫 프로그램:

```sh
nabi new hello
cd hello
nabi run
```

## 0.1.0에 든 것

- 컴파일러 `nabic`. 자체 코드 생성기와 자체 링커를 갖추고 있어 LLVM도, 시스템 링커도, C 컴파일러도 필요 없습니다. 내장 C 프런트엔드가 `nabi bindgen`을 위해 C 헤더를 읽고, `nabi cc`로 C 소스를 컴파일합니다.
- 빌드·패키지 도구 `nabi`: `new`, `build`, `run`, `test`, `bench`, `fmt`, `lint`, `doc`, `add`, `publish`, 버전을 설치하고 바꾸는 `toolchain` 등(`nabi help`가 모두 보여 줍니다).
- 언어 서버 `nabils`, REPL(`nabi repl`), Jupyter 커널(`nabi jupyter install`).
- 스레드와 함께 동작하는 세대별 이동 가비지 컬렉터와 비동기 태스크를 갖춘 런타임.
- `bare`, `core`, `std` 세 계층의 표준 라이브러리: 컬렉션, 텍스트, 숫자, 시간, 파일, 프로세스, 네트워킹과 TLS. API는 [docs.nabi-lang.org](docs:std/index.html)에 있습니다.
- 패키지 레지스트리 [packages.nabi-lang.org](https://packages.nabi-lang.org)와 공식 패키지 20개: `autodiff`, `csv`, `http`, `interpolate`, `json`, `linalg`, `markdown`, `nabi-syntax`, `ode`, `optimize`, `plot`, `regex`, `signal`, `sparse`, `spatial`, `special`, `stats`, `table`, `toml`, `units`. 툴체인과 함께 설치되며, 공식 패키지를 쓰는 코드는 처음 쓸 때 네트워크 없이 매니페스트에 추가됩니다.
- `nabils`를 쓰는 에디터 지원: [VS Code](https://github.com/nabi-lang/nabi.vscode), [Vim](https://github.com/nabi-lang/nabi.vim), [Zed](https://github.com/nabi-lang/nabi.zed).
- 프로그램을 WebAssembly로 컴파일해 브라우저에서 실행하는 [플레이그라운드](https://playground.nabi-lang.org).
- 문서: 가이드, 예제, 언어와 표준 라이브러리 사양, 표준 라이브러리 API, 에러 코드마다 한 페이지. 영어와 한국어로 제공합니다.

## 플랫폼

툴체인은 호스트 8곳에서 돌아가며, 호스트마다 릴리스 압축 파일이 하나씩 있습니다.

| 호스트 | triple |
|------|--------|
| macOS, Apple 실리콘 | `aarch64-apple-darwin` |
| Windows 11, x64 | `x86_64-pc-windows-msvc` |
| Windows 11, arm64 | `aarch64-pc-windows-msvc` |
| Linux x64, glibc 2.34 이상 | `x86_64-unknown-linux-gnu` |
| Linux arm64, glibc 2.34 이상 | `aarch64-unknown-linux-gnu` |
| Linux x64, 정적(musl) | `x86_64-unknown-linux-musl` |
| Linux arm64, 정적(musl) | `aarch64-unknown-linux-musl` |
| FreeBSD 14 이상, x64 | `x86_64-unknown-freebsd` |

지원 대상은 17개입니다. 호스트 8곳에 더해 `i686-unknown-linux-gnu`, `i686-pc-windows-msvc`, `armv7-unknown-linux-gnueabihf`, `armv7-unknown-linux-musleabihf`, `wasm32-unknown-unknown`(브라우저), `wasm32-wasip2`, `wasm32-wasip1-threads`, `x86_64-linux-android`(에뮬레이터에서 테스트), `aarch64-apple-ios-sim`(iOS 시뮬레이터)입니다. 대상은 실제 환경에서 테스트를 통과해야 지원 대상이 됩니다. 압축 파일마다 모든 지원 대상의 런타임이 들어 있어서 `nabi build --target <triple>`로 어느 호스트에서든 교차 컴파일합니다. Apple 대상은 macOS에서만 빌드되고, Android 대상에는 NDK가 필요합니다.

대상 6개는 진행 중입니다. 코드는 있지만 에뮬레이션에서만 돌려 봤기 때문에 `--target`이 받지 않고, 지금은 무엇을 쓰면 되는지 알려 줍니다.

- `aarch64-linux-android`(Android 기기)
- `aarch64-apple-ios`(iOS 기기)
- `riscv64gc-unknown-linux-gnu`
- `powerpc64le-unknown-linux-gnu`
- `s390x-unknown-linux-gnu`
- `riscv32imac-unknown-none-elf`(임베디드 RISC-V)

[로드맵](../roadmap.html)에서 0.2 계열로 잡혀 있습니다.

## 안정성

Nabi는 1.0 이전이며, 0.x에서는 Cargo가 semver를 읽는 방식을 따릅니다. 부 버전(minor)이 호환을 깨는 자리입니다. 0.2.0은 0.1용 코드를 깰 수 있고, 0.1.1, 0.1.2 같은 릴리스는 기능과 수정을 더할 뿐 코드를 깨지 않습니다. 1.0 전까지는 부 버전마다 호환이 깨지는 변경이 있다고 보세요. 수정과 보안 수정은 가장 최근 계열에만 나옵니다.

## 설치

macOS, Linux, FreeBSD:

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11(x64 또는 arm64), PowerShell에서:

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

스크립트는 컴퓨터에 맞는 압축 파일을 골라 SHA-256을 확인한 다음 `~/.nabi`(Windows: `%USERPROFILE%\.nabi`)에 풉니다. 압축 파일과 다른 방법은 [내려받기 페이지](../download.html)에 있습니다. Nix에서는 `nix profile install github:nabi-lang/nabi`를 실행하세요.

## 내려받은 파일 확인

릴리스마다 [minisign](https://jedisct1.github.io/minisign/)으로 서명한 `SHA256SUMS` 파일(`SHA256SUMS.minisig`)이 있고, 압축 파일마다 GitHub 빌드 출처 증명(attestation)이 있습니다. 릴리스 서명 키:

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS
gh attestation verify nabi-0.1.0-x86_64-unknown-linux-gnu.tar.xz --repo nabi-lang/nabi
```

시스템별 절차는 [내려받기 페이지](../download.html#내려받은-파일-확인)에 있습니다.

## 알려진 한계

- TLS 스택과 `core::crypto`의 암호 기능은 Nabi가 직접 작성한 코드로, NIST CAVP와 Wycheproof 벡터로 테스트했지만 독립적인 감사는 받지 않았습니다. 실험 단계로 보고, 아직 실제 비밀을 지키는 데 쓰지 마세요.
- 바이너리에 코드 서명이 없습니다. macOS 공증도, Windows Authenticode도 아직 없습니다. 브라우저로 받은 압축 파일에는 Gatekeeper와 SmartScreen이 경고를 띄웁니다. `curl | sh`와 `irm | iex` 설치 스크립트는 해당하지 않습니다. 지금은 위의 minisign 서명과 출처 증명으로 확인하세요.
- 대상 6개는 진행 중입니다(위 참고).
- 지금은 레지스트리 관리자만 패키지를 공개할 수 있습니다. 누구나 로그인해 패키지를 쓸 수 있으며, 아직 공개할 수 없는 계정에는 `nabi login`이 그렇다고 알려 줍니다.
- `-gnu` Linux 대상용으로 빌드한 프로그램에는 glibc 2.34 이상이 필요합니다. 더 오래된 시스템에서는 설치 스크립트가 정적 musl 압축 파일을 고릅니다.
- 툴체인의 빌드 캐시는 5 GiB로 제한됩니다. `NABI_CACHE_MAX_SIZE`(`2G`, `off`)로 바꾸고, `nabi cache prune`이나 `nabi cache clean`으로 줄이세요.
- 공개된 성능 비교는 아직 없습니다. 코드 생성기는 아직 젊으니, 직접 쓰는 작업으로 측정해 보세요.

## 참여하기

- 질문, 아이디어, 만든 것 소개: [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions).
- 버그: 해당 저장소의 [이슈](https://github.com/nabi-lang/nabi/issues).
- 코드와 문서: [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md)를 읽어 주세요. 커밋에는 DCO 서명(`git commit -s`)을 붙이며, CLA는 없습니다.
- 보안 문제: 공개된 곳에 올리지 마세요. GitHub의 비공개 취약점 신고를 쓰거나 security@nabi-lang.org로 메일을 보내 주세요([SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md)).
- 자주 묻는 질문: [FAQ](../faq.html).

## 감사의 말

초기 빌드를 써 보고, 문제를 알려 주고, 문서 초안을 읽어 준 모든 분께 감사드립니다. Nabi가 배우고 기대어 만든 프로젝트들에도 감사드립니다. Nabi를 작성한 Rust 툴체인, musl, wasi-libc, mingw-w64, 그리고 [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES)에 적힌 다른 프로젝트들입니다.
