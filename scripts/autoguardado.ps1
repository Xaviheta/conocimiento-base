# ============================================
# SCRIPT DE AUTOGUARDADO - Conocimiento Base
# ============================================
# Detecta automaticamente la ruta del proyecto
# Funciona en cualquier ordenador
# ============================================

# Detectar ruta automaticamente (carpeta padre de scripts/)
$REPO_PATH = Split-Path -Parent $PSScriptRoot
$LOG_FILE = "$PSScriptRoot\autoguardado.log"

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] $Message"
    Add-Content -Path $LOG_FILE -Value $logEntry
    Write-Host $logEntry
}

Set-Location $REPO_PATH

Write-Log "Iniciando autoguardado en: $REPO_PATH"

$status = git status --porcelain

if ($status) {
    $fecha = Get-Date -Format "yyyy-MM-dd HH:mm"
    $mensaje = "auto: guardado automatico $fecha"

    git add -A
    Write-Log "Cambios detectados, agregados al staging"

    git commit -m $mensaje
    Write-Log "Commit realizado: $mensaje"

    # Detectar rama actual automaticamente
    $rama = git branch --show-current
    $pushResult = git push origin $rama 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Log "Push exitoso a GitHub"
    } else {
        Write-Log "Error en push: $pushResult"
    }
} else {
    Write-Log "Sin cambios, nada que guardar"
}

Write-Log "Autoguardado completado"
Write-Log "----------------------------------------"
