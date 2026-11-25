# Nabi 내려받기

<div class="lead-sm">Nabi {release}: 한 줄로 설치하거나, 아래에서 압축 파일을 받으세요. toolchain은 그 자체로 완결되어 있습니다. <code>nabic</code>은 자체 코드 생성기와 링커를 갖추고 있습니다.</div>

## 설치 스크립트

macOS, Linux, FreeBSD:

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11(x64 또는 arm64), PowerShell에서:

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

스크립트는 컴퓨터에 맞는 압축 파일을 골라(Windows에서는 컴퓨터의 아키텍처를 보므로, 에뮬레이션되는 x64 PowerShell에서도 arm64를 고릅니다) SHA-256을 확인한 다음 `~/.nabi`(Windows: `%USERPROFILE%\.nabi`)에 풉니다. `install.sh --version <v>`와 `install.ps1 -Version <v>`는 정확한 버전(`{release}`)으로 릴리스를 고릅니다. 지정하지 않으면 가장 새 릴리스를 받습니다.

toolchain에는 공식 패키지가 함께 들어 있어서, 공식 패키지를 쓰는 코드는 네트워크 없이 빌드됩니다. 빼고 설치하려면 `curl -fsSL https://nabi.sh | sh -s -- --no-packages`를 쓰거나, 어느 스크립트든 실행하기 전에 `NABI_NO_PACKAGES=1`을 설정하세요(파일로 실행할 때는 `install.ps1 -NoPackages`). 이 옵션은 설치가 끝난 뒤 `nabi component remove packages`를 실행합니다.

## GitHub가 느리거나 막혀 있을 때

릴리스는 GitHub에서 내려받습니다. `dist.nabi-lang.org`는 모든 릴리스를 같은 구조로 미러링하므로, `NABI_DIST`를 설정하면 대신 그곳에서 받습니다.

```sh
curl -fsSL https://nabi.sh | NABI_DIST=https://dist.nabi-lang.org sh
```

PowerShell에서:

```powershell
$env:NABI_DIST = "https://dist.nabi-lang.org"
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

`nabi toolchain update`도 `NABI_DIST`를 읽으므로, 계속 미러로 업데이트하려면 셸 프로필에(Windows에서는 사용자 환경 변수로) 설정해 두세요. 미러에서 받은 파일도 다른 다운로드와 똑같이 릴리스의 `SHA256SUMS`로 확인하고, `minisign`이 설치되어 있으면 그 서명도 확인합니다. 아래의 압축 파일도 미러의 같은 경로에 있습니다. `https://github.com/nabi-lang/nabi/releases`를 `https://dist.nabi-lang.org`로 바꾸면 됩니다.

## 압축 파일

<div class="dl">
<div class="dl-os"><span class="dl-glyph os-apple" aria-hidden="true"></span><h3>macOS</h3><p>Apple 실리콘</p><code>aarch64-apple-darwin</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64, glibc 2.34 이상</p><code>x86_64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64, glibc 2.34 이상</p><code>aarch64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64, 정적 링크(musl)</p><code>x86_64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64, 정적 링크(musl)</p><code>aarch64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, x64</p><code>x86_64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, arm64</p><code>aarch64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-freebsd" aria-hidden="true"></span><h3>FreeBSD</h3><p>x86_64, FreeBSD 14 이상</p><code>x86_64-unknown-freebsd</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz.sha256">.tar.gz sha256</a></p></div>
</div>

압축 파일마다 옆에 `.sha256`이 있습니다. 확인한 다음 압축 파일로 설치하세요.

```sh
shasum -a 256 -c nabi-{release}-aarch64-apple-darwin.tar.xz.sha256
sh install.sh --archive nabi-{release}-aarch64-apple-darwin.tar.xz
```

`.tar.xz`는 `.tar.gz`의 절반쯤 크기입니다. Linux에서 풀려면 tar에 `xz`가 있어야 합니다. 푼 압축 파일은 그 안의 `install.sh`(Windows: `install.ps1`)로도 설치됩니다.

## 내려받은 파일 확인

설치 스크립트는 받은 압축 파일의 SHA-256을 직접 확인합니다. 압축 파일을 손수 확인하려면 릴리스마다 다음이 있습니다.

