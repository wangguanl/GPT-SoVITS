@echo off
chcp 65001 >nul
title GPT-SoVITS WebUI
cd /d "%~dp0"
set "PYTHON=C:\Users\wang\miniconda3\envs\GPTSoVits\python.exe"

if not exist "%PYTHON%" (
    echo [ERROR] 未找到 Python：%PYTHON%
    echo 请检查 GPTSoVITS conda 环境是否存在。
    pause
    exit /b 1
)

echo 正在启动 GPT-SoVITS WebUI (端口 47811)...
"%PYTHON%" -I webui.py zh_CN

echo.
echo 服务已停止。
pause