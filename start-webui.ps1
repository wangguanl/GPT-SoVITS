# 一键启动 GPT-SoVITS WebUI
$ErrorActionPreference = "Stop"
try { chcp 65001 | Out-Null } catch {}
Set-Location -Path $PSScriptRoot

$py = "C:\Users\wang\miniconda3\envs\GPTSoVits\python.exe"

if (-not (Test-Path $py)) {
    Write-Host "[ERROR] 未找到 Python：$py" -ForegroundColor Red
    Write-Host "请检查 GPTSoVITS conda 环境是否存在。"
    Read-Host "按回车退出"
    exit 1
}

Write-Host "正在启动 GPT-SoVITS WebUI (端口 47811)..." -ForegroundColor Cyan
& $py -I "$PSScriptRoot\webui.py" zh_CN

Write-Host ""
Write-Host "服务已停止。" -ForegroundColor Yellow
Read-Host "按回车退出"