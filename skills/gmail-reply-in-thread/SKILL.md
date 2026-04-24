---
name: gmail-reply-in-thread
description: Reply to existing Gmail thread without creating new thread. For follow-ups D+3/D+7/D+14 and handling replies to outreach. Preserves thread continuity critical for recipient UX and pipeline tracking.
when_to_use: When sending follow-up to previously-sent cold email, or replying to a received email in an existing thread
allowed-tools: mcp__claude_ai_Gmail__get_thread mcp__playwright__browser_navigate mcp__playwright__browser_click mcp__playwright__browser_type mcp__playwright__browser_evaluate
---

# Gmail reply-in-thread (NO crear thread nuevo)

**Regla:** follow-ups de outreach (D+3, D+7, D+14) y replies a entrantes SIEMPRE van dentro del thread existente. Nunca crear thread nuevo con mismo subject — Gmail lo agrupa mal y el recipient pierde continuidad.

**Pattern axiom-perception:** `15ddab31` — Gmail reply inside thread.

## Procedimiento (via Playwright Gmail web, Gmail MCP no tiene send)

### Paso 1 — Obtener thread_id

Thread_id viene de:
- pipeline.md `gmail_thread_id` field (canónico, no el duplicate)
- O buscar live: `mcp__claude_ai_Gmail__search_threads(query="from:me to:<email> newer_than:14d")` → top thread

### Paso 2 — Navegar a thread

URL format: `https://mail.google.com/mail/u/0/#inbox/<thread_id>` o `#sent/<thread_id>` o `#all/<thread_id>`

```
mcp__playwright__browser_navigate url="https://mail.google.com/mail/u/0/#sent/<thread_id>"
```

Verificar cargado: `document.querySelector('h2.hP')?.textContent` (subject) coincide con el thread.

### Paso 3 — Click Reply

```js
const replyBtn = document.querySelector('[aria-label*="Reply"][role="button"]');
// O si es reply-all: [aria-label*="Reply all"]
replyBtn?.click();
```

Aparece composer INLINE en el mismo thread view (no modal compose separado).

### Paso 4 — Escribir body

Composer inline tiene `.Am.Al.editable` como textarea rich. Focus + paste:

```js
const composer = document.querySelector('.Am.Al.editable, [g_editable="true"]');
composer.focus();
await navigator.clipboard.writeText(followupText);
// Ctrl+V / Cmd+V via Playwright keyboard.press("Meta+v")
```

### Paso 5 — Click Send

```js
const sendBtn = document.querySelector('[role="button"][data-tooltip*="Enviar" i], [role="button"][data-tooltip*="Send" i]');
sendBtn?.click();
```

O atajo: `Meta+Enter` (macOS) / `Ctrl+Enter` (Linux).

### Paso 6 — Verificar send

- URL vuelve a inbox o permanece con el thread (dependiendo de config).
- Thread view muestra el mensaje nuevo al final con "Sent X seconds ago".
- Pipeline update: añadir línea al `timeline` del lead con `D+N followup sent | thread_id=<same>`.

## Templates D+N (adapt al lead)

### D+3 (primer follow-up suave)

```
Hola [nombre],

Por si esto se te quedó enterrado — te dejaba abierto lo del agente para llamadas, por si querías 20 min rápido para verlo.

Sin prisa. Si no encaja, cero problema.

Víctor
```

### D+7 (segundo follow-up, más directo)

```
[nombre],

Una cosa concreta del mail anterior: en clínicas como la vuestra, el rango típico de pérdida por llamadas no cogidas es de 3 a 5 pacientes nuevos al mes, que a 400-800€/paciente suman €1,200-4,000/mes.

Si te interesa que te enseñe números reales de clínicas parecidas, 20 min.

Víctor
```

### D+14 (último touch, breakup mail)

```
Hola [nombre],

No insistiré más. Si algún mes querés mirar agentes de voz para la clínica, por aquí estoy.

Víctor
```

Post D+14 sin respuesta → status `stale` en pipeline.

## Reglas críticas

1. **NUNCA crear nuevo thread** con mismo subject — Gmail groupa mal y el lead ve 2 emails separados.
2. **NUNCA usar thread_id_duplicate** (marcado explícitamente en pipeline como "ignorar") para follow-ups.
3. **Thread_id inmediatamente capturado** tras send (`search_threads newer_than:1h`) no debería cambiar porque es el mismo thread — verificar.
4. **Max 3 follow-ups** total (D+3, D+7, D+14). Post-D+14 = stale, NO más touches automáticos.

## Troubleshooting

- **Reply button no aparece:** thread puede ser archivado. `#all/<thread_id>` en vez de `#inbox`.
- **Composer inline no abre:** Gmail puede mostrar modal compose por settings. Forzar inline con `aria-label` específico.
- **Send button disabled:** subject o body vacío. Verificar que Reply pre-populó subject con "Re: ...".
