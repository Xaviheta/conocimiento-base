@echo off
REM ============================================
REM DESINSTALAR AUTOGUARDADO
REM ============================================

echo.
echo Eliminando tarea programada...
echo.

schtasks /delete /tn "AutoguardadoGitHub" /f

if %errorlevel% equ 0 (
    echo.
    echo Tarea "AutoguardadoGitHub" eliminada correctamente.
    echo.
) else (
    echo.
    echo No se encontro la tarea o hubo un error.
    echo.
)

pause
