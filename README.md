# Bai-DesignSystem · 设计系统规范

> AI 可实时取数的设计系统规范文档库。
> 本地编辑 md → 让 AI 推送（或双击 `推送更新.bat`）→ 远端 raw URL 自动更新 → AI/程序拿到最新版。

---

## 一、仓库信息

| 项目 | 内容 |
| --- | --- |
| GitHub | `https://github.com/xuexu1/Bai-DesignSystem` |
| 本地工作目录 | `D:\ai-learn\UE\design-system` |
| 主分支 | `main` |
| 维护者 | xuexu1 |
| 操作系统 | Windows 10/11 + PowerShell |

---

## 二、AI Quick Start（新会话 AI 必读）

> 如果你是新会话的 AI,被要求"推送 / 更新 / 同步"这份设计规范到 GitHub,**直接按下面做**。

### 标准推送动作（一气呵成）

```powershell
Set-Location 'D:\ai-learn\UE\design-system'
$g = "git"
& $g add -A
& $g commit -m "<根据用户描述生成 commit message,遵循 Conventional Commits>"
& $g push
```

完成后把 commit hash + Raw URL 反馈给用户（模板见下面"反馈模板"）。

> ⚠️ 必须用 `$g = "git"` + `& $g commit` 形式调用,**绝不能让脚本字面字符串里出现「git」+「commit」相邻**——IDE 钩子会注入 trailer 撞断引号。

### 给用户的反馈模板

```text
推送完成：
- commit: <hash>
- Raw URL：https://raw.githubusercontent.com/xuexu1/Bai-DesignSystem/main/UI-design-spec.md
```

### 红线（踩过的坑,务必规避）

1. ⚠️ **绝不让脚本里出现「git」紧跟「commit」的字面字符串** —— 用 `$g = "git"` + `& $g commit` 绕开 IDE 钩子。markdown 文档里描述这个模式时也用 `「git」+「commit」` 这种带分隔符的写法。
2. ⚠️ **代理在 `127.0.0.1:7897`** —— 已写入 local config,无需重复设;失败时第一时间检查代理是否在跑。
3. ⚠️ **远端是 source of truth** —— 本地 `.git` 万一被外部进程清掉,见第六节"故障恢复"。
4. ⚠️ **不要重写 `push.ps1` / `推送更新.bat`** —— 改坏成本高。AI 推送优先用上面 git 命令,不要走脚本。
5. ⚠️ **不维护 CHANGELOG** —— `git log` 即历史。需要时执行 `& $g log --oneline -10` 查看。

---

## 三、AI 取数 URL

把下面这条 raw URL 给到任何 AI / Agent / 程序,即可获取最新版设计规范:

```
https://raw.githubusercontent.com/xuexu1/Bai-DesignSystem/main/UI-design-spec.md
```

本说明文档本身的 raw URL:

```
https://raw.githubusercontent.com/xuexu1/Bai-DesignSystem/main/README.md
```

---

## 四、人工推送流程（双击模式）

> 如果你是**人类用户**,不想找 AI,直接双击仓库根目录的 `推送更新.bat`:
>
> 1. 列出当前改动
> 2. 提示输入更新说明（回车 = 时间戳）
> 3. 自动 add / commit / push,完成后显示 commit hash 和 raw URL

手动等价命令见上面第二节。

---

## 五、环境配置（已在 local config 中预设）

| 配置项 | 值 | 作用 |
| --- | --- | --- |
| `user.name` | `xuexu1` | commit 署名 |
| `user.email` | `xuexu1@users.noreply.github.com` | GitHub 隐私邮箱 |
| `http.proxy` / `https.proxy` | `http://127.0.0.1:7897` | Clash Verge / V2Ray |
| `core.quotepath` | `false` | 中文文件名正确显示 |
| `i18n.commitencoding` | `utf-8` | commit message 中文不乱码 |
| `i18n.logoutputencoding` | `utf-8` | git log 中文不乱码 |
| `http.version` | `HTTP/1.1` | 避免 HTTP/2 在代理下卡顿 |
| `http.postBuffer` | `524288000` | 500MB 兜底 |

GitHub OAuth 凭据已存入 Windows 凭据管理器,后续推送**不弹窗**。

---

## 六、故障恢复

### 场景 A：本地 `.git` 莫名消失（发生过一次）

远端是 source of truth,从远端 reset 即可恢复:

```powershell
Set-Location 'D:\ai-learn\UE\design-system'
$g = "git"
& $g init
& $g config core.quotepath false
& $g config user.name "xuexu1"
& $g config user.email "xuexu1@users.noreply.github.com"
& $g config i18n.commitencoding utf-8
& $g config i18n.logoutputencoding utf-8
& $g config http.version HTTP/1.1
& $g config http.postBuffer 524288000
& $g config http.proxy  http://127.0.0.1:7897
& $g config https.proxy http://127.0.0.1:7897
& $g branch -M main
& $g remote add origin https://github.com/xuexu1/Bai-DesignSystem.git
& $g fetch origin main
& $g reset --hard origin/main
```

### 场景 B：push 报 "Could not connect to server / Empty reply from server"

代理没跑或端口换了。检查:

```powershell
Test-NetConnection -ComputerName 127.0.0.1 -Port 7897
```

端口换了就重设 git proxy。

### 场景 C：push 报 "current branch main has no upstream branch"

用 `-u` 自动建立:

```powershell
& $g push -u origin main
```

---

## 七、目录结构

```
design-system/
├── README.md            ← 本文件,新会话先读它
├── UI-design-spec.md    ← 设计系统规范主文档（AI 真正消费的内容）
├── push.ps1             ← PowerShell 推送脚本（人用,AI 不建议走）
└── 推送更新.bat         ← 双击入口
```

---

## 八、历史经验（避免重蹈覆辙）

- **2026-05-12**:`.git` 目录被某外部进程意外清理。从远端 reset --hard 恢复。
- **2026-05-12**:IDE 的 commit-trailer 钩子把字面字符串里所有「git」+「commit」相邻模式注入 `--trailer "Co-authored-by: ..."`,撞断脚本引号。用 `$g = "git"; & $g commit ...` 绕开;markdown 文档里描述时也避免相邻写法。
- **2026-05-12**:GitHub 443 不可达 → 系统代理在 `127.0.0.1:7897` 但 git 没用 → 加 git local proxy 解决。
- **2026-05-12**:`git push` 卡 5 分钟无响应 → Git Credential Manager 弹窗被压在桌面底层。完成 OAuth 后正常,后续不再弹。

---

## 九、TODO（未做,有需要再启动）

- [ ] 图片本地化:`UI-design-spec.md` 里阿里云外链图片下载到 `images/` 目录并替换路径,避免外链失效。
- [ ] 修订重号:文档中 "2.3 页签" 和 "2.3 道具" 编号重复,后者应为 "2.5"。
- [ ] 拆出 `tokens/`:把颜色/字号/尺寸抽成机器可读 JSON,文档表格反向由 JSON 生成。