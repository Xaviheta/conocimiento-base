@echo off
REM ============================================
REM INSTALAR AUTOGUARDADO CADA 5 MINUTOS
REM Ejecutar como Administrador
REM ============================================

echo.
echo ========================================
echo   INSTALANDO AUTOGUARDADO CADA 5 MIN
echo ========================================
echo.

REM Obtener la ruta del script actual
set "SCRIPT_PATH=%~dp0autoguardado-todos.bat"

REM Verificar que existe el script
if not exist "%SCRIPT_PATH%" (
    echo ERROR: No se encontro autoguardado-todos.bat
    echo Ruta buscada: %SCRIPT_PATH%
    pause
    exit /b 1
)

echo Script encontrado: %SCRIPT_PATH%
echo.

REM Eliminar tarea anterior si existe
schtasks /delete /tn "AutoguardadoGitHub" /f >nul 2>&1

REM Crear nueva tarea programada cada 5 minutos
schtasks /create /tn "AutoguardadoGitHub" /tr "\"%SCRIPT_PATH%\"" /sc minute /mo 5 /f

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   INSTALACION EXITOSA
    echo ========================================
    echo.
    echo La tarea "AutoguardadoGitHub" se ejecutara cada 5 minutos.
    echo.
    echo Para verificar: Abre Task Scheduler y busca "AutoguardadoGitHub"
    echo Para desinstalar: Ejecuta desinstalar-autoguardado.bat
    echo.
) else (
    echo.
    echo ERROR: No se pudo crear la tarea.
    echo Intenta ejecutar este archivo como Administrador.
    echo.
)

pause
