# Instalacion de Entorno de Desarrollo

**Ultima actualizacion:** 12 Enero 2026

Este documento describe como configurar un ordenador nuevo para trabajar con todos los proyectos.

---

## Requisitos Previos

Verificar que tienes instalado:
- **Node.js** (v20+)
- **Git**
- **VS Code** (opcional pero recomendado)
- **GitHub Desktop** (opcional)

---

## Paso 1: Instalar CLIs

### Opcion A: Script automatico (recomendado)

Abre PowerShell como administrador y ejecuta:

```powershell
# 1. GitHub CLI
winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements

# 2. Railway CLI
npm install -g @railway/cli

# 3. Scoop (gestor de paquetes)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
irm get.scoop.sh | iex

# 4. Supabase CLI
scoop bucket add supabase https://github.com/supabase/scoop-bucket.git
scoop install supabase
```

### Opcion B: Manual

| Herramienta | Instalacion |
|-------------|-------------|
| GitHub CLI | `winget install GitHub.cli` |
| Railway CLI | `npm install -g @railway/cli` |
| Supabase CLI | Via scoop (ver arriba) |

---

## Paso 2: Login en Servicios

**IMPORTANTE:** Cierra y abre una terminal nueva despues de instalar.

```bash
# GitHub
gh auth login

# Railway
railway login

# Supabase
supabase login
```

---

## Paso 3: Clonar Repositorios

```bash
# Ir a carpeta de proyectos
cd ~/Documents/GitHub

# Clonar proyectos principales
git clone https://github.com/Xaviheta/manantial-platform
git clone https://github.com/Xaviheta/conocimiento-base
```

---

## Paso 4: Verificar Instalacion

Ejecuta estos comandos para verificar que todo esta instalado:

```bash
# Verificar versiones
node --version
git --version
gh --version
railway --version
supabase --version

# Verificar login
gh auth status
railway whoami
supabase projects list
```

---

## Script de Verificacion Rapida

Crea un archivo `verificar-entorno.bat` o ejecuta:

```bash
echo "=== Verificando entorno ===" && \
node --version && \
git --version && \
gh --version && \
railway --version && \
supabase --version && \
echo "=== Todo OK ==="
```

---

## Problemas Comunes

### "gh: command not found"
- Cierra y abre terminal nueva
- O reinicia el ordenador

### "railway: command not found"
- Verifica que npm esta en el PATH
- Ejecuta: `npm config get prefix` y anade esa ruta al PATH

### "supabase: command not found"
- Anade scoop al PATH: `$env:PATH += ";$HOME\scoop\shims"`
- O reinicia el ordenador

---

## Configuracion por Ordenador

| Ordenador | Estado | Notas |
|-----------|--------|-------|
| Principal (Oficina) | ✅ Configurado | OneDrive + GitHub |
| Casa | ⬜ Pendiente | Solo GitHub |
| Portatil | ⬜ Pendiente | Solo GitHub |

---

*Documento creado: 12 Enero 2026*
