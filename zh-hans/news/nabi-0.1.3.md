# Nabi 0.1.3：nabi audit

<!-- date: 2026-11-22 -->

<div class="lead-sm">Nabi 0.1.3 新增了 <code>nabi audit</code>，用包注册表的安全公告检查项目锁定的包。用 <code>nabi toolchain update</code> 更新，或从<a href="../download.html">下载页面</a>重新安装。</div>

## 检查项目

```sh
nabi audit
```

`nabi audit` 读取 `nabi.lock`，用 [packages.nabi-lang.org/advisories](https://packages.nabi-lang.org/zh-hans/advisories) 上发布的安全公告检查其中的每个注册表包。对每条适用的公告，它会给出公告 ID、摘要、严重程度，以及应当更新到的版本，例如 `nabi update json`。

没有受影响的包时以 0 退出，有受影响的包时以 1 退出，无法检查时以 2 退出，因此可以在 CI 中把它当作关卡：

```yaml
- run: nabi audit
```

`--json` 输出机器可读的记录，`--ignore <id>` 跳过你已阅读并接受的公告，`--offline` 只使用缓存的列表。列表只获取一次，保留一小时。路径依赖和 git 依赖不在检查范围内，输出会列出跳过了哪些。

## 注册表上的安全公告

安全公告采用其他生态系统也在用的 [OSV](https://ossf.github.io/osv-schema/) 格式。每条公告都有自己的页面，受影响的版本会显示横幅，完整列表可以通过 `/api/v1/advisories?format=json` API 获取。发现包中的漏洞时，请先告知其所有者；如果是注册表或工具链的漏洞，请发邮件至 [security@nabi-lang.org](mailto:security@nabi-lang.org)。

详情见指南中的[安全公告](docs:learn/packages/04-security-advisories.html)一页，完整的变更列表见[发布说明](https://github.com/nabi-lang/nabi/releases/tag/v0.1.3)。
