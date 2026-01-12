# ============================================
# AUTOGUARDADO - Todos los Repos
# ============================================
# Guarda automaticamente los 3 repositorios
# Mantiene 1 copia por dia (ultimos 3 dias)
# ============================================

$GITHUB_PATH = "C:\Users\Xavi\OneDrive - Manantial de ideas SL\Documentos\GitHub"
$BACKUP_PATH = "C:\Users\Xavi\OneDrive - Manantial de ideas SL\Documentos\GitHub\_backups"
$LOG_FILE = "$GITHUB_PATH\conocimiento-base\scripts\autoguardado.log"
$MAX_BACKUPS = 3

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

function Create-Backup {
    param([string]$RepoName, [string]$RepoPath)

    $repoBackupPath = "$BACKUP_PATH\$RepoName"

    # Crear carpeta de backups si no existe
    if (!(Test-Path $repoBackupPath)) {
        New-Item -ItemType Directory -Path $repoBackupPath -Force | Out-Null
    }

    # Nombre del backup solo con fecha (1 por dia)
    $fecha = Get-Date -Format "yyyy-MM-dd"
    $backupName = "${RepoName}_$fecha"
    $backupFullPath = "$repoBackupPath\$backupName"

    # Solo crear backup si no existe uno de hoy
    if (!(Test-Path $backupFullPath)) {
        # Copiar repo (excluyendo .git y node_modules)
        Copy-Item -Path $RepoPath -Destination $backupFullPath -Recurse -Exclude @(".git", "node_modules", ".next", "dist", "build")
        Write-Log "$RepoName - Backup diario creado: $backupName"

        # Eliminar backups antiguos (mantener solo ultimos 3 dias)
        $backups = Get-ChildItem -Path $repoBackupPath -Directory | Sort-Object Name -Descending
        if ($backups.Count -gt $MAX_BACKUPS) {
            $toDelete = $backups | Select-Object -Skip $MAX_BACKUPS
            foreach ($old in $toDelete) {
                Remove-Item -Path $old.FullName -Recurse -Force
                Write-Log "$RepoName - Backup antiguo eliminado: $($old.Name)"
            }
        }
    }
}

Write-Log "========== INICIO AUTOGUARDADO =========="

# Crear carpeta principal de backups
if (!(Test-Path $BACKUP_PATH)) {
    New-Item -ItemType Directory -Path $BACKUP_PATH -Force | Out-Null
}

foreach ($repo in $repos) {
    $repoPath = "$GITHUB_PATH\$repo"

    if (Test-Path $repoPath) {
        Set-Location $repoPath
        Write-Log "Revisando: $repo"

        $status = git status --porcelain

        if ($status) {
            # Crear backup diario (solo si no existe de hoy)
            Create-Backup -RepoName $repo -RepoPath $repoPath

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
