# axiom-reflex

**Automated reflexes for Claude Code.** Hooks that enforce rules deterministically, skills that load procedural knowledge on task match, custom agents for delegation, and a reference-tier memory MCP. Built for AI-first solo founders who need their Claude Code setup to be as reliable as Codex background agents — without leaving the CLI.

> **Thesis:** the gap between Claude Code and Codex isn't the model — it's the harness. Hooks fire rules; skills auto-invoke; subagents delegate; MCPs persist memory. This plugin wires all four so your reflexes don't depend on remembering them turn-to-turn.

## What's inside

### 7 hooks (reflex enforcement)
- **SessionStart** — Rayo/OpenClaw heartbeat check, decay scan (memories >60d), pipeline stats preview
- **PreToolUse (Gmail create_draft)** — **BLOCKS** if no `search_threads` call happened for that recipient in recent turns (prevents duplicate cold emails — real incident 2026-04-23)
- **PreToolUse (Playwright)** — warns if no `recall_pattern` call happened (nudges toward perception-mcp)
- **PostToolUse (Write/Edit)** — scans for API key leaks (Anthropic, OpenRouter, Google, Stripe, GitHub, Tavily, Firecrawl)
- **PreCompact** — dumps current state (Rayo status, pipeline stats, git, inbox-rayo tail) before context compaction
- **Stop** — reminds to write daily note if session >1h and no daily/YYYY-MM-DD.md exists
- **SubagentStop** — logs every subagent result to observable JSONL

### 6 skills (procedural auto-invocation)
- **gmail-dedup-preflight** — mandatory pre-flight before any create_draft
- **gmail-reply-in-thread** — follow-ups in same thread, not new
- **linkedin-identity-switcher** — comment as Company Page, not personal
- **twitter-thread-playwright** — safe keyboard.type + addButton force:true patterns
- **playwright-safe-routing** — never `page.route('**')` (crashes MCP)
- **reddit-comment-tone** — short, conversational, affiliate disclosure handled correctly

### 6 custom agents (delegation)
- **outreach-researcher** (Haiku) — B2B lead prospecting, web scraping, ICP validation
- **reply-check** (Haiku) — Gmail+LinkedIn inbox scan, flag for main
- **rayo-heartbeat-watcher** (Haiku) — OpenClaw health monitor + alert_victor
- **pattern-consolidator** (Sonnet) — weekly sleep-time compute (Letta-style), promotes recurring patterns from daily/ to projects/
- **incident-scribe** (Haiku) — structured incident docs with root cause + prevention actions
- **verifier-adversarial** (Haiku) — Devin-inspired Planner/Actor/Verifier pattern, pre-ship adversarial review

### 1 slash command
- **/status** — instant dashboard: Rayo health, pipeline, replies pending, patterns, hooks, subagents, decay, OpenRouter balance

### 1 custom MCP
- **mem-refs-mcp** — Tier 6 reference memory (JSONL-backed). Stores Gmail thread_ids, LinkedIn conversation urls, Linear project pointers. Grep-fetched on demand. [See subdirectory](./mcp-servers/mem-refs).

## Why this exists

Codex (April 2026) shipped background async, multi-agent persistence, Computer Use, and scheduling natively. Claude Code has equivalent primitives but they must be composed explicitly. This plugin composes them.

The 2026-04-23 incident that birthed this repo: 5 cold emails duplicated in 4 hours because a rule that had been documented for a week wasn't enforced at tool-call time. A 30-line hook now blocks that class of error permanently.

## Install

### Option 1: symlink (fastest, for your own setup)

```bash
git clone https://github.com/vdalhambra/axiom-reflex ~/projects/axiom-reflex

# Link components
ln -s ~/projects/axiom-reflex/hooks/*.sh ~/.claude/hooks/
for skill in ~/projects/axiom-reflex/skills/*/; do
  ln -s "$skill" ~/.claude/skills/
done
for agent in ~/projects/axiom-reflex/agents/*.md; do
  ln -s "$agent" ~/.claude/agents/
done
cp ~/projects/axiom-reflex/commands/*.md ~/.claude/commands/
chmod +x ~/.claude/hooks/*.sh

# Register hooks in settings.json (see settings.example.json)
# Install mem-refs-mcp
cd mcp-servers/mem-refs && uv sync
claude mcp add mem-refs -- uv run --directory $(pwd) mem-refs-mcp
```

### Option 2: plugin marketplace (TBD)

Once Claude Code plugin marketplace supports custom registries, this will be installable via `/plugins add axiom-reflex`.

## What this does NOT do

- **It doesn't replace Claude Code.** It's a configuration bundle.
- **It doesn't require any paid service.** All primitives run locally on your Claude Code subscription.
- **It doesn't automate Axiom-specific workflows.** Skills like `linkedin-identity-switcher` reference Axiom Company Page IDs — adapt them to your own brand before using.

## Philosophy

1. **Reflexes over reminders.** A hook that blocks a known-bad tool call is 100× more reliable than a memory note asking Claude to "remember not to do X."
2. **Evidence over assumption.** Every skill cites the incident or pattern that birthed it (`feedback_*.md` files in my personal memory).
3. **Never hard-delete.** Supersession is append-only. Memory decays via `last_verified` frontmatter + scheduled scan, not via deletion.
4. **Tiered retrieval.** Pre-load identity always, import projects on keyword match, trigger skills on task match, grep references on demand. Never dump the whole corpus into context.

## Influences

- Anthropic [Claude Code docs](https://docs.claude.com/en/docs/claude-code/) (hooks, skills, agents, memory hierarchy)
- Anthropic [contextual retrieval blog](https://www.anthropic.com/news/contextual-retrieval)
- [Letta 2026 sleep-time compute](https://www.letta.com/blog/sleep-time-compute)
- [Zep temporal knowledge graphs](https://www.getzep.com/)
- [Cognition Devin 2.0 Planner/Actor/Verifier](https://cognition.ai/blog/devin-2)
- [Cursor background agents + worktree isolation](https://docs.cursor.com/en/background-agent)

## Status

v0.1.0 (2026-04-24) — first public release. Dogfooded on my own Claude Code setup since day zero.

## Contributing

Issues and PRs welcome. If you build your own skills/hooks/agents on this scaffold, open a PR — I'll curate useful ones into the default set.

## License

Apache 2.0
