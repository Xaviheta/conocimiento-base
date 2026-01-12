# Base de Conocimiento - Xavi

## INSTRUCCIONES PARA CLAUDE

Cuando Xavi abra un chat nuevo, dira:
```
lee conocimiento-base
```
Tu (Claude) debes:
1. Leer este archivo para saber quien es y como trabaja
2. Ver la seccion "Estado Actual de Proyectos" para saber donde lo dejamos
3. Continuar desde ahi

---

## Quien Soy
- **Nombre:** Xavi
- **Empresa:** Manantial de ideas SL
- **GitHub:** Xaviheta

---

## Mis Preferencias de Trabajo

### Idioma
- **Codigo:** Ingles
- **Comentarios/UI:** Espanol
- **Documentacion:** Espanol

### Stack Tecnologico Preferido
| Area | Tecnologia |
|------|------------|
| Frontend | React + Tailwind CSS |
| Backend | Node.js + Express |
| Base de datos | Supabase / PostgreSQL |
| Desktop | Electron |
| Iconos | Lucide React |
| Tiempo real | Socket.io |

### Entorno de Desarrollo
- **Editor:** VS Code / GitHub Desktop
- **Control versiones:** Git + GitHub
- **SO principal:** Windows
- **Sincronizacion:** OneDrive (solo en PC principal)

### Cosas Que Me Gustan
- Que Claude explique paso a paso
- Ver capturas de pantalla para guiarme
- Que todo quede guardado automaticamente
- No tener que repetir configuraciones
- Continuar donde lo dejamos sin perder contexto

### Cosas Que NO Me Gustan
- Perder trabajo por no guardar
- Tener que configurar lo mismo en cada ordenador
- Empezar de cero cada sesion

---

## Estado Actual de Proyectos

### manantial-platform
- **Estado:** CONFIGURACION INICIAL COMPLETADA
- **Ultimo trabajo:** 12 Enero 2026
- **Donde lo dejamos:** Configuracion de autoguardado y scripts listos
- **Siguiente paso:** Crear estructura de carpetas (frontend, backend, windows-client)
- **GitHub:** https://github.com/Xaviheta/manantial-platform

### conocimiento-base (este proyecto)
- **Estado:** ACTIVO
- **Proposito:** Memoria compartida con Claude para todos los proyectos

### _plantilla-proyecto
- **Estado:** LISTO
- **Proposito:** Plantilla para crear nuevos proyectos rapidamente
- **GitHub:** Pendiente de subir

---

## Mis Ordenadores

| Ordenador | OneDrive | Como sincronizar |
|-----------|----------|------------------|
| Principal | Manantial de ideas SL | OneDrive + GitHub |
| Otros | Sin esta cuenta | Solo GitHub (clonar repos) |

---

## Configuracion en Nuevo Ordenador

1. Clonar repos desde GitHub:
   ```bash
   git clone https://github.com/Xaviheta/manantial-platform
   git clone https://github.com/Xaviheta/conocimiento-base
   ```

2. Verificar requisitos:
   ```
   scripts\verificar-requisitos.bat
   ```

3. Configurar autoguardado en Task Scheduler (cada 5 min)

4. Abrir Claude y decir: "lee conocimiento-base"

---

## Decisiones Tecnicas Globales

| Fecha | Decision | Aplica a |
|-------|----------|----------|
| 12-01-2026 | Autoguardado cada 5 min | Todos los proyectos |
| 12-01-2026 | Scripts con ruta automatica | Todos los proyectos |
| 12-01-2026 | conocimiento-base como hub central | Todos los proyectos |

---

## Problemas Resueltos

### Git + OneDrive
- **Solucion:** GitHub como principal, OneDrive solo backup en PC principal

### Continuar en otro PC
- **Solucion:** conocimiento-base en GitHub, clonar en cada PC

### No perder contexto entre sesiones
- **Solucion:** Este archivo guarda el estado de todo

---

*Ultima actualizacion: 12 Enero 2026 - 13:55*
