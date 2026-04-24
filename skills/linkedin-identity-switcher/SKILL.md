---
name: linkedin-identity-switcher
description: Switch identity to Axiom Company Page when commenting on LinkedIn. Required for EVERY comment on posts so they appear as "Axiom" not "Víctor personal". Use this before any LinkedIn comment submit action.
when_to_use: Before submitting any LinkedIn comment via Playwright. Axiom posts only have value if commented-as-Axiom.
allowed-tools: mcp__playwright__browser_click mcp__playwright__browser_evaluate mcp__playwright__browser_snapshot
---

# LinkedIn identity switcher — comentar como Axiom, no como Víctor

**Contexto:** Axiom LinkedIn Company Page 112885029. Cada comment debe aparecer como "Axiom ⚡ Agente IA", no como Víctor personal. LinkedIn permite el switch vía modal de identidad dentro del comment composer.

## Pattern axiom-perception

Pattern ID para recall: buscar `pattern_id` con task "LinkedIn comment identity switcher".

## Procedimiento exacto

### Paso 1 — Abrir comment composer

Click en "Comment" / "Comentar" del post target:

```js
const commentBtn = Array.from(document.querySelectorAll('button')).find(b =>
  ['Comment', 'Comentar'].includes((b.textContent || '').trim())
);
commentBtn?.click();
```

### Paso 2 — Abrir identity switcher

El composer muestra placeholder "Add a comment…" o "Comment as Víctor…". Click en el avatar/nombre arriba del composer para abrir modal de identidad:

```js
// The identity selector is usually a button with the user's name or avatar
const identityBtn = document.querySelector('[aria-label*="Post as" i], [data-control-name="identity_switcher"]');
identityBtn?.click();
```

### Paso 3 — Seleccionar Axiom Company Page

Modal muestra "Post as:" con lista de identities. Click en "Axiom":

```js
const axiomOption = Array.from(document.querySelectorAll('[role="menuitem"], button, li')).find(e =>
  (e.textContent || '').trim().startsWith('Axiom')
);
axiomOption?.click();
```

### Paso 4 — Verificar switch exitoso

Placeholder del composer debe ahora ser "Comment as Axiom…":

```js
const placeholder = document.querySelector('.comments-comment-box__form [placeholder]')?.getAttribute('placeholder');
// Expected: "Comment as Axiom…" or similar
```

**Si placeholder sigue "Comment as Víctor" → NO continuar, revisar paso 2-3.**

### Paso 5 — Escribir y enviar comment

Usar pattern estándar clipboard paste:

```js
await navigator.clipboard.writeText(commentText);
document.querySelector('.comments-comment-box__form [contenteditable]').focus();
// Paste con Ctrl+V / Cmd+V via Playwright keyboard.press
```

Click submit ("Post" / "Publicar").

### Paso 6 — Verificación post-submit

El comment debe aparecer en el hilo con avatar y nombre "Axiom ⚡ Agente IA". Si aparece con perfil personal Víctor → INCIDENTE, dejar nota, no repetir.

## Reglas asociadas

- **Nunca** comentar en perfil personal Víctor en LinkedIn corporate posts (ver `rules/feedback_linkedin_replies_only_inside_axiom.md`).
- **Posts originales** siempre en Company Page (ver `rules/feedback_linkedin_approval.md`).
- **Comments en posts Axiom** pueden ir como Axiom directo sin switch (ya es default en esos posts).
- **Comments en posts externos** requieren switch obligatorio.

## Troubleshooting

- **No aparece opción Axiom en modal:** verificar que usuario Víctor es admin de Axiom Company Page 112885029. Ir a https://www.linkedin.com/company/112885029/admin/dashboard/ para confirmar.
- **Modal no abre:** sesión LinkedIn puede haber expirado. Re-login.
- **Placeholder no cambia tras switch:** refresh composer click "Cancel" + reabrir.
