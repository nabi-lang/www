# 路线图

<div class="lead-sm">正在构建的内容，按发布顺序排列。一个版本在其工作完成时发布，不设日期。每一项都在 <a href="https://github.com/nabi-lang/nabi/milestones">GitHub 里程碑</a>中跟踪。</div>

<div class="rm-legend"><span class="rm-pill now">进行中</span><span class="rm-pill next">下一步</span><span class="rm-pill later">以后</span><span class="rm-pill done">已发布</span></div>

## 下一步

<div class="rm">
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">下一步</span></header>
<h3>可选的 LLVM 后端</h3>
<ul>
<li>可选的 <code>codegen-llvm</code> 组件，用 <code>nabi component add codegen-llvm</code> 安装，在 <code>nabi.nabion</code> 中按构建配置选择（<code>profile: { "release": { codegen_backend: "llvm" } }</code>），或用 <code>-C codegen-backend=llvm</code> 选择；默认仍是 Nabi 自己的代码生成器</li>
<li><code>nabi test --cross-check=llvm</code> 用两种代码生成器分别构建测试，并比较它们的输出</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">下一步</span></header>
<h3>更多目标</h3>
<ul>
<li>进行中的目标，各自在真实硬件上运行后加入：Android arm64 和 iOS 设备（<code>aarch64-linux-android</code>、<code>aarch64-apple-ios</code>）、RISC-V 64 Linux（<code>riscv64gc-unknown-linux-gnu</code>）、IBM Power（<code>powerpc64le-unknown-linux-gnu</code>）、IBM Z（<code>s390x-unknown-linux-gnu</code>）以及嵌入式 RISC-V（<code>riscv32imac-unknown-none-elf</code>）</li>
</ul>
</section>
</div>

## 以后

<div class="rm">
<section class="rm-card later">
<header><span class="rm-pill later">以后</span></header>
<h3>MLIR 内核</h3>
<ul>
<li>通过 <code>codegen-llvm</code> 组件使用 MLIR：标记的内核函数被编译用于卸载执行，程序的其余部分仍使用 Nabi 自己的代码生成器</li>
</ul>
</section>
</div>

## 已发布

<div class="rm-log">
<div class="rm-entry"><span class="rm-ver">0.1.3</span><time datetime="2026-11-22">2026-11-22</time><p><code>nabi audit</code> 用注册表的安全公告检查 <code>nabi.lock</code> 中锁定的包。 <a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.3">发布说明</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.2</span><time datetime="2026-11-22">2026-11-22</time><p>修复版本：类型经过 <code>any</code> 的包（如 <code>spatial</code> 和 <code>sparse</code>）再次可以作为依赖构建。<a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.2">发布说明</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.1</span><time datetime="2026-11-22">2026-11-22</time><p>修复版本：每个包只能看到自己的依赖，工具链附带更新后的官方包。<a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.1">发布说明</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.0</span><time datetime="2026-11-22">2026-11-22</time><p>Nabi 的第一个版本：编译器、<code>nabi</code> 包管理工具、语言服务器、运行时、标准库和 20 个官方包，带有 Nabi 自己的代码生成器和链接器，支持 17 个目标，并为 8 个主机提供发布压缩包。<a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.0">发布说明</a></p></div>
</div>

## 库

<div class="lead-sm">标准库保持精简：语言支持、集合类型、文本、数值、时间、I/O、网络和 TLS。其他一切都是有独立版本的官方包，发布在 <a href="https://packages.nabi-lang.org">packages.nabi-lang.org</a> 上。官方包随工具链提供：使用某个官方包的代码在首次构建时会自动添加它，无需 <code>nabi add</code>。</div>

<div class="rm">
<section class="rm-card done">
<header><span class="rm-ver">0.1</span><span class="rm-pill done">已发布</span></header>
<h3>官方包</h3>
<ul>
<li>基于 core 的 <code>Array</code> 的科学计算：<code>linalg</code>、<code>sparse</code>、<code>autodiff</code>、<code>signal</code>、<code>table</code>（支持 Arrow 和 Parquet）、<code>stats</code>、<code>special</code>、<code>optimize</code>、<code>interpolate</code>、<code>spatial</code>、<code>ode</code>、<code>units</code> 和 <code>plot</code></li>
<li>数据格式与 Web：<code>json</code>、<code>toml</code>、<code>csv</code>、<code>http</code> 和 <code>markdown</code>，以及用于语法高亮的 <code>nabi-syntax</code></li>
<li><code>regex</code>：线性时间匹配（无回溯）、Unicode 字符类、捕获组、迭代和替换</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-pill next">下一步</span></header>
<h3>常用包</h3>
<ul>
<li><code>cli</code>：参数解析，自动生成帮助信息和子命令</li>
<li><code>log</code>：分级的结构化日志，输出目标可插拔</li>
<li><code>compress</code>：deflate、gzip 和 zstd，支持流式处理</li>
<li><code>uuid</code>：版本 4 和 7，解析和格式化</li>
<li><code>sqlite</code>：SQLite 绑定</li>
</ul>
</section>
</div>

压缩包和安装脚本：[下载](download.html)。
