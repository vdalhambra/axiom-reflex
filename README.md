# axiom-reflex

**Hooks, skills, and custom agents that make Claude Code stop repeating mistakes.** Free, Apache 2.0, production-tested on my own revenue work.

One of the things I kept doing: sending duplicate cold emails. I had a rule against it in memory for 8 days. The rule never fired because rules-as-text live in memory files and depend on me remembering them. Then I built a 30-line hook that blocks the class of error at tool-call time. Haven't sent a duplicate since.

This repo ships that hook plus six more like it, a memory tiering layout inspired by Letta's 2026 sleep-time compute, and six opinionated subagents with scoped tools.

Need cloud sync, team pattern sharing, cross-machine resume? → [Axiom Memory](https://axiom-memory.vercel.app) (paid).

## What's inside

### 7 production hooks

Deterministic enforcement at Claude Code tool-call time. Each is ~30 lines of bash.

- `pretooluse-gmail-dedup.sh` — **BLOCKS** `create_draft` if no `search_threads` to the same recipient in recent turns. Prevents the duplicate-email failure mode.
- `pretooluse-playwright-pattern.sh` — warns if no `recall_pattern()` call before browser automation. Nudges toward your pattern library instead of trial-and-error.
- `posttooluse-scan-secrets.sh` — scans written files for API key patterns (Anthropic, OpenRouter, Google, Stripe, GitHub, Tavily, Firecrawl). Alerts + logs.
- `sessionstart-heartbeat.sh` — on every new session: check Rayo/OpenClaw heartbeat, scan memory decay (`last_verified` >60d), pipeline stats, inbox triage.
- `precompact-state-dump.sh` — before `/compact` fires, dumps Rayo status, pipeline stats, git workspace, active subagent state to `_logs/compact_*.md`. State survives compaction.
- `stop-daily-note-reminder.sh` — if session >1h and no daily note for today, reminds at response end.
- `subagentstop-summary.sh` — every subagent finish emits structured JSONL to `_logs/subagents.jsonl` + `_traces/` for replay debugging.

### 6 auto-invocable skills

Procedural knowledge that triggers on task description match.

- `gmail-dedup-preflight` — mandatory pre-flight before `create_draft`.
- `gmail-reply-in-thread` — follow-ups without creating new threads. D+3/D+7/D+14 templates.
- `linkedin-identity-switcher` — switch to Company Page before posting comments. 5 steps with Playwright selectors.
- `twitter-thread-playwright` — `keyboard.type` delay pattern + `addButton` with `force:true` + `aria-modal` scoping. Avoids ClipboardEvent pitfalls.
- `playwright-safe-routing` — never `page.route('**')` (crashes the MCP). Safe `waitForResponse` patterns.
- `reddit-comment-tone` — short, conversational, affiliate disclosure handled correctly.

### 6 custom subagents

YAML frontmatter-configured Claude Code subagents with scoped tools + model tier routing.

- `outreach-researcher` (Haiku) — batch lead prospecting, web scraping, ICP validation.
- `reply-check` (Haiku) — Gmail + LinkedIn inbox scanning, intent classification, pipeline sync.
- `rayo-heartbeat-watcher` (Haiku) — OpenClaw health monitor + alerting.
- `pattern-consolidator` (Sonnet) — weekly sleep-time memory compute (Letta-style).
- `incident-scribe` (Haiku) — structured incident docs with root cause + prevention actions.
- `verifier-adversarial` (Haiku) — Devin Planner/Actor/Verifier pattern. Pre-ship adversarial review.
- `dispatcher` (Haiku) — routes tasks to the right subagent + model tier.

### 1 slash command

- `/status` — instant dashboard: Rayo health, pipeline, replies pending, patterns, hooks fired, subagent runs, decay warnings, OpenRouter balance.

### 1 reference MCP

- [`mem-refs-mcp`](./mcp-servers/mem-refs) — Tier 6 reference memory. JSONL-backed. Grep-fetched on demand. For Gmail thread IDs, LinkedIn conversation URLs, Linear project pointers.

## Why it exists

Codex April 2026 shipped background async, multi-agent persistence, Computer Use natively. Claude Code has equivalent primitives but they must be composed explicitly. This is that composition.

The 2026-04-23 incident that birthed the repo: 5 cold emails duplicated in 4 hours because a rule documented for a week wasn't enforced at tool-call time. A hook now blocks that class of error permanently. This bundle has 7 more like it.

## Install

### Option 1: symlink (fastest)

```bash
git clone https://github.com/vdalhambra/axiom-reflex ~/projects/axiom-reflex

# Link everything
for f in ~/projects/axiom-reflex/hooks/*.sh; do ln -s "$f" ~/.claude/hooks/; done
for d in ~/projects/axiom-reflex/skills/*/; do ln -s "$d" ~/.claude/skills/; done
for f in ~/projects/axiom-reflex/agents/*.md; do ln -s "$f" ~/.claude/agents/; done
cp ~/projects/axiom-reflex/commands/*.md ~/.claude/commands/
chmod +x ~/.claude/hooks/*.sh

# Merge settings.example.json into your ~/.claude/settings.json (see file)

# Install the MCP
cd ~/projects/axiom-reflex/mcp-servers/mem-refs
uv sync
claude mcp add mem-refs -- uv run --directory $(pwd) mem-refs-mcp
```

### Option 2: plugin marketplace

Coming when Claude Code supports custom plugin registries.

## Adapt to your setup

Skills like `linkedin-identity-switcher` reference my Company Page ID (112885029) and specific workflows. Either adapt them for your brand, or use them as scaffolds for your own. The hooks are 100% generic.

## Philosophy

1. **Reflexes over reminders.** A hook that blocks a known-bad tool call is 100× more reliable than a memory note asking Claude to "remember not to do X."
2. **Evidence over assumption.** Every skill cites the incident or pattern that created it.
3. **Never hard-delete.** Supersession is append-only. Memory decays via `last_verified` frontmatter + scheduled scan, not via deletion.
4. **Tiered retrieval.** Pre-load identity always, import projects on keyword match, trigger skills on task match, grep references on demand. Never dump the whole corpus into context.

## Influences

- Anthropic [Claude Code docs](https://docs.claude.com/en/docs/claude-code/) — hooks, skills, agents, memory hierarchy
- Anthropic [contextual retrieval blog](https://www.anthropic.com/news/contextual-retrieval)
- [Letta 2026 sleep-time compute](https://www.letta.com/blog/sleep-time-compute)
- [Zep temporal knowledge graphs](https://www.getzep.com/)
- [Cognition Devin 2.0 Planner/Actor/Verifier](https://cognition.ai/blog/devin-2)
- [Aider repo map PageRank (4× token savings)](https://aider.chat/docs/repomap.html)

## Status

v0.2.0 (2026-04-28). Dogfooded on my own revenue work since day zero — 11 cold emails sent without duplicates, 10 LinkedIn invites, 2 Axiom Company Page posts, 1 Reddit comment landed in r/Inversiones, all tracked via structured traces.

Shipping deltas tracked in [CHANGELOG.md](./CHANGELOG.md).

## Want the hosted version?

`axiom-reflex` is the open-source foundation. [Axiom Memory](https://axiom-memory.vercel.app) adds cloud sync, team pattern sharing, cross-machine resume, semantic search over all patterns. $29/mo (launch $19/mo first 100 users, lifetime).

## Contributing

Issues and PRs welcome. If you build skills/hooks/agents on this scaffold, open a PR — I'll curate useful ones into the default set.

## License

Apache 2.0. Use commercially, fork freely, attribution appreciated not required.

## Author

[Víctor Domínguez](https://github.com/vdalhambra) — solo founder shipping daily.

- X: [@axiom_ia](https://x.com/axiom_ia)
- Hashnode: [axiom-mcp.hashnode.dev](https://axiom-mcp.hashnode.dev)
- Products: [axiom-memory](https://axiom-memory.vercel.app) · [FinanceKit MCP](https://github.com/vdalhambra/financekit-mcp) · [SiteAudit MCP](https://github.com/vdalhambra/siteaudit-mcp)
