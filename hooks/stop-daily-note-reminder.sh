#!/bin/bash
# Stop hook — if session was >1h, remind to write daily note (no block)
# The Stop hook fires when Claude finishes a response

set -e

INPUT=$(cat)
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // empty')

LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
mkdir -p "$LOGDIR"

# Track session start time (first call creates file)
SESSION_FILE="$LOGDIR/session_${SESSION_ID}.start"
if [ ! -f "$SESSION_FILE" ]; then
  date +%s > "$SESSION_FILE"
  exit 0
fi

START=$(cat "$SESSION_FILE")
NOW=$(date +%s)
DURATION_MIN=$(( (NOW - START) / 60 ))

# Only remind if >60 min and daily note for today doesn't exist
if [ "$DURATION_MIN" -ge 60 ]; then
  TODAY=$(date +%Y-%m-%d)
  DAILY="$HOME/.claude/projects/-Users-rayomcqueen/memory/daily/${TODAY}.md"
  if [ ! -f "$DAILY" ]; then
    cat >&2 <<EOF
📝 Sesión ${DURATION_MIN}min. Escribe daily note en:
  memory/daily/${TODAY}.md
  Qué se hizo, bloqueos, pendientes. 5-15 líneas.
EOF
  fi
fi
exit 0