- `SHA256SUMS`: 릴리스의 모든 압축 파일의 SHA-256. [minisign](https://jedisct1.github.io/minisign/)으로 서명했으며 서명은 `SHA256SUMS.minisig`에 있습니다.
- 압축 파일마다 GitHub 빌드 출처 증명(attestation). 그 파일을 빌드한 릴리스 워크플로 실행과 파일을 이어 줍니다.

릴리스 서명 키(키 ID `B33E6FE61BE5314C`):

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

[릴리스](https://github.com/nabi-lang/nabi/releases/tag/v{release})에서 `SHA256SUMS`와 `SHA256SUMS.minisig`를 압축 파일이 있는 디렉터리로 받은 다음, 서명과 체크섬을 확인하세요.

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS            # Linux, FreeBSD
shasum -a 256 -c --ignore-missing SHA256SUMS        # macOS
```

Windows에서는 PowerShell에서, minisign [릴리스](https://github.com/jedisct1/minisign/releases)의 `minisign.exe`로:

```powershell
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
(Get-FileHash nabi-{release}-x86_64-pc-windows-msvc.zip -Algorithm SHA256).Hash.ToLower()
Select-String nabi-{release}-x86_64-pc-windows-msvc.zip SHA256SUMS
```

두 해시가 같아야 합니다. [GitHub CLI](https://cli.github.com)로 압축 파일의 출처 증명을 확인하세요.

```sh
gh attestation verify nabi-{release}-aarch64-apple-darwin.tar.xz --repo nabi-lang/nabi
```

바이너리에는 아직 코드 서명이 없습니다(macOS 공증도, Windows Authenticode도 없음). 그래서 브라우저로 받은 압축 파일에는 Gatekeeper와 SmartScreen이 경고를 띄웁니다. 지금은 위의 확인으로 내려받은 파일을 믿으세요.

## 플랫폼

대상은 실제 환경에서 테스트를 통과해야 지원 대상이 됩니다. 호스트는 toolchain이 돌아가는 곳으로, 릴리스 압축 파일이 있습니다. 빌드 대상은 `nabi build --target <triple>`이 컴파일하는 대상입니다.

| 호스트 | triple | 단계 |
|------|--------|------|
| macOS, Apple 실리콘 | `aarch64-apple-darwin` | 지원 |
| Windows 11, x64 | `x86_64-pc-windows-msvc` | 지원 |
| Windows 11, arm64 | `aarch64-pc-windows-msvc` | 지원 |
| Linux x64, glibc 2.34 이상 | `x86_64-unknown-linux-gnu` | 지원 |
| Linux arm64, glibc 2.34 이상 | `aarch64-unknown-linux-gnu` | 지원 |
| Linux x64, 정적(musl) | `x86_64-unknown-linux-musl` | 지원 |
| Linux arm64, 정적(musl) | `aarch64-unknown-linux-musl` | 지원 |
| FreeBSD 14 이상, x64 | `x86_64-unknown-freebsd` | 지원 |

| 빌드 대상 | triple | 단계 |
|--------------|--------|------|
| 위의 호스트 8곳 | | 지원 |
| Linux x86, 32비트 | `i686-unknown-linux-gnu` | 지원 |
| Windows x86, 32비트 | `i686-pc-windows-msvc` | 지원 |
| Linux ARMv7, 하드 플로트 | `armv7-unknown-linux-gnueabihf` | 지원 |
| Linux ARMv7, 하드 플로트, 정적 | `armv7-unknown-linux-musleabihf` | 지원 |
| WebAssembly, 브라우저 | `wasm32-unknown-unknown` | 지원 |
| WebAssembly, WASI preview 2 | `wasm32-wasip2` | 지원 |
| WebAssembly, 스레드가 있는 WASI preview 1 | `wasm32-wasip1-threads` | 지원 |
| Android x86-64(에뮬레이터), API 29 이상 | `x86_64-linux-android` | 지원 |
| iOS 시뮬레이터, Apple 실리콘 | `aarch64-apple-ios-sim` | 지원 |
| Android arm64 기기 | `aarch64-linux-android` | 진행 중 |
| iOS 기기 | `aarch64-apple-ios` | 진행 중 |
| Linux RISC-V 64 | `riscv64gc-unknown-linux-gnu` | 진행 중 |
| Linux IBM Power, 리틀 엔디언 | `powerpc64le-unknown-linux-gnu` | 진행 중 |
| Linux IBM Z | `s390x-unknown-linux-gnu` | 진행 중 |
| 임베디드 RISC-V 32, OS 없음 | `riscv32imac-unknown-none-elf` | 진행 중 |

진행 중인 대상은 에뮬레이션에서만 돌려 봤습니다. `--target`은 이 대상을 받지 않고, 지금은 무엇을 쓰면 되는지 알려 줍니다. [로드맵](roadmap.html)에서 0.2 계열로 잡혀 있습니다.

압축 파일은 지금 쓰는 컴퓨터용 하나만 받으면 됩니다. 압축 파일마다 모든 지원 빌드 대상의 런타임이 들어 있어서, 어느 호스트에서든 `nabi build --target <triple>`로 다른 대상용으로 빌드합니다(Apple 대상은 macOS에서만, Android 대상에는 NDK가 필요). triple 목록은 `nabic --print target-list`로 볼 수 있습니다. 대상마다 필요한 것은 [도구](docs:spec/refs-lang/009-tools/index.html)에 있습니다.

## 그 밖에 필요한 것

- macOS: 링크에 필요한 SDK를 위해 Xcode Command Line Tools(`xcode-select --install`).
- Linux: 없음. glibc 2.34 이상(Ubuntu 22.04, Debian 12, RHEL 9 이후), 또는 정적 musl 압축 파일이면 어느 배포판이든.
- FreeBSD: x86_64의 FreeBSD 14 이상, 그리고 설치 스크립트에 쓸 `curl`(`pkg install curl`).
- Windows: x64 또는 arm64의 Windows 11. 그 밖에는 없음.

Intel Mac과 arm64 FreeBSD는 릴리스 압축 파일이 없고 대상도 아닙니다. 모든 릴리스와 릴리스 노트는 [GitHub](https://github.com/nabi-lang/nabi/releases)에 있습니다. 궁금한 점: [FAQ](faq.html). 다음: [시작하기](docs:learn/01-getting-started.html).
