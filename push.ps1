#Requires -Version 5.0
$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding          = [System.Text.Encoding]::UTF8
$Host.UI.RawUI.WindowTitle = "Bai-DesignSystem 一键推送"

Set-Location -LiteralPath $PSScriptRoot

$g = "git"

function Write-Step($num, $total, $text) {
    Write-Host ""
    Write-Host "[$num/$total] $text" -ForegroundColor Yellow
}
function Write-OK   ($text) { Write-Host "  [OK]   $text" -ForegroundColor Green }
function Write-Info ($text) { Write-Host "  [INFO] $text" -ForegroundColor Gray  }
function Write-Err  ($text) { Write-Host "  [FAIL] $text" -ForegroundColor Red   }

function Pause-AndExit($code) {
    Write-Host ""
    Write-Host "------------------------------------" -ForegroundColor DarkGray
    Read-Host "按回车关闭"
    exit $code
}

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "   Bai-DesignSystem  一键推送"         -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  目录: $PSScriptRoot" -ForegroundColor DarkGray

if (-not (Test-Path ".git")) {
    Write-Err "当前目录不是 git 仓库,无法推送."
    Pause-AndExit 1
}

$branch = (& $g rev-parse --abbrev-ref HEAD 2>$null)
if (-not $branch) { $branch = "main" } else { $branch = $branch.Trim() }

Write-Step 1 4 "检查改动"
$status = (& $g status --porcelain) 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Err "状态检查失败:$status"
    Pause-AndExit 1
}
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Info "没有改动需要提交,直接尝试同步远端..."
    & $g push -u origin $branch 2>&1 | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkGray }
    Pause-AndExit 0
}
$status -split "`n" | ForEach-Object {
    if ($_.Trim()) { Write-Host "  $_" -ForegroundColor Gray }
}

Write-Step 2 4 "输入本次更新说明 (直接回车=使用时间戳)"
$msg = Read-Host "  >"
if ([string]::IsNullOrWhiteSpace($msg)) {
    $msg = "update at $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    Write-Info "使用默认说明: $msg"
}

Write-Step 3 4 "本地提交"
& $g add -A
if ($LASTEXITCODE -ne 0) { Write-Err "暂存失败"; Pause-AndExit 1 }
& $g commit -m $msg
if ($LASTEXITCODE -ne 0) { Write-Err "本地提交失败"; Pause-AndExit 1 }
Write-OK "本地提交完成"

Write-Step 4 4 "推送到 GitHub"
& $g push -u origin $branch 2>&1 | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkGray }
if ($LASTEXITCODE -ne 0) {
    Write-Err "推送失败,请检查网络/代理是否在运行 (127.0.0.1:7897)."
    Pause-AndExit 1
}
Write-OK "已推送到 origin/$branch"

$remote  = (& $g remote get-url origin).Trim()
$repoUrl = $remote -replace '\.git$',''
$rawBase = $repoUrl -replace '^https://github\.com/', 'https://raw.githubusercontent.com/'

Write-Host ""
Write-Host "====================================" -ForegroundColor Green
Write-Host "   推送完成 (commit: $msg)"             -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Green
Write-Host "  仓库主页 : $repoUrl" -ForegroundColor Cyan

$mdFiles = & $g ls-tree -r --name-only HEAD 2>$null | Where-Object { $_ -match '\.md$' }
if ($mdFiles) {
    Write-Host "  Raw URL  :" -ForegroundColor Cyan
    foreach ($f in $mdFiles) {
        $encoded = ($f -split '/') | ForEach-Object { [System.Uri]::EscapeDataString($_) }
        $encodedPath = $encoded -join '/'
        Write-Host "    $rawBase/$branch/$encodedPath" -ForegroundColor Cyan
    }
}

Pause-AndExit 0
