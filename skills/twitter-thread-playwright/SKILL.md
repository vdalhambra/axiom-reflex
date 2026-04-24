---
name: twitter-thread-playwright
description: Post multi-tweet threads on X/Twitter via Playwright. Uses keyboard.type with delay, addButton force:true, and dialog modal scoping. Avoids ClipboardEvent pitfalls that cause text loss. Run when posting threads from @axiom_ia or similar.
when_to_use: Before posting any Twitter/X thread via browser automation
allowed-tools: mcp__playwright__browser_navigate mcp__playwright__browser_click mcp__playwright__browser_type mcp__playwright__browser_evaluate mcp__playwright__browser_press_key
---

# Twitter thread publishing via Playwright

**Contexto:** @axiom_ia está live. Browser automation (no API — rate limits X API v2 free tier son muy restrictivos). Pattern exacto validado 2026-04-14.

## Reglas hard aprendidas

1. **NO usar `ClipboardEvent.dispatchEvent()`** — Twitter composer pierde el texto en ~40% de casos.
2. **USAR `keyboard.type()` con `{delay: 2}`** — cada carácter con 2ms entre teclas simula typing humano y NO pierde caracteres.
3. **Scope al `aria-modal="true"`** — el composer está en modal dialog. Queries globales tocan elementos hermanos y rompen.
4. **`addButton` requiere `force:true`** — visible pero no "editable-by-default" según Playwright.
5. **NO reply-by-reply** — crear thread completo con "+" buttons antes de publicar. Reply-by-reply sufre rate limits.

## Procedimiento

### Paso 1 — Abrir compose

```
mcp__playwright__browser_navigate → https://x.com/compose/post
```

Verificar composer abierto:
```js
document.querySelector('[data-testid="tweetTextarea_0"]') !== null
```

### Paso 2 — Escribir tweet 1

```
mcp__playwright__browser_click ref=<textarea_0 ref>  // focus
mcp__playwright__browser_type text="<tweet 1>" slowly=true  // delay entre chars
```

### Paso 3 — Añadir tweet 2 con "+"

```js
// Dentro del modal scope:
const modal = document.querySelector('[aria-modal="true"]');
const addBtn = modal.querySelector('[data-testid="addButton"]');
// Usar Playwright click con force:true
```

```
mcp__playwright__browser_click ref=<addBtn ref>
```

Aparece tweetTextarea_1. Repeat type con delay:2.

### Paso 4 — Continuar hasta N tweets

Por cada tweet extra: click addButton + type.

### Paso 5 — Post thread

```js
const modal = document.querySelector('[aria-modal="true"]');
const postBtn = modal.querySelector('[data-testid="tweetButton"]');
```

Click Post. Esperar confirmación toast. Capturar URL del primer tweet.

## Verificación

- URL cambia a `/home` tras post exitoso.
- Toast "Your post was sent." o similar.
- Si falla: capturar screenshot + dejar nota (NO reintentar inmediatamente, puede ser rate limit).

## Pattern axiom-perception

ID: buscar con `recall_pattern(task="twitter thread", app="twitter")`. Pattern existente guarda las selector exactos validados.

## Troubleshooting

- **"Something went wrong" toast:** rate limit transitorio. Esperar 5-15 min + reintentar. Si persiste >30 min → flag como bloqueo.
- **Caracteres perdidos:** si `slowly=false` (default Playwright), o delay <2ms. Forzar delay 2ms min.
- **AddButton disabled:** tweet 1 vacío o >280 chars. Verificar count.
- **Thread publica como replies sueltas:** composer abierto como reply, no como new. Navigate a `/compose/post` explícito.

## Reglas asociadas

- **Idioma:** X replies en idioma del interlocutor, posts originales @axiom_ia en español (core audience).
- **Tono:** cada tweet contundente standalone (ver axiom.md voice modo 2).
- **Payload:** 40%+ threads deben incluir link accionable (GitHub, MCP, artículo).
- **No cold DMs a no-followers** (bloqueados sin X Premium, ver `feedback_twitter_dm_policy.md`).
