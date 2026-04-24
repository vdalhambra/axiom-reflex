#!/bin/bash
# PreToolUse hook for Playwright browser_* tools
# WARNS (not blocks) if no recall_pattern happened in recent turns
# Goal: nudge toward using axiom-perception pattern library instead of trial-and-error

set -e

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

# Only check for Playwright tools that perform actions (not snapshots/read-only)
case "$TOOL_NAME" in
  mcp__playwright__browser_click|mcp__playwright__browser_type|mcp__playwright__browser_navigate|mcp__playwright__browser_evaluate|mcp__playwright__browser_press_key|mcp__playwright__browser_select_option|mcp__playwright__browser_file_upload|mcp__playwright__browser_fill_form)
    ;;
  *)
    exit 0
    ;;
esac

TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')

if [ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ]; then
  exit 0
fi

# Check last 30K chars of transcript for recall_pattern call
LAST_EVENTS=$(tail -c 30000 "$TRANSCRIPT" 2>/dev/null || echo "")

if echo "$LAST_EVENTS" | grep -q "recall_pattern\|save_pattern\|record_outcome"; then
  # Pattern MCP used recently, OK
  exit 0
fi

# No pattern recall recent → WARN (don't block, just log and notify via stdout)
LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
mkdir -p "$LOGDIR"
echo "$(date -Iseconds) | playwright-pattern WARN for $TOOL_NAME (no recall_pattern call)" >> "$LOGDIR/hooks.jsonl"

# Warning goes to stderr so user sees it; exit 0 allows tool to proceed
cat >&2 <<EOF
⚠ Playwright reflex warning: no recall_pattern() llamada en turnos recientes.
  Si es workflow conocido (LinkedIn, Twitter, Gmail web, Reddit, etc), llama antes:
    recall_pattern(task="<breve>", app="<target>", context=[...])
  Probation axiom-perception hasta 2026-04-29. Skipping = el producto muere.
EOF
exit 0
