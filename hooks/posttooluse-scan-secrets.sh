#!/bin/bash
# PostToolUse hook for Write/Edit
# Scans written content for common secret patterns
# Does NOT block (tool already ran), but alerts via stderr + logs

set -e

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')

case "$TOOL_NAME" in
  Write|Edit|MultiEdit) ;;
  *) exit 0 ;;
esac

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
[ -z "$FILE_PATH" ] && exit 0
[ ! -f "$FILE_PATH" ] && exit 0

# Skip known-safe locations (backups, memory docs, templates)
case "$FILE_PATH" in
  */backups/*|*/memory/*|*/drafts/*|*.example|*.template) exit 0 ;;
esac

# Detect common secret patterns
FLAGS=""
if grep -qE "(sk-ant-[a-zA-Z0-9-]{20,}|sk-or-v1-[a-f0-9]{20,})" "$FILE_PATH" 2>/dev/null; then
  FLAGS="$FLAGS anthropic/openrouter-key"
fi
if grep -qE "(AIza[a-zA-Z0-9_-]{30,})" "$FILE_PATH" 2>/dev/null; then
  FLAGS="$FLAGS google-api-key"
fi
if grep -qE "sk_(live|test)_[a-zA-Z0-9]{20,}" "$FILE_PATH" 2>/dev/null; then
  FLAGS="$FLAGS stripe-key"
fi
if grep -qE "ghp_[a-zA-Z0-9]{30,}" "$FILE_PATH" 2>/dev/null; then
  FLAGS="$FLAGS github-token"
fi
if grep -qE "tvly-[a-zA-Z0-9-]{20,}" "$FILE_PATH" 2>/dev/null; then
  FLAGS="$FLAGS tavily-key"
fi
if grep -qE "fc-[a-f0-9]{20,}" "$FILE_PATH" 2>/dev/null; then
  FLAGS="$FLAGS firecrawl-key"
fi

if [ -n "$FLAGS" ]; then
  LOGDIR="$HOME/.claude/projects/-Users-rayomcqueen/memory/_logs"
  mkdir -p "$LOGDIR"
  echo "$(date -Iseconds) | secrets-detected in $FILE_PATH: $FLAGS" >> "$LOGDIR/hooks.jsonl"

  cat >&2 <<EOF
🚨 SECRETS DETECTED in $FILE_PATH:$FLAGS
  - NUNCA commit .env keys. Mover a .env + python-dotenv.
  - Si ya commiteado, ROTATE inmediatamente + filter-branch.
EOF
fi
exit 0
