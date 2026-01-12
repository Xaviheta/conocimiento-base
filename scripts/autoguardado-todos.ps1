# ============================================
# AUTOGUARDADO - Todos los Repos
# ============================================
# Guarda automaticamente los 3 repositorios
# ============================================

$GITHUB_PATH = "C:\Users\Xavi\OneDrive - Manantial de ideas SL\Documentos\GitHub"
$LOG_FILE = "$GITHUB_PATH\conocimiento-base\scripts\autoguardado.log"

$repos = @(
    "conocimiento-base",
    "manantial-platform",
    "_plantilla-proyecto"
)

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] $Message"
    Add-Content -Path $LOG_FILE -Value $logEntry
}

Write-Log "========== INICIO AUTOGUARDADO =========="

foreach ($repo in $repos) {
    $repoPath = "$GITHUB_PATH\$repo"

    if (Test-Path $repoPath) {
        Set-Location $repoPath
        Write-Log "Revisando: $repo"

        $status = git status --porcelain

        if ($status) {
            $fecha = Get-Date -Format "yyyy-MM-dd HH:mm"
            $mensaje = "auto: guardado automatico $fecha"

            git add -A
            git commit -m $mensaje

            $rama = git branch --show-current
            $pushResult = git push origin $rama 2>&1

            if ($LASTEXITCODE -eq 0) {
                Write-Log "$repo - Push exitoso"
            } else {
                Write-Log "$repo - Error en push: $pushResult"
            }
        } else {
            Write-Log "$repo - Sin cambios"
        }
    } else {
        Write-Log "$repo - No encontrado"
    }
}

Write-Log "========== FIN AUTOGUARDADO =========="
