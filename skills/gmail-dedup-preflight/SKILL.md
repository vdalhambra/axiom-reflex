---
name: gmail-dedup-preflight
description: Mandatory pre-flight dedup check before ANY Gmail create_draft or compose. Verifies no recent thread to same recipient exists. Run this BEFORE drafting cold emails, outreach batches, or follow-ups. Triggered by any intent to "draft", "send email", "outreach", "cold email", "follow up on email".
when_to_use: Before ANY create_draft, Gmail compose, or outbound email operation
allowed-tools: mcp__claude_ai_Gmail__search_threads mcp__claude_ai_Gmail__get_thread
---

# Gmail dedup pre-flight check (HARD RULE)

**Contexto:** 2026-04-23 incident — 5 cold emails duplicados a Centro INUA, Gonber, Nedumar, Tecnopatent, Fisio Pozuelo porque pipeline.md status=new cuando Gmail sent ya tenía threads. **Regla zero-tolerance.**

## Secuencia mandatoria (cada vez, sin excepción)

Antes de crear cualquier draft/compose email:

### Paso 1 — Outbound check (¿ya le escribí?)

```
mcp__claude_ai_Gmail__search_threads(
  query="from:me to:<email_exacto> newer_than:14d",
  pageSize=20
)
```

### Paso 2 — Inbound check (¿me respondió?)

```
mcp__claude_ai_Gmail__search_threads(
  query="to:me from:<email_exacto> newer_than:14d",
  pageSize=10
)
```

### Paso 3 — Drafts pendientes

```
mcp__claude_ai_Gmail__search_threads(
  query="in:drafts <empresa_o_nombre>",
  pageSize=10
)
```

## Decision tree según resultados

| Resultado | Acción |
|---|---|
| Envío reciente <3 días | **SKIP absoluto** — duplicado confirmado |
| Envío 3-14 días sin reply | **Follow-up reply-in-thread** (skill `gmail-reply-in-thread`, pattern 15ddab31). NO crear thread nuevo. Si ya son ≥3 touchpoints sin reply → `status=stale`. |
| Hay reply del destinatario | **Handle reply flow.** Nunca outreach inicial. Actualizar pipeline `status=replied_need_review`. |
| Hay draft previo | Continuar/actualizar existente. NO crear draft 2. |
| Nada encontrado | Proceder con `create_draft`. |

## Captura post-envío (también mandatoria)

Inmediatamente tras send:

```
mcp__claude_ai_Gmail__search_threads(
  query="from:me to:<email> newer_than:1h",
  pageSize=3
)
```

Top thread = el recién enviado. Escribir `gmail_thread_id: <id>` en pipeline.md / CRM **ANTES** del siguiente lead. No "después, cuando termine el batch".

## Qué NO es fuente de verdad

- **pipeline.md NO es fuente de verdad** para outbound status. Puede estar desincronizado (thread_ids vacíos = estado ambiguo, no "no enviado").
- **Memoria sesión anterior NO es fuente de verdad** tras compact/resume. Asumir estado sucio.
- **Solo Gmail sent (search_threads) es fuente canónica.**

## Pattern axiom-perception

Pattern ID `a9248c71` guarda procedimiento completo. Llamar `recall_pattern(task="cold email pre-flight", app="gmail")` si esta skill no se dispara automáticamente.

## Incidents históricos

- 2026-04-19: 5 drafts duplicados.
- 2026-04-23: 5 cold emails duplicados. Ver `~/shared/incidents/2026-04-23-duplicate-emails.md`.

**Si incumples esta skill una vez más = fallo de proceso grave, no olvido. Cero tolerancia.**
