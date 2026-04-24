# I sent 5 duplicate cold emails in 4 hours. Then I built Claude Code hooks.

*Cross-posted to DEV.to + Hashnode (canonical) + Medium.*

**Tags:** `claudecode` `ai` `agents` `devtools` `opensource`

**Cover image:** terminal screenshot of hook blocking a tool call (generate via DALL-E or use ASCII-art stylized).

---

I had a rule written down: "always check Gmail sent before drafting a new cold email to a recipient." I'd written it 8 days ago after a similar incident. The rule lived in a memory file that my agent was supposed to consult before tool calls.

Last week I sent 5 duplicate cold emails in 4 hours to the same recipients I had emailed that morning. The rule had lived in memory for 8 days without firing once.

The reason is structural: rules-as-text depend on *me* remembering to consult them before the tool call. The moment I'm in a flow and skip the check, the rule might as well not exist.

## The 30-line fix

Claude Code exposes a `PreToolUse` hook — a shell script that runs BEFORE a tool executes. It receives the tool input as JSON on stdin and can exit `0` (allow), `2` (block, with reason), or anything else (error).

Here's the hook that ended the duplicate-email problem:

```bash
#!/bin/bash
# ~/.claude/hooks/pretooluse-gmail-dedup.sh

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty')
[ "$TOOL_NAME" != "mcp__claude_ai_Gmail__create_draft" ] && exit 0

TRANSCRIPT=$(echo "$INPUT" | jq -r '.transcript_path // empty')
TO=$(echo "$INPUT" | jq -r '.tool_input.to[0] // empty' | tr -d ' "')
[ -z "$TO" ] || [ -z "$TRANSCRIPT" ] && exit 0

# Check last 100 events for search_threads touching this recipient
LAST_EVENTS=$(tail -c 200000 "$TRANSCRIPT" 2>/dev/null)
if echo "$LAST_EVENTS" | grep -q "search_threads" &&
   echo "$LAST_EVENTS" | grep -qi "$TO"; then
  exit 0
fi

cat <<EOF
{"decision":"block","reason":"Gmail dedup pre-flight missed. Before create_draft to '$TO', call: search_threads(query=\"from:me to:$TO newer_than:14d\"). See incident 2026-04-23: 5 duplicates blocked by this rule."}
EOF
exit 2
```

Registered in `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [{
      "matcher": "mcp__claude_ai_Gmail__create_draft",
      "hooks": [{
        "type": "command",
        "command": "~/.claude/hooks/pretooluse-gmail-dedup.sh",
        "timeout": 10
      }]
    }]
  }
}
```

Haven't sent a duplicate since. I went from a memory file I didn't consult to a deterministic block at the tool boundary.

## Reflexes > reminders

That experience pivoted how I think about AI agent discipline. Every rule I'd written in `feedback_*.md` files for 3 months had the same problem: the rule was text; enforcement depended on the model reading it at the right moment.

Hooks solve this for the specific class of error you've seen before. You can't hook "write good code" — too fuzzy. But you CAN hook:

- "Block `create_draft` without recent `search_threads`" (what I showed)
- "Scan written files for API key patterns after every `Write` or `Edit`"
- "Before browser automation, warn if no `recall_pattern()` call happened"
- "On session start, check if a background service is alive; alert if dead"
- "Before context compaction, dump state that would otherwise be lost"
- "On session stop >1h, remind to write a daily note if one doesn't exist"

I built all seven. Open-sourced them: [github.com/vdalhambra/axiom-reflex](https://github.com/vdalhambra/axiom-reflex) (Apache 2.0). If you run Claude Code daily, these save real time.

## The rest of the stack

Hooks are the reflex layer. For procedural knowledge (how-to), Claude Code's Skills system is better — a skill is a folder with a `SKILL.md` that gets auto-loaded when its description matches the task you described.

I converted my hand-won Playwright patterns ("NEVER `page.route('**')` — crashes the MCP"), LinkedIn Company Page identity switcher steps, Twitter thread publishing tricks, Gmail reply-in-thread flow, Reddit comment tone rules, and Gmail dedup preflight into 6 Skills. They load themselves when relevant.

For delegation, I built 6 custom subagents with scoped tools and explicit model tier routing:

- `outreach-researcher` (Haiku, $0.80/M input) — batch prospecting, web scraping
- `reply-check` (Haiku) — inbox scan + intent classification
- `pattern-consolidator` (Sonnet) — weekly sleep-time memory compute (inspired by Letta 2026)
- `verifier-adversarial` (Haiku) — Devin-style Planner/Actor/Verifier; pre-ship adversarial review
- `incident-scribe` (Haiku) — structured incident docs when something breaks >3 times
- `rayo-heartbeat-watcher` (Haiku) — health monitor for my background agent

The cost savings from model tier routing are real: ~60% reduction vs always-Sonnet defaults, measured on actual runs.

## Memory architecture

The Claude Code community's #1 pain is context loss on `/compact`. See [anthropic/claude-code#34556](https://github.com/anthropics/claude-code/issues/34556) — 59 compactions in 26 days, all working state lost. Microsoft DevBlog: [68 minutes a day re-explaining code](https://devblogs.microsoft.com/all-things-azure/i-wasted-68-minutes-a-day-re-explaining-my-code-then-i-built-auto-memory/).

I tiered my memory following Letta's architecture:

```
Tier 0: CLAUDE.md (<150 lines, always-in-context)
Tier 1: memory/identity/* (semantic, @-imported)
Tier 2: memory/projects/* (auto-import on keyword match)
Tier 3: ~/.claude/skills/* (procedural, auto-invocable)
Tier 4: memory/daily/, incidents/ (episodic, fetched on demand)
Tier 5: axiom-perception MCP (pattern library, tool-triggered recall)
Tier 6: memory/refs/*.jsonl + mem-refs-mcp (references, grep-fetched)
```

With a PreCompact hook that dumps state before compaction and a SessionStart hook that restores it. Works within Claude Code primitives — no external DB required for v1.

## Philosophy

1. **Reflexes over reminders** — a hook beats a memory note for known failure classes.
2. **Evidence over assumption** — every skill cites the incident that spawned it.
3. **Never hard-delete** — supersession via `## Superseded YYYY-MM-DD: reason` blocks + a new fact below. History preserved.
4. **Tiered retrieval** — pre-load identity always, import projects by keyword match, trigger skills by task match, grep references on demand.

If you run Claude Code for revenue-adjacent work and you've ever said "I keep making the same class of mistake," the hooks in this repo cost you nothing and give you a deterministic out.

The cloud version (cross-machine sync, team pattern sharing, semantic search over all your patterns) lives at [axiom-memory.vercel.app](https://axiom-memory.vercel.app) — $29/mo, launch $19/mo for first 100. But the hooks + skills + agents in the open repo are the actual product. Clone it, fork it, adapt it. The class-of-error-blocker approach is free, and it works.

---

**GitHub:** https://github.com/vdalhambra/axiom-reflex
**Follow:** [@axiom_ia](https://x.com/axiom_ia)
