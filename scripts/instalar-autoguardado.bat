@echo off
echo ========================================
echo   INSTALADOR DE AUTOGUARDADO
echo   Conocimiento Base - Xavi
echo ========================================
echo.

REM Obtener la ruta del script
set SCRIPT_PATH=%~dp0autoguardado.bat

echo Creando tarea programada...
echo Ruta del script: %SCRIPT_PATH%
echo.

REM Crear tarea que se ejecuta cada 5 minutos
schtasks /create /tn "Autoguardado-ConocimientoBase" /tr "\"%SCRIPT_PATH%\"" /sc minute /mo 5 /f

if %errorlevel%==0 (
    echo.
    echo ========================================
    echo   INSTALACION EXITOSA!
    echo ========================================
    echo.
    echo La tarea "Autoguardado-ConocimientoBase" se ejecutara cada 5 minutos.
    echo.
) else (
    echo.
    echo ========================================
    echo   ERROR EN LA INSTALACION
    echo ========================================
    echo.
    echo Intenta ejecutar este archivo como Administrador:
    echo Click derecho -^> Ejecutar como administrador
    echo.
)

pause
