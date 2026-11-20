# Download Nabi

<div class="lead-sm">Nabi {release}: one line installs it, or take an archive below. The toolchain is self-contained: <code>nabic</code> has its own code generator and linker.</div>

## Install script

macOS, Linux and FreeBSD:

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11 (x64 or arm64), in PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

The script picks the archive for your machine (on Windows, by the machine's architecture, so arm64 even from an emulated x64 PowerShell), checks its SHA-256 and unpacks it into `~/.nabi` (Windows: `%USERPROFILE%\.nabi`). `install.sh --version <v>` and `install.ps1 -Version <v>` pick a release by its exact version (`{release}`); without them you get the newest release.

The toolchain comes with the official packages, so code that uses them builds without a network. To leave them out: `curl -fsSL https://nabi.sh | sh -s -- --no-packages`, or set `NABI_NO_PACKAGES=1` before either script (`install.ps1 -NoPackages` when run from a file). This runs `nabi component remove packages` after the install.

## Archives

<div class="dl">
<div class="dl-os"><span class="dl-glyph os-apple" aria-hidden="true"></span><h3>macOS</h3><p>Apple silicon</p><code>aarch64-apple-darwin</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-apple-darwin.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64, glibc 2.34+</p><code>x86_64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64, glibc 2.34+</p><code>aarch64-unknown-linux-gnu</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-gnu.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>x86_64, static (musl)</p><code>x86_64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-linux" aria-hidden="true"></span><h3>Linux</h3><p>arm64, static (musl)</p><code>aarch64-unknown-linux-musl</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-unknown-linux-musl.tar.gz.sha256">.tar.gz sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, x64</p><code>x86_64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-windows" aria-hidden="true"></span><h3>Windows</h3><p>Windows 11, arm64</p><code>aarch64-pc-windows-msvc</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip">.zip</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-aarch64-pc-windows-msvc.zip.sha256">sha256</a></p></div>
<div class="dl-os"><span class="dl-glyph os-freebsd" aria-hidden="true"></span><h3>FreeBSD</h3><p>x86_64, FreeBSD 14 or later</p><code>x86_64-unknown-freebsd</code><div class="dl-links"><a class="primary" href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz">.tar.xz</a><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz">.tar.gz</a></div><p class="dl-sum"><a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.xz.sha256">.tar.xz sha256</a> · <a href="https://github.com/nabi-lang/nabi/releases/download/v{release}/nabi-{release}-x86_64-unknown-freebsd.tar.gz.sha256">.tar.gz sha256</a></p></div>
</div>

Each archive has a `.sha256` beside it. Check it, then install from the archive:

```sh
shasum -a 256 -c nabi-{release}-aarch64-apple-darwin.tar.xz.sha256
sh install.sh --archive nabi-{release}-aarch64-apple-darwin.tar.xz
```

The `.tar.xz` is about half the size of the `.tar.gz`; on Linux, tar needs `xz` to unpack it. An unpacked archive also installs itself with its own `install.sh` (Windows: `install.ps1`).

## Verify your download

The install scripts check the SHA-256 of the archive they fetch. To check an archive yourself, each release also has:

- `SHA256SUMS`: the SHA-256 of every archive in the release, signed with [minisign](https://jedisct1.github.io/minisign/) in `SHA256SUMS.minisig`;
- a GitHub build provenance attestation for every archive, which ties it to the release workflow run that built it.

The release signing key (key ID `B33E6FE61BE5314C`):

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

Download `SHA256SUMS` and `SHA256SUMS.minisig` from the [release](https://github.com/nabi-lang/nabi/releases/tag/v{release}) into the directory with your archive, then check the signature and the checksum:

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS            # Linux, FreeBSD
shasum -a 256 -c --ignore-missing SHA256SUMS        # macOS
```

On Windows, in PowerShell, with `minisign.exe` from its [releases](https://github.com/jedisct1/minisign/releases):

```powershell
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
(Get-FileHash nabi-{release}-x86_64-pc-windows-msvc.zip -Algorithm SHA256).Hash.ToLower()
Select-String nabi-{release}-x86_64-pc-windows-msvc.zip SHA256SUMS
```

The two hashes must match. With the [GitHub CLI](https://cli.github.com), check the attestation of an archive:

```sh
gh attestation verify nabi-{release}-aarch64-apple-darwin.tar.xz --repo nabi-lang/nabi
```

The binaries are not code-signed yet (no macOS notarization, no Windows Authenticode), so Gatekeeper and SmartScreen warn about an archive downloaded with a browser. The checks above are how to trust a download for now.

## Platforms

A target is Supported once its tests pass in a real environment for it. Hosts run the toolchain and have a release archive; build targets are what `nabi build --target <triple>` compiles for.

| Host | Triple | Tier |
|------|--------|------|
| macOS, Apple silicon | `aarch64-apple-darwin` | Supported |
| Windows 11, x64 | `x86_64-pc-windows-msvc` | Supported |
| Windows 11, arm64 | `aarch64-pc-windows-msvc` | Supported |
| Linux x64, glibc 2.34+ | `x86_64-unknown-linux-gnu` | Supported |
| Linux arm64, glibc 2.34+ | `aarch64-unknown-linux-gnu` | Supported |
| Linux x64, static (musl) | `x86_64-unknown-linux-musl` | Supported |
| Linux arm64, static (musl) | `aarch64-unknown-linux-musl` | Supported |
| FreeBSD 14+, x64 | `x86_64-unknown-freebsd` | Supported |

| Build target | Triple | Tier |
|--------------|--------|------|
| The eight hosts above | | Supported |
| Linux x86, 32-bit | `i686-unknown-linux-gnu` | Supported |
| Windows x86, 32-bit | `i686-pc-windows-msvc` | Supported |
| Linux ARMv7, hard float | `armv7-unknown-linux-gnueabihf` | Supported |
| Linux ARMv7, hard float, static | `armv7-unknown-linux-musleabihf` | Supported |
| WebAssembly, browser | `wasm32-unknown-unknown` | Supported |
| WebAssembly, WASI preview 2 | `wasm32-wasip2` | Supported |
| WebAssembly, WASI preview 1 with threads | `wasm32-wasip1-threads` | Supported |
| Android x86-64 (emulator), API 29+ | `x86_64-linux-android` | Supported |
| iOS simulator, Apple silicon | `aarch64-apple-ios-sim` | Supported |
| Android arm64 devices | `aarch64-linux-android` | In progress |
| iOS devices | `aarch64-apple-ios` | In progress |
| Linux RISC-V 64 | `riscv64gc-unknown-linux-gnu` | In progress |
| Linux IBM Power, little-endian | `powerpc64le-unknown-linux-gnu` | In progress |
| Linux IBM Z | `s390x-unknown-linux-gnu` | In progress |
| Embedded RISC-V 32, no OS | `riscv32imac-unknown-none-elf` | In progress |

The targets in progress have run only under emulation; `--target` refuses them and names what to use for now. The [roadmap](roadmap.html) has them for the 0.2 series.

You download one archive, for your own machine: every archive carries the runtime of every Supported build target, so `nabi build --target <triple>` builds for another from any host (Apple targets only on macOS; Android ones need the NDK). `nabic --print target-list` lists the triples. See [Tools](docs:spec/refs-lang/009-tools/index.html) for what each needs.

## What else you need

- macOS: the Xcode Command Line Tools (`xcode-select --install`), for the SDK that linking needs.
- Linux: nothing; glibc 2.34 or later (Ubuntu 22.04, Debian 12, RHEL 9 and newer), or any distribution with the static musl archive.
- FreeBSD: FreeBSD 14 or later on x86_64, and `curl` for the install script (`pkg install curl`).
- Windows: Windows 11, on x64 or arm64; nothing else.

Intel Macs and FreeBSD on arm64 have no release archive and are not a target. Every release, with its notes, is on [GitHub](https://github.com/nabi-lang/nabi/releases). Questions: the [FAQ](faq.html). Next: [Getting started](docs:learn/01-getting-started.html).
