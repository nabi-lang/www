# FAQ

<div class="lead-sm">Short answers to the questions people ask first. The <a href="news/nabi-0.1.0.html">0.1.0 announcement</a> has the whole picture of the current release.</div>

## Why another language?

Nabi started from one motive: a single language that can do everything its author wants to do. It does not target a particular audience or argue an academic position. The [specification](docs:spec/index.html) states the two rules every design decision falls back on: a narrow core with rich libraries, and clear rules that leave you free inside them. In practice that means static types, closed sum types, no null, errors in function signatures, no implicit numeric promotion, and a garbage collector so that you do not manage memory by hand.

If you already use a language you are happy with, Nabi does not claim to replace it. [Nabi for Pythonistas](docs:learn/nabi-for-python.html) and [Nabi for Rustaceans](docs:learn/nabi-for-rust.html) show how it compares on everyday code.

## Why no LLVM?

So that one archive is the whole toolchain. `nabic` generates machine code and links it itself, and each archive ships the runtime of every supported target, so `nabi build --target <triple>` cross-compiles from any host with no system linker, C compiler or SDK to install (Apple targets still need Apple's SDK, Android ones the NDK). It also keeps the compiler, the linker and the runtime in one code base that the project can change together.

The cost is a younger code generator. Nabi publishes no performance comparison with LLVM-based compilers yet; measure your own workload. An optional LLVM backend, installed as a component and chosen per profile, is planned for the 0.2 series (see the [roadmap](roadmap.html)); the default stays Nabi's own code generator.

## What is stable?

Nothing is frozen before 1.0. Nabi follows Cargo's reading of semver for 0.x: the minor number is the breaking slot. 0.2.0 may break code written for 0.1; 0.1.1, 0.1.2 and so on add features and fixes without breaking it. Expect breaking changes in each minor release until 1.0, with the changes listed in the release notes.

Only the latest series gets fixes and security fixes. Older archives stay downloadable. `nabi toolchain update` moves you to the newest release, and a package's `toolchain` field pins the series it builds with.

## Which platforms?

The toolchain runs on 8 hosts: macOS on Apple silicon; Windows 11 on x64 and arm64; Linux on x64 and arm64, with glibc 2.34+ or static musl; and FreeBSD 14+ on x64. It builds for 17 supported targets, which add 32-bit x86 Linux and Windows, 32-bit ARM Linux, three WebAssembly targets, Android x86-64 and the iOS simulator. Six more targets (Android and iOS devices, riscv64, ppc64le, s390x and embedded RISC-V) are in progress: `--target` refuses them until they have run on real hardware. The [download page](download.html#platforms) has the full table.

Intel Macs, 32-bit hosts and FreeBSD on arm64 are not supported.

## How do packages and the registry work?

A package is a directory with a `nabi.nabion` manifest. `nabi add <name>` adds a dependency from [packages.nabi-lang.org](https://packages.nabi-lang.org), `nabi.lock` records the exact versions, and `nabi update` moves them. The registry's index is a git repository, [nabi-lang/packages-index](https://github.com/nabi-lang/packages-index): each version points to a commit of the package's own repository, and the registry keeps an archive of that commit with its SHA-256, which `nabi` checks on download.

The 20 official packages (`json`, `http`, `regex`, `table`, `stats`, `plot` and more) come with the toolchain. Code that uses one gets it added to its manifest on first use, with no `nabi add` and no network.

`nabi publish` sends a version to the registry. For now only the registry's maintainers can publish; anyone can sign in and use packages. See [Publishing a package](docs:learn/18-features-and-publishing.html#publishing-a-package).

## What is the license?

The compiler, tools, runtime, standard library and official packages are `MIT OR Apache-2.0`, at your option. The specification, the docs and the text of this site are CC BY 4.0. A program you build with Nabi is yours to license as you like; the release archives also ship third-party runtime pieces (musl, wasi-libc and others) under their own licenses, listed in [THIRD-PARTY-NOTICES](https://github.com/nabi-lang/nabi/blob/main/THIRD-PARTY-NOTICES).

## How do I verify a download?

Each release has a `SHA256SUMS` file signed with minisign, and a GitHub build provenance attestation for every archive. The steps and the public key are on the [download page](download.html#verify-your-download). The install scripts check the SHA-256 of the archive they fetch.

## How do I report a security issue?

Not in a public issue. Use GitHub's private vulnerability reporting (the **Security** tab of the repository, **Report a vulnerability**) or write to security@nabi-lang.org. [SECURITY.md](https://github.com/nabi-lang/nabi/blob/main/SECURITY.md) has the policy. The TLS stack and `core::crypto` have had no independent audit yet; reports about them are welcome.

## Where do I ask questions or help out?

Ask in [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions) and report bugs as issues. To contribute code or docs, read [CONTRIBUTING.md](https://github.com/nabi-lang/nabi/blob/main/CONTRIBUTING.md): commits carry a DCO sign-off (`git commit -s`), and there is no CLA.
