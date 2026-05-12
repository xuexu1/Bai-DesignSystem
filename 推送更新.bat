@echo off
chcp 65001 > nul
title Bai-DesignSysterm Push
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0push.ps1"
