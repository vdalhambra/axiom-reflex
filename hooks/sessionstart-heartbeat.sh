#!/bin/bash
# SessionStart hook — Rayo heartbeat + decay scan + pipeline preview
# Input: JSON on stdin with {session_id, cwd, model}
# Output: text on stdout is added to session context

set -e

LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
mkdir -p "$LOGDIR"

RAYO_LOG="$HOME/.openclaw/logs/gateway.log"
PIPELINE="$HOME/shared/pipeline.md"
MEMDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory"

{
  echo "=== SESSION START CHECK — $(date '+%Y-%m-%d %H:%M') ==="
  echo ""

  # 1. Rayo heartbeat
  if [ -f "$RAYO_LOG" ]; then
    LAST_LINE_TS=$(stat -f "%m" "$RAYO_LOG" 2>/dev/null || stat -c "%Y" "$RAYO_LOG" 2>/dev/null)
    NOW=$(date +%s)
    IDLE=$((NOW - LAST_LINE_TS))
    IDLE_MIN=$((IDLE / 60))

    if [ "$IDLE_MIN" -lt 30 ]; then
      echo "✓ Rayo: OK (${IDLE_MIN}min idle, gateway.log fresh)"
    elif [ "$IDLE_MIN" -lt 180 ]; then
      echo "⚠ Rayo: WARN (${IDLE_MIN}min idle, check crons disparándose)"
    else
      echo "✗ Rayo: DEAD (${IDLE_MIN}min idle >3h). Diagnóstico: tail ~/.openclaw/logs/gateway.err.log"
    fi
  else
    echo "✗ Rayo: NO gateway.log — OpenClaw no iniciado"
  fi

  # 2. Decay scan — memorias >60d
  STALE_COUNT=0
  STALE_LIST=""
  for f in "$MEMDIR/identity"/*.md "$MEMDIR/projects"/*.md "$MEMDIR/rules"/*.md; do
    [ -f "$f" ] || continue
    LV=$(grep -m1 "^last_verified:" "$f" 2>/dev/null | sed 's/last_verified: *//' | tr -d '[:space:]')
    [ -z "$LV" ] && continue
    # Compare dates (macOS `date -j -f "%Y-%m-%d"`, Linux `date -d`)
    if date -j -f "%Y-%m-%d" "$LV" +%s >/dev/null 2>&1; then
      LV_TS=$(date -j -f "%Y-%m-%d" "$LV" +%s)
    else
      LV_TS=$(date -d "$LV" +%s 2>/dev/null || echo 0)
    fi
    [ "$LV_TS" -eq 0 ] && continue
    DIFF_DAYS=$(( (NOW - LV_TS) / 86400 ))
    if [ "$DIFF_DAYS" -gt 60 ]; then
      STALE_COUNT=$((STALE_COUNT + 1))
      STALE_LIST="$STALE_LIST  - $(basename $f) (${DIFF_DAYS}d)\n"
    fi
  done

  if [ "$STALE_COUNT" -gt 0 ]; then
    echo ""
    echo "⚠ Memoria decay: $STALE_COUNT archivos >60d sin verificar:"
    echo -e "$STALE_LIST" | head -10
    echo "  → relee antes de actuar basándote en ellos."
  fi

  # 3. Pipeline stats preview
  if [ -f "$PIPELINE" ]; then
    ACTIVOS=$(grep -c "^- \*\*Status:\*\* outreach_sent" "$PIPELINE" 2>/dev/null || echo 0)
    REPLIED=$(grep -c "^- \*\*Status:\*\* replied" "$PIPELINE" 2>/dev/null || echo 0)
    echo ""
    echo "Pipeline: ${ACTIVOS} outreach_sent, ${REPLIED} replied"
  fi

  echo ""
  echo "Reflejos: (1) Gmail dedup SIEMPRE antes de create_draft · (2) recall_pattern antes de Playwright · (3) ¿Rayo puede esta tarea? · (4) thread_id captura inmediata post-send."
  echo "==="
} | tee -a "$LOGDIR/sessionstart.log"
