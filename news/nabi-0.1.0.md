# Announcing Nabi 0.1.0

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.0 is the first release of Nabi: a compiled language, its toolchain, a package registry and the sites around them. This post says what is in it, what runs where, what is not done yet, and how to take part.</div>

## What Nabi is

Nabi is a statically typed, compiled language with closed sum types, no null, and errors written in function signatures. Programs are native executables (or WebAssembly modules) with a garbage-collected runtime. The design follows two rules from the [specification](docs:spec/index.html): a narrow core with rich libraries, and clear rules that leave the user free inside them. The language decides types, dispatch, the memory model and evaluation order once; library design, domain modeling and code structure are left to you.

A first program:

```sh
nabi new hello
cd hello
nabi run
```

## What 0.1.0 includes

- `nabic`, the compiler. It has its own code generator and its own linker: no LLVM, no system linker, no C compiler. A built-in C front end reads C headers for `nabi bindgen` and compiles C sources with `nabi cc`.
- `nabi`, the build and package tool: `new`, `build`, `run`, `test`, `bench`, `fmt`, `lint`, `doc`, `add`, `publish`, `toolchain` to install and switch versions, and more (`nabi help` lists them).
- `nabils`, the language server, a REPL (`nabi repl`) and a Jupyter kernel (`nabi jupyter install`).
- The runtime, with a generational, moving garbage collector that works with threads, and async tasks.
- The standard library in three tiers, `bare`, `core` and `std`: collections, text, numbers, time, files, processes, networking and TLS. Its API is on [docs.nabi-lang.org](docs:std/index.html).
- The package registry, [packages.nabi-lang.org](https://packages.nabi-lang.org), with 20 official packages: `autodiff`, `csv`, `http`, `interpolate`, `json`, `linalg`, `markdown`, `nabi-syntax`, `ode`, `optimize`, `plot`, `regex`, `signal`, `sparse`, `spatial`, `special`, `stats`, `table`, `toml` and `units`. They come with the toolchain: code that uses one gets it added to its manifest on first use, with no network.
- Editor support through `nabils`: [VS Code](https://github.com/nabi-lang/nabi.vscode), [Vim](https://github.com/nabi-lang/nabi.vim) and [Zed](https://github.com/nabi-lang/nabi.zed).
- The [playground](https://playground.nabi-lang.org), which compiles a program to WebAssembly and runs it in the browser.
- The docs: a guide, examples, the language and standard library specification, the standard library API and one page per error code, in English and Korean.

## Platforms

The toolchain runs on 8 hosts, one release archive each:

| Host | Triple |
|------|--------|
| macOS, Apple silicon | `aarch64-apple-darwin` |
| Windows 11, x64 | `x86_64-pc-windows-msvc` |
| Windows 11, arm64 | `aarch64-pc-windows-msvc` |
| Linux x64, glibc 2.34+ | `x86_64-unknown-linux-gnu` |
| Linux arm64, glibc 2.34+ | `aarch64-unknown-linux-gnu` |
| Linux x64, static (musl) | `x86_64-unknown-linux-musl` |
| Linux arm64, static (musl) | `aarch64-unknown-linux-musl` |
| FreeBSD 14+, x64 | `x86_64-unknown-freebsd` |

It builds for 17 supported targets: the 8 hosts, plus `i686-unknown-linux-gnu`, `i686-pc-windows-msvc`, `armv7-unknown-linux-gnueabihf`, `armv7-unknown-linux-musleabihf`, `wasm32-unknown-unknown` (browser), `wasm32-wasip2`, `wasm32-wasip1-threads`, `x86_64-linux-android` (tested on the emulator) and `aarch64-apple-ios-sim` (the iOS simulator). A target is supported once its tests pass in a real environment for it. Every archive carries the runtime of every supported target, so `nabi build --target <triple>` cross-compiles from any host; Apple targets build only on macOS, Android ones need the NDK.

Six targets are in progress. The code is there, but they have only run under emulation, so `--target` refuses them and names what to use for now:

- `aarch64-linux-android` (Android devices)
- `aarch64-apple-ios` (iOS devices)
- `riscv64gc-unknown-linux-gnu`
- `powerpc64le-unknown-linux-gnu`
- `s390x-unknown-linux-gnu`
- `riscv32imac-unknown-none-elf` (embedded RISC-V)

The [roadmap](../roadmap.html) has them for the 0.2 series.

## Stability

Nabi is pre-1.0 and follows Cargo's reading of semver for 0.x: the minor number is the breaking slot. 0.2.0 may break code written for 0.1; 0.1.1, 0.1.2 and so on add features and fixes without breaking it. Expect breaking changes in each minor release until 1.0. Only the latest series gets fixes, security fixes included.

## Install

macOS, Linux and FreeBSD:

```sh
curl -fsSL https://nabi.sh | sh
```

Windows 11 (x64 or arm64), in PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://nabi.sh/install.ps1 | iex"
```

The script picks the archive for your machine, checks its SHA-256 and unpacks it into `~/.nabi` (Windows: `%USERPROFILE%\.nabi`). The [download page](../download.html) has the archives and the other options; Nix users can run `nix profile install github:nabi-lang/nabi`.

## Verify a download

Each release has a `SHA256SUMS` file, signed with [minisign](https://jedisct1.github.io/minisign/) (`SHA256SUMS.minisig`), and a GitHub build provenance attestation for every archive. The release signing key:

```text
untrusted comment: minisign public key B33E6FE61BE5314C
RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
```

```sh
minisign -Vm SHA256SUMS -P RWRMMeUb5m8+s0rEtzbR47dmyrMdlGyGQSvWUn/Ob5QYh0GHgs1GvJEs
sha256sum -c --ignore-missing SHA256SUMS
gh attestation verify nabi-0.1.0-x86_64-unknown-linux-gnu.tar.xz --repo nabi-lang/nabi
```

The [download page](../download.html#verify-your-download) has the steps for each system.

## Known limits

- The TLS stack and the cryptography in `core::crypto` are Nabi's own code, tested against NIST CAVP and Wycheproof vectors, and have had no independent audit. Treat them as experimental and do not rely on them to protect real secrets yet.
- The binaries are not code-signed: no macOS notarization and no Windows Authenticode yet. Gatekeeper and SmartScreen warn about an archive downloaded with a browser; the `curl | sh` and `irm | iex` installers are not affected. The minisign signature and the attestations above are how to check a download for now.
- Six targets are in progress (above).
- Only the registry's maintainers can publish packages for now. Anyone can sign in and use packages; `nabi login` says so for an account that cannot publish yet.
- Programs built for the `-gnu` Linux targets need glibc 2.34 or newer. On an older system the installer picks the static musl archive.
- The toolchain's build cache is capped at 5 GiB; set `NABI_CACHE_MAX_SIZE` (`2G`, `off`) to change it, and `nabi cache prune` or `nabi cache clean` to shrink it.
- Nabi has no published performance comparison yet. Its code generator is young; measure your own workload.

## Get involved

- Questions, ideas and show-and-tell: [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions).
- Bugs: [issues](https://github.com/nabi-lang/nabi/issues) on the repository they concern.
- Code and docs: read [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md). Commits carry a DCO sign-off (`git commit -s`); there is no CLA.
- Security issues: not in public. Use GitHub's private vulnerability reporting or write to security@nabi-lang.org ([SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md)).
- Common questions: the [FAQ](../faq.html).

## Thanks

Thanks to everyone who tried early builds, reported problems and read drafts of the docs, and to the projects Nabi learns from and builds on: the Rust toolchain it is written in, musl, wasi-libc, mingw-w64 and the others listed in [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES).
