@echo off
REM ============================================
REM AUTOGUARDADO TODOS - Ejecuta el script PowerShell
REM Guarda los 3 repos: conocimiento-base, manantial-platform, _plantilla-proyecto
REM ============================================

powershell -ExecutionPolicy Bypass -File "%~dp0autoguardado-todos.ps1"
