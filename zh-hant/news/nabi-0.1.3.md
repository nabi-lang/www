# Nabi 0.1.3：nabi audit

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.3 新增了 <code>nabi audit</code>，以套件登錄庫的安全性公告檢查專案鎖定的套件。以 <code>nabi toolchain update</code> 更新，或從<a href="../download.html">下載頁面</a>重新安裝。</div>

## 檢查專案

```sh
nabi audit
```

`nabi audit` 會讀取 `nabi.lock`，以 [packages.nabi-lang.org/advisories](https://packages.nabi-lang.org/zh-hant/advisories) 上發布的安全性公告檢查其中的每個登錄庫套件。對每則適用的公告，它會列出公告 ID、摘要、嚴重程度，以及應該更新到的版本，例如 `nabi update json`。

沒有受影響的套件時以 0 結束，有受影響的套件時以 1 結束，無法檢查時以 2 結束，因此可以在 CI 中當作關卡使用：

```yaml
- run: nabi audit
```

`--json` 輸出機器可讀的紀錄，`--ignore <id>` 略過你已閱讀並接受的公告，`--offline` 只使用快取的清單。清單只取得一次，保留一小時。路徑相依與 git 相依不在檢查範圍內，輸出會列出略過了哪些。

## 登錄庫上的安全性公告

安全性公告採用其他生態系也在使用的 [OSV](https://ossf.github.io/osv-schema/) 格式。每則公告都有自己的頁面，受影響的版本會顯示橫幅，完整清單可透過 `/api/v1/advisories?format=json` API 取得。發現套件的漏洞時，請先通知其擁有者；若是登錄庫或工具鏈的漏洞，請寄信至 [security@nabi-lang.org](mailto:security@nabi-lang.org)。

詳情請見指南中的〈[安全性公告](docs:learn/packages/04-security-advisories.html)〉一頁，完整的變更清單請見[發行說明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.3)。
