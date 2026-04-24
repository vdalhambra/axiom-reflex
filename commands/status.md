---
name: status
description: Dashboard instantáneo del estado del sistema — Rayo, pipeline, replies pendientes, patterns saved, hooks triggered, scheduled tasks status, decay warnings. Usa `/status` cuando quieras un snapshot de cómo va todo.
---

# /status — Axiom system dashboard

Ejecuta los siguientes checks en paralelo y devuelve un resumen limpio estilo dashboard:

## 1. Rayo health

```bash
tail -1 ~/.openclaw/logs/gateway.log 2>/dev/null | head -100
stat -f "%Sm" ~/.openclaw/logs/gateway.log 2>/dev/null
ps aux | grep openclaw | grep -v grep | head -3
```

Interpretar:
- Proceso running? idle min? model configurado?

## 2. Pipeline SmartCall stats

```bash
head -15 ~/shared/pipeline.md
grep -c "^- \*\*Status:\*\* outreach_sent" ~/shared/pipeline.md
grep -c "^- \*\*Status:\*\* replied" ~/shared/pipeline.md
grep -c "^- \*\*Status:\*\* closed_won" ~/shared/pipeline.md
```

Output: leads activos por stage + MRR booked vs €500 floor.

## 3. Replies pendientes Gmail

```
mcp__claude_ai_Gmail__search_threads(
  query="in:inbox newer_than:3d (smartcall OR llamadas perdidas OR axiom OR brokerclaro)",
  pageSize=10
)
```

Listar threads con reply del lead, snippet corto, y flag si no están procesados (no aparece entrada "reply detected" en pipeline.md timeline del lead).

## 4. Axiom perception patterns

```
mcp__axiom-perception__list_patterns
```

Conteo total + top 5 más usados (por success_rate × total_executions).

## 5. Hooks triggered last 24h

```bash
tail -200 ~/.claude/projects/-Users-rayomcqueen/memory/_logs/hooks.jsonl 2>/dev/null | grep "$(date +%Y-%m-%d)" | head -20
```

Conteo por tipo (PASSED gmail-dedup / BLOCKED / WARN playwright / secrets / etc).

## 6. Subagent executions last 7d

```bash
tail -100 ~/.claude/projects/-Users-rayomcqueen/memory/_logs/subagents.jsonl 2>/dev/null | head -20
```

Conteo + latest top 5.

## 7. Scheduled tasks runs

```bash
ls ~/.claude/projects/-Users-rayomcqueen/memory/_logs/ | grep -E "sessionstart|weekly|decay|compact" | tail -10
```

Última ejecución de cada scheduled task si logs disponibles.

## 8. Decay warnings (memorias >60d stale)

```bash
TODAY=$(date +%s)
for f in ~/.claude/projects/-Users-rayomcqueen/memory/identity/*.md ~/.claude/projects/-Users-rayomcqueen/memory/projects/*.md ~/.claude/projects/-Users-rayomcqueen/memory/rules/*.md; do
  LV=$(grep -m1 "last_verified:" "$f" 2>/dev/null | sed 's/last_verified: *//' | tr -d '[:space:]')
  [ -z "$LV" ] && continue
  LV_TS=$(date -j -f "%Y-%m-%d" "$LV" +%s 2>/dev/null || date -d "$LV" +%s 2>/dev/null)
  [ -z "$LV_TS" ] && continue
  DIFF=$(( (TODAY - LV_TS) / 86400 ))
  [ "$DIFF" -gt 60 ] && echo "$DIFF $(basename $f)"
done | sort -rn | head -5
```

Top 5 memorias más stales.

## 9. OpenRouter balance

```bash
curl -s https://openrouter.ai/api/v1/credits -H "Authorization: Bearer $(jq -r .env.OPENROUTER_API_KEY ~/.openclaw/openclaw.json)" | jq .data
```

Balance disponible + usage total.

## Formato de output

Estilo dashboard compacto, emojis solo para ❌/⚠️/✅ status marker, nada más. Markdown tabla si aplica. Todo cabiendo en 1 screen. Si algo crítico mal → al principio en rojo.

```
## 🚀 Axiom System Status — YYYY-MM-DD HH:MM

**Rayo:** ✅ alive (Nm idle, model=X, balance=$Y) | ⚠️ idle Xmin | ❌ DEAD Xh
**Pipeline:** N active / M replied / K closed | MRR €X / €500 floor
**Replies pendientes:** N threads unprocessed
**Patterns:** N total, top: [A, B, C]
**Hooks last 24h:** N blocked, M warn, K secrets
**Subagents 7d:** N completed
**Decay:** N files >60d
```

## Nota

Si user pregunta cuestiones específicas (e.g., "¿replies nuevos?"), foco solo en esa sección, no todo el dashboard.
