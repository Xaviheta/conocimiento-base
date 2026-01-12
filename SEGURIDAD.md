# Guia de Seguridad - Proyectos Xavi

## Reglas de Oro

### 1. NUNCA subir credenciales a GitHub
- Contraseñas
- API keys
- Tokens
- Archivos .env
- Certificados (.pem, .key, .crt)

### 2. Repositorios PRIVADOS
Todos los repos deben ser privados:
- GitHub → Settings → Danger Zone → Change visibility → Private

### 3. Variables de entorno
Guardar secretos en archivos `.env` (ignorados por git):
```
# .env (NUNCA se sube)
DATABASE_PASSWORD=mi_contraseña_secreta
API_KEY=xxxx-xxxx-xxxx
JWT_SECRET=mi_secreto_muy_largo
```

---

## Checklist de Seguridad

### Antes de hacer push:
- [ ] No hay contraseñas en el codigo
- [ ] No hay API keys hardcodeadas
- [ ] Los archivos .env estan en .gitignore
- [ ] El repo es privado

### Al crear nuevo proyecto:
- [ ] Copiar .gitignore de la plantilla
- [ ] Crear .env.example (sin valores reales)
- [ ] Verificar visibilidad del repo

---

## Archivos que NUNCA deben subirse

| Archivo | Contiene |
|---------|----------|
| `.env` | Variables de entorno |
| `credentials.json` | Credenciales de servicios |
| `*.pem`, `*.key` | Certificados SSL |
| `firebase-*.json` | Config de Firebase |
| `service-account.json` | Credenciales de Google Cloud |

---

## Si accidentalmente subiste un secreto:

1. **Cambiar la contraseña/key inmediatamente**
2. Eliminar del historial de git:
   ```bash
   git filter-branch --force --index-filter \
   "git rm --cached --ignore-unmatch ARCHIVO_SECRETO" \
   --prune-empty --tag-name-filter cat -- --all
   ```
3. Forzar push: `git push --force`
4. Regenerar todas las credenciales afectadas

---

## Buenas Practicas

### Contraseñas
- Minimo 12 caracteres
- Usar gestor de contraseñas (1Password, Bitwarden)
- Diferentes para cada servicio

### GitHub
- Activar 2FA (autenticacion en dos pasos)
- Usar SSH keys en vez de HTTPS con password
- Revisar los "Settings" de cada repo

### Codigo
- No hardcodear secretos, usar variables de entorno
- Validar inputs del usuario
- Escapar datos antes de mostrar (prevenir XSS)
- Usar HTTPS siempre

---

## Contacto de Emergencia

Si detectas una brecha de seguridad:
1. Cambia todas las credenciales afectadas
2. Revisa logs de acceso
3. Notifica a los usuarios afectados

---

*Ultima actualizacion: 12 Enero 2026*
