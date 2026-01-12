@echo off
REM ============================================
REM AUTOGUARDADO - Ejecuta el script PowerShell
REM Usa este .bat en el Task Scheduler
REM ============================================

powershell -ExecutionPolicy Bypass -File "%~dp0autoguardado.ps1"
