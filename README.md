# my-codex-skills

一个独立、可审计的通用 Codex Skills 集合。每个 Skill 位于 `skills/<name>/`，保留其上游目录结构；安装脚本只创建指向本仓库的链接，不覆盖已有 Skill。

## 包含的 Skills

| Skill | 来源 | 用途 | 依赖 | 可执行脚本 | 最近同步版本 |
| --- | --- | --- | --- | --- | --- |
| `life-decision-guide` | [eternity4719/HowToLiveBetter](https://github.com/eternity4719/HowToLiveBetter) | 按《高性价比人生指南》检索并比较具体人生决策 | 网络访问；工作区没有正文时按需读取上游仓库 | 否 | `main` 快照（2026-10-07） |
| `find-skills` | CodeBuddy Official plugin `find-skills` | 从 SkillHub、Vercel Skills 和 ClawHub 发现可安装能力 | 网络访问；按需使用对应注册表 | 否 | `1.0.0`（本机快照，2026-09-28） |
| `frontend-design` | CodeBuddy Teams `general-skills` | 创建有明确视觉方向的生产级前端界面 | 由宿主 Agent 执行；无固定运行时 | 否 | `1.0.0`（本机快照，2026-09-28） |
| `agent-browser` | CodeBuddy Official plugin；上游 [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) | 浏览器自动化、截图、表单填写和页面提取 | Node.js 18+、npm、网络；首次使用可能下载 Chromium | 是：`scripts/setup.sh`、`templates/` | `1.3.0`（本机快照，2026-09-28） |
| `tdd` | [mattpocock/skills](https://github.com/mattpocock/skills) | 以红绿重构循环驱动测试优先开发 | 项目自身的测试命令 | 否 | commit `c55ee46`（2026-09-18） |
| `improve-codebase-architecture` | [mattpocock/skills](https://github.com/mattpocock/skills) | 从模块深度、接口、局部性和可测试性审视架构 | 读取代码库与项目文档 | 否 | commit `c55ee46`（2026-09-18） |
| `grill-me` | [mattpocock/skills](https://github.com/mattpocock/skills) | 逐题追问并澄清计划、设计和决策 | 持久化会话文件所需的工作区写权限 | 否 | commit `c55ee46`（2026-09-18） |
| `grill-with-docs` | [mattpocock/skills](https://github.com/mattpocock/skills) | 在追问计划的同时沉淀领域文档和 ADR | 工作区写权限 | 否 | commit `c55ee46`（2026-09-18） |
| `handoff` | [mattpocock/skills](https://github.com/mattpocock/skills) | 生成可供下一 Agent 继续工作的交接摘要 | Git；按交接内容可能需要项目 CLI | 否 | commit `c55ee46`（2026-09-18） |
| `triage` | [mattpocock/skills](https://github.com/mattpocock/skills) | 对外部 Issue 做验证、分类和状态流转 | 已配置的 Issue tracker；GitHub 流程通常需要 `gh` | 否 | commit `c55ee46`（2026-09-18） |
| `setup-matt-pocock-skills` | [mattpocock/skills](https://github.com/mattpocock/skills) | 为工程 Skills 配置 Issue tracker、标签和领域文档位置 | Git remote；按 tracker 选择 CLI | 否 | commit `c55ee46`（2026-09-18） |

> `最近同步版本` 是本仓库收录时的来源版本。Matt Pocock Skills 的版本使用固定 commit，便于复现；本机插件快照使用其插件版本号和同步日期。

## 安装

```bash
./install.sh
```

默认安装到 `~/.agents/skills/`。也可以指定目标目录：

```bash
CODEX_SKILLS_DIR="$HOME/.agents/skills" ./install.sh
```

脚本逐项创建符号链接。目标位置已有同名文件、目录或其他链接时会保留并跳过；再次运行不会覆盖或破坏已有安装。

## Codex Cloud / sandbox

```bash
./cloud-setup.sh
```

目标目录优先使用 `CODEX_CAPABILITY_DIR`，其次使用 `CODEX_SKILLS_DIR`；未设置时，在存在 `/workspace` 的 sandbox 中使用 `/workspace/.agents/skills`，否则回退到 `~/.agents/skills/`。

## 安全与归属

仓库只保存公开 Skill 文本和脚本，不保存 Token、API Key、Cookie、密码或运行时凭据。脚本不会联网，也不会读取凭据文件。

上游许可证和归属信息见 [`licenses/`](licenses/)。本仓库不改变上游 Skill 的内容或目录结构。
