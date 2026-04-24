#!/bin/bash
# PreCompact hook — dump current state to file before context window compaction
# Preserves thread_ids captured, pipeline updates in flight, active tasks

set -e

LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
mkdir -p "$LOGDIR"

TS=$(date +%Y%m%d-%H%M%S)
DUMP="$LOGDIR/compact_${TS}.md"

{
  echo "# Pre-compact state dump — $(date -Iseconds)"
  echo ""
  echo "## Rayo status"
  tail -3 "$HOME/.openclaw/logs/gateway.log" 2>/dev/null || echo "(no gateway log)"
  echo ""
  echo "## Pipeline stats"
  if [ -f "$HOME/shared/pipeline.md" ]; then
    head -20 "$HOME/shared/pipeline.md"
  fi
  echo ""
  echo "## Most recent Gmail threads outreach"
  echo "(Run in new session: mcp__claude_ai_Gmail__search_threads newer_than:2d from:me 'llamadas perdidas OR 20 min para')"
  echo ""
  echo "## Git status workspace"
  cd "$HOME/projects/mcp-servers" 2>/dev/null && git status --short 2>/dev/null | head -20
  echo ""
  echo "## Inbox Rayo (recent)"
  tail -30 "$HOME/shared/inbox-rayo.md" 2>/dev/null
} > "$DUMP"

LOGFILE="$LOGDIR/hooks.jsonl"
echo "$(date -Iseconds) | precompact state dumped to $DUMP" >> "$LOGFILE"

exit 0
