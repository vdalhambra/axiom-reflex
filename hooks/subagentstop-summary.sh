#!/bin/bash
# SubagentStop hook — append summary to subagents.jsonl for observability

set -e

INPUT=$(cat)
LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
mkdir -p "$LOGDIR"

# Append raw input (contains agent_id, agent_type, duration, result) plus timestamp
echo "$INPUT" | jq -c ". + {ts: \"$(date -Iseconds)\"}" >> "$LOGDIR/subagents.jsonl" 2>/dev/null || {
  echo "{\"ts\":\"$(date -Iseconds)\",\"raw\":\"$(echo $INPUT | head -c 500)\"}" >> "$LOGDIR/subagents.jsonl"
}

exit 0
