# ============================================
# VERIFICADOR DE REQUISITOS - PLANTILLA
# ============================================

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  VERIFICADOR DE REQUISITOS" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$faltantes = @()
$instalados = @()

function Test-Comando {
    param([string]$comando, [string]$nombre, [string]$urlDescarga)

    try {
        $null = Get-Command $comando -ErrorAction Stop
        $version = & $comando --version 2>&1 | Select-Object -First 1
        Write-Host "  [OK] $nombre - $version" -ForegroundColor Green
        $script:instalados += $nombre
        return $true
    }
    catch {
        Write-Host "  [X] $nombre - NO INSTALADO" -ForegroundColor Red
        Write-Host "      Descarga: $urlDescarga" -ForegroundColor Yellow
        $script:faltantes += @{Nombre=$nombre; URL=$urlDescarga}
        return $false
    }
}

Write-Host "Verificando requisitos..." -ForegroundColor White
Write-Host ""

# Requisitos basicos
Test-Comando "git" "Git" "https://git-scm.com/download/win"
Test-Comando "node" "Node.js" "https://nodejs.org/es/download/"
Test-Comando "npm" "npm" "https://nodejs.org/es/download/"

# Opcionales
$vscode = Get-Command "code" -ErrorAction SilentlyContinue
if ($vscode) {
    Write-Host "  [OK] Visual Studio Code - instalado" -ForegroundColor Green
} else {
    Write-Host "  [?] Visual Studio Code - no detectado (opcional)" -ForegroundColor Yellow
    Write-Host "      Descarga: https://code.visualstudio.com/download" -ForegroundColor Yellow
}

$ghDesktop = Test-Path "$env:LOCALAPPDATA\GitHubDesktop\GitHubDesktop.exe"
if ($ghDesktop) {
    Write-Host "  [OK] GitHub Desktop - instalado" -ForegroundColor Green
} else {
    Write-Host "  [?] GitHub Desktop - no detectado (opcional)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan

if ($faltantes.Count -eq 0) {
    Write-Host ""
    Write-Host "  TODO LISTO! Puedes continuar trabajando." -ForegroundColor Green
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "  ATENCION: Te faltan $($faltantes.Count) requisitos:" -ForegroundColor Red
    foreach ($item in $faltantes) {
        Write-Host "  - $($item.Nombre): $($item.URL)" -ForegroundColor Yellow
    }
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
