# Roadmap

<div class="lead-sm">What is being built, in the order it ships. A version ships when its work is done; there are no dates. Every item is tracked in a <a href="https://github.com/nabi-lang/nabi/milestones">GitHub milestone</a>.</div>

<div class="rm-legend"><span class="rm-pill now">In progress</span><span class="rm-pill next">Next</span><span class="rm-pill later">Later</span><span class="rm-pill done">Shipped</span></div>

## Next

<div class="rm">
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">Next</span></header>
<h3>Optional LLVM backend</h3>
<ul>
<li>An optional <code>codegen-llvm</code> component, installed with <code>nabi component add codegen-llvm</code> and selected per profile in <code>nabi.nabion</code> (<code>profile: { "release": { codegen_backend: "llvm" } }</code>) or with <code>-C codegen-backend=llvm</code>; the default stays Nabi's own code generator</li>
<li><code>nabi test --cross-check=llvm</code> builds the tests with both code generators and compares their output</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">Next</span></header>
<h3>More targets</h3>
<ul>
<li>The targets in progress, once each runs on real hardware: Android arm64 and iOS devices (<code>aarch64-linux-android</code>, <code>aarch64-apple-ios</code>), RISC-V 64 Linux (<code>riscv64gc-unknown-linux-gnu</code>), IBM Power (<code>powerpc64le-unknown-linux-gnu</code>), IBM Z (<code>s390x-unknown-linux-gnu</code>) and embedded RISC-V (<code>riscv32imac-unknown-none-elf</code>)</li>
</ul>
</section>
</div>

## Later

<div class="rm">
<section class="rm-card later">
<header><span class="rm-pill later">Later</span></header>
<h3>MLIR kernels</h3>
<ul>
<li>MLIR through the <code>codegen-llvm</code> component: marked kernel functions are compiled for offload while the rest of the program keeps Nabi's own code generator</li>
</ul>
</section>
</div>

## Shipped

<div class="rm-log">
<div class="rm-entry"><span class="rm-ver">0.1.8</span><time datetime="2026-11-28">2026-11-28</time><p>The <code>units</code> package 0.1.2 bundled, which converts with <code>-></code> (<code>5km -> mi</code>). <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.8">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.7</span><time datetime="2026-11-28">2026-11-28</time><p>Operators can bind <code>-></code>, so unit conversions read <code>5km -> mi</code> with no Unicode arrow to type. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.7">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.6</span><time datetime="2026-11-28">2026-11-28</time><p>Clearer errors when two types differ only in const parameters, such as mixing units, and the <code>units</code> package 0.1.1 bundled. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.6">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.5</span><time datetime="2026-11-24">2026-11-24</time><p>A fix release: the <code>table</code> package, and projects that depend on it, build again after a 0.1.4 regression. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.5">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.4</span><time datetime="2026-11-24">2026-11-24</time><p>Pattern and inference fixes, and errors for habits from other languages that say what to write instead. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.4">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.3</span><time datetime="2026-11-22">2026-11-22</time><p><code>nabi audit</code> checks the packages pinned in <code>nabi.lock</code> against the registry's security advisories. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.3">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.2</span><time datetime="2026-11-22">2026-11-22</time><p>A fix release: packages whose types go through <code>any</code>, such as <code>spatial</code> and <code>sparse</code>, build again as dependencies. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.2">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.1</span><time datetime="2026-11-22">2026-11-22</time><p>A fix release: each package sees only its own dependencies, and the toolchain bundles the updated official packages. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.1">Release notes</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.0</span><time datetime="2026-11-22">2026-11-22</time><p>The first release of Nabi: the compiler, the <code>nabi</code> package tool, the language server, the runtime, the standard library and 20 official packages, with Nabi's own code generator and linker for 17 supported targets and release archives for 8 hosts. <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.0">Release notes</a></p></div>
</div>

## Libraries

<div class="lead-sm">The standard library stays narrow: language support, collections, text, numbers, time, I/O, networking and TLS. Everything else is a first-party package with its own version, published to <a href="https://packages.nabi-lang.org">packages.nabi-lang.org</a>. The first-party packages come with the toolchain: code that uses one gets it added on its first build, with no <code>nabi add</code>.</div>

<div class="rm">
<section class="rm-card done">
<header><span class="rm-ver">0.1</span><span class="rm-pill done">Shipped</span></header>
<h3>First-party packages</h3>
<ul>
<li>Science on core's <code>Array</code>: <code>linalg</code>, <code>sparse</code>, <code>autodiff</code>, <code>signal</code>, <code>table</code> (with Arrow and Parquet), <code>stats</code>, <code>special</code>, <code>optimize</code>, <code>interpolate</code>, <code>spatial</code>, <code>ode</code>, <code>units</code> and <code>plot</code></li>
<li>Formats and the web: <code>json</code>, <code>toml</code>, <code>csv</code>, <code>http</code> and <code>markdown</code>, and <code>nabi-syntax</code> for highlighting</li>
<li><code>regex</code>: linear-time matching (no backtracking), Unicode classes, captures, iteration and replacement</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-pill next">Next</span></header>
<h3>Everyday packages</h3>
<ul>
<li><code>cli</code>: argument parsing with generated help and subcommands</li>
<li><code>log</code>: leveled, structured logging with pluggable sinks</li>
<li><code>compress</code>: deflate, gzip and zstd, streaming</li>
<li><code>uuid</code>: versions 4 and 7, parsing and formatting</li>
<li><code>sqlite</code>: SQLite bindings</li>
</ul>
</section>
</div>

Archives and the install script: [Download](download.html).
