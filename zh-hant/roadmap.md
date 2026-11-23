# 路線圖

<div class="lead-sm">正在開發的項目，依發布順序排列。版本在工作完成後發布，沒有預定日期。每個項目都在 <a href="https://github.com/nabi-lang/nabi/milestones">GitHub 里程碑</a>中追蹤。</div>

<div class="rm-legend"><span class="rm-pill now">進行中</span><span class="rm-pill next">下一步</span><span class="rm-pill later">之後</span><span class="rm-pill done">已發布</span></div>

## 下一步

<div class="rm">
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">下一步</span></header>
<h3>選用的 LLVM 後端</h3>
<ul>
<li>選用的 <code>codegen-llvm</code> 元件，以 <code>nabi component add codegen-llvm</code> 安裝，在 <code>nabi.nabion</code> 中依建置設定檔選擇（<code>profile: { "release": { codegen_backend: "llvm" } }</code>），或以 <code>-C codegen-backend=llvm</code> 選擇；預設仍是 Nabi 自己的程式碼產生器</li>
<li><code>nabi test --cross-check=llvm</code> 以兩種程式碼產生器分別建置測試，並比較兩者的輸出</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-ver">0.2</span><span class="rm-pill next">下一步</span></header>
<h3>更多目標</h3>
<ul>
<li>進行中的目標，各自在實體硬體上執行後加入：Android arm64 與 iOS 裝置（<code>aarch64-linux-android</code>、<code>aarch64-apple-ios</code>）、RISC-V 64 Linux（<code>riscv64gc-unknown-linux-gnu</code>）、IBM Power（<code>powerpc64le-unknown-linux-gnu</code>）、IBM Z（<code>s390x-unknown-linux-gnu</code>）以及嵌入式 RISC-V（<code>riscv32imac-unknown-none-elf</code>）</li>
</ul>
</section>
</div>

## 之後

<div class="rm">
<section class="rm-card later">
<header><span class="rm-pill later">之後</span></header>
<h3>MLIR 核心函式</h3>
<ul>
<li>透過 <code>codegen-llvm</code> 元件使用 MLIR：標記的核心函式會編譯成卸載（offload）到其他裝置上執行的程式碼，程式的其餘部分仍由 Nabi 自己的程式碼產生器處理</li>
</ul>
</section>
</div>

## 已發布

<div class="rm-log">
<div class="rm-entry"><span class="rm-ver">0.1.3</span><time datetime="2026-11-22">2026-11-22</time><p><code>nabi audit</code> 以登錄庫的安全性公告檢查 <code>nabi.lock</code> 中鎖定的套件。<a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.3">發行說明</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.2</span><time datetime="2026-11-22">2026-11-22</time><p>修正版本：型別經過 <code>any</code> 的套件（例如 <code>spatial</code> 與 <code>sparse</code>）又能作為相依套件正常建置。<a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.2">發行說明</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.1</span><time datetime="2026-11-22">2026-11-22</time><p>修正版本：每個套件只看得到自己的相依套件，工具鏈也隨附更新後的官方套件。<a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.1">發行說明</a></p></div>
<div class="rm-entry"><span class="rm-ver">0.1.0</span><time datetime="2026-11-22">2026-11-22</time><p>Nabi 的第一個版本：編譯器、<code>nabi</code> 套件工具、語言伺服器、執行環境、標準函式庫與 20 個官方套件，搭配 Nabi 自己的程式碼產生器與連結器，支援 17 個目標，並為 8 個主機提供發行壓縮檔。<a href="https://github.com/nabi-lang/nabi/releases/tag/v0.1.0">發行說明</a></p></div>
</div>

## 函式庫

<div class="lead-sm">標準函式庫維持精簡：語言支援、集合型別、文字、數值、時間、I/O、網路與 TLS。其餘功能都是各有獨立版本的官方套件，發布在 <a href="https://packages.nabi-lang.org">packages.nabi-lang.org</a> 上。官方套件隨工具鏈提供：程式碼用到某個官方套件時，第一次建置就會自動加入它，不需要 <code>nabi add</code>。</div>

<div class="rm">
<section class="rm-card done">
<header><span class="rm-ver">0.1</span><span class="rm-pill done">已發布</span></header>
<h3>官方套件</h3>
<ul>
<li>建立在 core 的 <code>Array</code> 之上的科學計算：<code>linalg</code>、<code>sparse</code>、<code>autodiff</code>、<code>signal</code>、<code>table</code>（支援 Arrow 與 Parquet）、<code>stats</code>、<code>special</code>、<code>optimize</code>、<code>interpolate</code>、<code>spatial</code>、<code>ode</code>、<code>units</code> 與 <code>plot</code></li>
<li>資料格式與 Web：<code>json</code>、<code>toml</code>、<code>csv</code>、<code>http</code> 與 <code>markdown</code>，以及用於語法標示的 <code>nabi-syntax</code></li>
<li><code>regex</code>：線性時間比對（無回溯）、Unicode 字元類別、擷取群組、迭代與取代</li>
</ul>
</section>
<section class="rm-card next">
<header><span class="rm-pill next">下一步</span></header>
<h3>常用套件</h3>
<ul>
<li><code>cli</code>：引數剖析，自動產生說明與子指令</li>
<li><code>log</code>：分級的結構化日誌，輸出目的地可抽換</li>
<li><code>compress</code>：deflate、gzip 與 zstd，支援串流處理</li>
<li><code>uuid</code>：第 4 版與第 7 版，剖析與格式化</li>
<li><code>sqlite</code>：SQLite 繫結</li>
</ul>
</section>
</div>

壓縮檔與安裝指令碼：[下載](download.html)。
