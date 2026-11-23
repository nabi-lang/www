# 治理

<div class="lead-sm">目前由誰決定 Nabi 包含哪些內容，以及一項變更如何被接受。</div>

## 由誰決定

Nabi 目前只有一位維護者，即其 BDFL（[@miniex](https://github.com/miniex)），由他對語言、工具鏈以及每個版本包含的內容做最終決定。審查依領域分給 nabi-lang 組織的各個團隊；目前 BDFL 是每個團隊唯一的成員，貢獻者承擔某個領域後會受邀加入相應團隊。團隊擴大後，團隊範圍內的變更以 lazy consensus 決定：一項提議若在一週內無成員反對即成立。BDFL 的工作室 [DaminStudio](https://daminstudio.com) 負責託管基礎設施，不參與技術問題的決策。完整的規則及其日後的演變方式請見 [GOVERNANCE.md](https://github.com/nabi-lang/.github/blob/main/GOVERNANCE.md)。

## 變更如何被接受

- bug 與小幅修改：開一則 [issue](https://github.com/nabi-lang/nabi/issues)，或直接開 pull request。
- 語言或標準函式庫的變更：先在 [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions) 或 issue 中討論，在撰寫程式碼之前確定設計。[語言規格](https://github.com/nabi-lang/spec)定義了這門語言；改變可觀察行為的變更，要在同一個變更中更新其全部四個版本（英文、韓文、簡體中文與繁體中文）。
- 每個 pull request 都要通過儲存庫的檢查並附上 DCO 簽署；詳情請見[社群](community.html#參與貢獻)。

決策背後的理由記錄在做出決策的地方：issue、討論或 pull request 中。

## 版本發行

在 1.0 之前，次版本號是破壞性變更的位置：0.2.0 可能破壞為 0.1 撰寫的程式碼，而 0.1.x 版本新增功能與修正，但不會破壞它。一個版本在其工作完成時發布；[路線圖](roadmap.html)列出順序，每個版本的說明請見[版本發行](releases/index.html)。只有最新的系列會收到修正。

## 套件

官方套件由 [nabi-lang](https://github.com/nabi-lang) 組織發布，並比照工具鏈維護。[packages.nabi-lang.org](https://packages.nabi-lang.org) 上的其他套件屬於各自的擁有者；登錄庫的[使用政策](https://packages.nabi-lang.org/policy)說明它接受哪些套件，以及套件如何被下架。
