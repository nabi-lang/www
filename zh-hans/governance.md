# 治理

<div class="lead-sm">目前由谁决定 Nabi 包含什么，以及一项变更如何被接纳。</div>

## 由谁决定

[DaminStudio](https://daminstudio.com) 创建并维护 Nabi：其维护者审查并合并变更，决定每个版本包含的内容，并负责发布。目前还没有基金会、指导小组或 RFC 流程。如果 Nabi 形成了更广泛的维护者群体，本页会说明这一点以及他们如何产生。

## 变更如何被接纳

- bug 和小改动：提交 [issue](https://github.com/nabi-lang/nabi/issues)，或直接提交 pull request。
- 语言或标准库的变更：先在 [GitHub Discussions](https://github.com/nabi-lang/nabi/discussions) 或 issue 中讨论，在写代码之前确定设计。[语言规范](https://github.com/nabi-lang/spec)定义了这门语言；改变可观察行为的变更，要在同一个变更中更新其英文版和韩文版。
- 每个 pull request 都要通过仓库的检查并带有 DCO 签署；详情见[社区](community.html#参与贡献)。

决策背后的理由记录在做出决策的地方：issue、讨论或 pull request 中。

## 版本发布

在 1.0 之前，次版本号是破坏性变更的位置：0.2.0 可能破坏为 0.1 编写的代码，而 0.1.x 版本增加功能和修复，但不会破坏它。一个版本在其工作完成时发布；[路线图](roadmap.html)给出顺序，每个版本的说明见[版本发布](releases/index.html)。只有最新的系列会得到修复。

## 包

官方包由 [nabi-lang](https://github.com/nabi-lang) 组织发布，并像工具链一样维护。[packages.nabi-lang.org](https://packages.nabi-lang.org) 上的其他包归各自的所有者；注册表的[使用政策](https://packages.nabi-lang.org/policy)说明它接受什么，以及包如何被下架。
