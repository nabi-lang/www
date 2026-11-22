# 治理

<div class="lead-sm">目前由誰決定 Nabi 包含哪些內容，以及一項變更如何被接受。</div>

## 由誰決定

[DaminStudio](https://daminstudio.com) 創立並維護 Nabi：其維護者審查並合併變更、決定每個版本包含的內容，並負責發行。目前還沒有基金會、指導小組或 RFC 流程。若 Nabi 發展出更廣泛的維護者群體，本頁會說明這一點以及他們如何產生。

## 變更如何被接受

- bug 與小幅修改：開一則 [issue](https://github.com/nabi-lang/nabi/issues)，或直接開 pull request。
- 語言或標準函式庫的變更：先在 [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions) 或 issue 中討論，在撰寫程式碼之前確定設計。[語言規格](https://github.com/nabi-lang/spec)定義了這門語言；改變可觀察行為的變更，要在同一個變更中更新其英文版與韓文版。
- 每個 pull request 都要通過儲存庫的檢查並附上 DCO 簽署；詳情請見[社群](community.html#參與貢獻)。

決策背後的理由記錄在做出決策的地方：issue、討論或 pull request 中。

## 版本發行

在 1.0 之前，次版本號是破壞性變更的位置：0.2.0 可能破壞為 0.1 撰寫的程式碼，而 0.1.x 版本新增功能與修正，但不會破壞它。一個版本在其工作完成時發布；[路線圖](roadmap.html)列出順序，每個版本的說明請見[版本發行](releases/index.html)。只有最新的系列會收到修正。

## 套件

官方套件由 [nabi-lang](https://github.com/nabi-lang) 組織發布，並比照工具鏈維護。[packages.nabi-lang.org](https://packages.nabi-lang.org) 上的其他套件屬於各自的擁有者；登錄庫的[使用政策](https://packages.nabi-lang.org/policy)說明它接受哪些套件，以及套件如何被下架。
