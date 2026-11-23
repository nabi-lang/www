# FAQ

<div class="lead-sm">처음에 많이 묻는 질문에 짧게 답합니다. 지금 릴리스의 전체 모습은 <a href="news/nabi-0.1.0.html">0.1.0 발표</a>에 있습니다.</div>

## 왜 또 새 언어인가요?

Nabi는 한 가지 동기에서 시작했습니다. 만든 사람이 하고 싶은 모든 것을 할 수 있는 하나의 언어입니다. 특정 사용자층을 겨냥하지도, 학술적 입장을 내세우지도 않습니다. [사양](docs:spec/index.html)은 모든 설계 결정이 기대는 두 원칙을 밝힙니다. 좁은 핵심과 풍부한 라이브러리, 그리고 규칙이 분명할수록 그 안에서 자유롭다는 것입니다. 실제로는 정적 타입, 닫힌 합 타입, null 없음, 함수 시그니처에 드러나는 에러, 암묵적 숫자 승격 없음, 그리고 메모리를 손으로 관리하지 않도록 가비지 컬렉터를 뜻합니다.

이미 만족하며 쓰는 언어가 있다면, Nabi가 그것을 대신한다고 주장하지는 않습니다. [Python 사용자를 위한 Nabi](docs:learn/nabi-for-python.html)와 [Rust 사용자를 위한 Nabi](docs:learn/nabi-for-rust.html)가 일상적인 코드에서 어떻게 다른지 보여 줍니다.

## 왜 LLVM을 쓰지 않나요?

압축 파일 하나가 toolchain 전부가 되도록 하기 위해서입니다. `nabic`은 기계어를 직접 생성하고 직접 링크하며, 압축 파일마다 모든 지원 대상의 런타임이 들어 있습니다. 그래서 `nabi build --target <triple>`은 시스템 링커도, C 컴파일러도, SDK도 설치하지 않고 어느 호스트에서든 교차 컴파일합니다(Apple 대상에는 여전히 Apple의 SDK가, Android 대상에는 NDK가 필요합니다). 컴파일러, 링커, 런타임을 한 코드베이스에 두어 프로젝트가 함께 바꿀 수 있다는 점도 있습니다.

대가는 아직 젊은 코드 생성기입니다. Nabi는 LLVM 기반 컴파일러와의 성능 비교를 아직 공개하지 않았습니다. 직접 쓰는 작업으로 측정해 보세요. 컴포넌트로 설치하고 프로필마다 고르는 선택적 LLVM 백엔드가 0.2 계열에 계획되어 있으며([로드맵](roadmap.html)), 기본값은 계속 Nabi의 자체 코드 생성기입니다.

## 무엇이 안정적인가요?

1.0 전에는 굳어진 것이 없습니다. Nabi는 0.x에서 Cargo가 semver를 읽는 방식을 따릅니다. 부 버전(minor)이 호환을 깨는 자리입니다. 0.2.0은 0.1용 코드를 깰 수 있고, 0.1.1, 0.1.2 같은 릴리스는 기능과 수정을 더할 뿐 코드를 깨지 않습니다. 1.0 전까지는 부 버전마다 호환이 깨지는 변경이 있다고 보세요. 바뀐 것은 릴리스 노트에 적습니다.

수정과 보안 수정은 가장 최근 계열에만 나옵니다. 예전 압축 파일은 계속 받을 수 있습니다. `nabi toolchain update`는 가장 새 릴리스로 옮겨 주고, 패키지의 `toolchain` 필드는 빌드에 쓸 계열을 고정합니다.

## 어떤 플랫폼을 지원하나요?

toolchain은 호스트 8곳에서 돌아갑니다. Apple 실리콘 macOS, x64와 arm64의 Windows 11, x64와 arm64의 Linux(glibc 2.34 이상 또는 정적 musl), x64의 FreeBSD 14 이상입니다. 지원 빌드 대상은 17개로, 여기에 32비트 x86 Linux와 Windows, 32비트 ARM Linux, WebAssembly 대상 셋, Android x86-64, iOS 시뮬레이터가 더해집니다. 대상 6개(Android와 iOS 기기, riscv64, ppc64le, s390x, 임베디드 RISC-V)는 진행 중이며, 실제 하드웨어에서 돌아갈 때까지 `--target`이 받지 않습니다. 전체 표는 [내려받기 페이지](download.html#플랫폼)에 있습니다.

Intel Mac, 32비트 호스트, arm64 FreeBSD는 지원하지 않습니다.

## 패키지와 레지스트리는 어떻게 동작하나요?

패키지는 `nabi.nabion` 매니페스트가 있는 디렉터리입니다. `nabi add <이름>`은 [packages.nabi-lang.org](https://packages.nabi-lang.org)에서 의존성을 추가하고, `nabi.lock`은 정확한 버전을 기록하며, `nabi update`는 그 버전을 올립니다. 레지스트리의 인덱스는 git 저장소 [nabi-lang/packages-index](https://github.com/nabi-lang/packages-index)입니다. 버전마다 패키지 저장소의 커밋을 가리키고, 레지스트리는 그 커밋의 압축 파일을 SHA-256과 함께 보관하며, `nabi`는 내려받을 때 이를 확인합니다.

공식 패키지 20개(`json`, `http`, `regex`, `table`, `stats`, `plot` 등)는 toolchain과 함께 설치됩니다. 공식 패키지를 쓰는 코드는 처음 쓸 때 `nabi add`도 네트워크도 없이 매니페스트에 추가됩니다.

`nabi publish`는 버전을 레지스트리에 보냅니다. 지금은 레지스트리 관리자만 공개할 수 있으며, 누구나 로그인해 패키지를 쓸 수 있습니다. [패키지 공개](docs:learn/18-features-and-publishing.html#패키지-공개하기)를 보세요.

## 라이선스는 무엇인가요?

컴파일러, 도구, 런타임, 표준 라이브러리, 공식 패키지는 `MIT OR Apache-2.0`이며 둘 중 하나를 고르면 됩니다. 사양, 문서, 이 사이트의 글은 CC BY 4.0입니다. Nabi로 빌드한 프로그램의 라이선스는 원하는 대로 정하면 됩니다. 릴리스 압축 파일에는 각자의 라이선스를 따르는 서드파티 런타임 구성 요소(musl, wasi-libc 등)도 들어 있으며, [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES)에 정리되어 있습니다.

## 내려받은 파일은 어떻게 확인하나요?

릴리스마다 minisign으로 서명한 `SHA256SUMS` 파일이 있고, 압축 파일마다 GitHub 빌드 출처 증명이 있습니다. 절차와 공개 키는 [내려받기 페이지](download.html#내려받은-파일-확인)에 있습니다. 설치 스크립트는 받은 압축 파일의 SHA-256을 확인합니다.

## 보안 문제는 어떻게 신고하나요?

공개 이슈에 올리지 마세요. GitHub의 비공개 취약점 신고(저장소의 **Security** 탭, **Report a vulnerability**)를 쓰거나 security@nabi-lang.org로 메일을 보내 주세요. 정책은 [SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md)에 있습니다. TLS 스택과 `core::crypto`는 아직 독립적인 감사를 받지 않았으며, 이에 관한 신고도 환영합니다.

## 질문하거나 도우려면 어디로 가나요?

질문은 [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions)에, 버그는 이슈로 올려 주세요. 코드나 문서로 기여하려면 [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md)를 읽어 주세요. 커밋에는 DCO 서명(`git commit -s`)을 붙이며, CLA는 없습니다.
