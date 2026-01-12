# Crea acceso directo en el escritorio
$desktop = [Environment]::GetFolderPath('Desktop')
$WshShell = New-Object -ComObject WScript.Shell
$shortcutPath = Join-Path $desktop "Plantilla Proyecto.lnk"
$Shortcut = $WshShell.CreateShortcut($shortcutPath)
$Shortcut.TargetPath = "C:\Users\Sat\OneDrive - Manantial de ideas SL\Documentos\GitHub\_plantilla-proyecto"
$Shortcut.Save()
Write-Host "Acceso directo creado en: $shortcutPath" -ForegroundColor Green
