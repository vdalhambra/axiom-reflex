#!/bin/bash
# PreToolUse hook for mcp__claude_ai_Gmail__create_draft
# Blocks create_draft if no search_threads call happened in recent turns for that recipient
# Input: JSON on stdin with {tool_name, tool_input, session_id, transcript_path}
# Output: exit 0 = allow, exit 2 + stdout JSON = block

set -e

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Only enforce for create_draft
if [ "$TOOL_NAME" != "mcp__claude_ai_Gmail__create_draft" ]; then
  exit 0
fi

TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')
TO_LIST=$(echo "$INPUT" | jq -r '.tool_input.to // [] | join(",")')

# If no recipient or no transcript → can't verify, allow (edge case)
if [ -z "$TO_LIST" ] || [ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ]; then
  exit 0
fi

# Check last 100 events in transcript for search_threads touching any recipient
PRIMARY_EMAIL=$(echo "$TO_LIST" | cut -d',' -f1 | tr -d ' "')
LAST_EVENTS=$(tail -c 200000 "$TRANSCRIPT" 2>/dev/null || echo "")

if echo "$LAST_EVENTS" | grep -q "search_threads"; then
  # Check if search_threads mentioned this recipient
  if echo "$LAST_EVENTS" | grep -qi "$PRIMARY_EMAIL"; then
    # Log successful pre-flight
    LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
    mkdir -p "$LOGDIR"
    echo "$(date -Iseconds) | gmail-dedup-preflight PASSED for $PRIMARY_EMAIL" >> "$LOGDIR/hooks.jsonl"
    exit 0
  fi
fi

# No search_threads for this recipient → BLOCK
LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
mkdir -p "$LOGDIR"
echo "$(date -Iseconds) | gmail-dedup-preflight BLOCKED for $PRIMARY_EMAIL (no search_threads found)" >> "$LOGDIR/hooks.jsonl"

cat <<EOF
{"decision":"block","reason":"Gmail dedup pre-flight missed. Before create_draft to '$PRIMARY_EMAIL', run: search_threads(query=\"from:me to:$PRIMARY_EMAIL newer_than:14d\"). See skill gmail-dedup-preflight. Incident 2026-04-23: 5 duplicates blocked by this rule. If thread already exists, use skill gmail-reply-in-thread instead of create_draft."}
EOF
exit 2
