@echo off
title Hamza Fashion Embroidery - Local Server
cd /d "%~dp0"

echo ========================================================
echo    Launching Hamza Fashion Embroidery Local Server...
echo ========================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"

pause
