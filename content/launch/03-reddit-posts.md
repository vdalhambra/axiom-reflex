# Reddit launch posts — axiom-reflex

**Timing:** same day as HN Show HN (2026-04-29), staggered 2h apart to maximize different timezone coverage. Monday-Wednesday are best for tech subreddits.

---

## r/ClaudeAI (33k members)

**Title:** Built 7 hooks that block Claude Code from repeating mistakes. Open-sourced.

**Body (max ~500 words for this sub):**

Solo founder here. I kept sending duplicate cold emails because the rule against it was in a memory file my agent would forget to consult. Then I built a PreToolUse hook that blocks `create_draft` when there's no recent `search_threads` to that recipient. 30 lines of bash. Deterministic. Haven't sent a duplicate since.

That pivot — from rules-as-text to rules-as-hooks — was the unlock. Open-sourced the full stack as **axiom-reflex**:

- **7 hooks:** Gmail dedup BLOCK, Playwright pattern WARN, secrets scanner, session heartbeat, pre-compact state dump, daily note reminder, subagent logger
- **6 auto-skills:** Gmail dedup preflight, LinkedIn identity switcher, Twitter thread patterns, Playwright safe routing, Reddit comment tone, Gmail reply-in-thread
- **6 custom subagents** with scoped tools + explicit model tier: outreach-researcher (Haiku), reply-check (Haiku), pattern-consolidator (Sonnet, weekly sleep-time compute), verifier-adversarial (Haiku, Devin-pattern), incident-scribe, rayo-heartbeat-watcher
- **1 slash command `/status`** — instant dashboard
- **1 reference MCP** (`mem-refs-mcp`, JSONL-backed)

Apache 2.0. Real working code — 11 cold emails sent without duplicates after installing, tracked via JSONL traces.

Philosophy: reflexes over reminders. A hook that blocks at the tool boundary is 100× more reliable than a memory file asking Claude to remember not to do X.

Repo: https://github.com/vdalhambra/axiom-reflex

Happy to answer questions about the hooks architecture, the memory tiering (inspired by Letta 2026), or the model tier routing savings (~60% vs Sonnet-default).

---

## r/LocalLLaMA (650k members)

**Title:** axiom-reflex — hook-based enforcement layer for Claude Code, inspired by Letta 2026 sleep-time compute

**Body:**

If you run Claude Code for agentic work and you've ever said "the model keeps making the same class of mistake," this might save you time. Open-sourced today: https://github.com/vdalhambra/axiom-reflex

It's a bundle of:

- **Hooks** that enforce rules at tool-call time (deterministic, not prompt-based). Example: blocks Gmail `create_draft` unless `search_threads` to the recipient happened in recent turns.
- **Skills** with auto-invocation on task description match. Procedural knowledge (LinkedIn identity switcher, Twitter thread Playwright patterns, Playwright safe routing) loads only when relevant.
- **6 custom subagents** with scoped tools + explicit model tier (Haiku for extraction/classification, Sonnet for execution, Opus only for planning). Cost reduction ~60% vs default.
- **Memory tiering** inspired by Letta's architecture: Tier 0 (identity, always-in-context) → Tier 2 (projects, keyword-imported) → Tier 3 (skills, task-triggered) → Tier 5 (patterns via axiom-perception MCP) → Tier 6 (references via grep-over-JSONL). Weekly consolidation cron = Letta-style sleep-time compute, stdlib-only.
- **Companion MCP servers** (open source): axiom-vector (sentence-transformers semantic search), axiom-checkpoint (SQLite durable state that survives /compact), axiom-trace (structured JSONL telemetry), mem-refs (reference memory).

Apache 2.0. Dogfooded on my own revenue work.

The hooks in particular are the magic — you can see them at `github.com/vdalhambra/axiom-reflex/tree/main/hooks`. Each is ~30 lines of bash, reads the transcript, makes a JSON decision. Works with zero dependencies.

Why I built it: the gap vs Codex April 2026 background agents isn't the model, it's the harness. Claude Code has equivalent primitives but they must be composed. This is that composition.

---

## r/LLMDevs (33k members)

**Title:** Deterministic enforcement in Claude Code — hooks + skills + scoped subagents (OSS)

**Body:**

How do you prevent an LLM from repeating a known-bad tool call? Not with a memory note (depends on the model reading it at the right moment). With a hook that blocks at the tool boundary.

Example I built after sending 5 duplicate cold emails in 4 hours:

```bash
# Blocks create_draft unless search_threads to that recipient happened
TOOL_NAME=$(cat | jq -r '.tool_name')
if [ "$TOOL_NAME" = "mcp__Gmail__create_draft" ]; then
  TRANSCRIPT=$(cat | jq -r '.transcript_path')
  RECENT=$(tail -c 200000 "$TRANSCRIPT" | grep "search_threads.*$RECIPIENT")
  [ -z "$RECENT" ] && echo '{"decision":"block",...}' && exit 2
fi
exit 0
```

Haven't duplicated since. Worked at tool-call time, not at prompt-parse time. 30 lines of bash, zero ML.

Open-sourced the full stack: [axiom-reflex](https://github.com/vdalhambra/axiom-reflex) — 7 hooks + 6 skills + 6 subagents + 1 reference MCP + memory tiering architecture inspired by Letta 2026.

The subagents demonstrate explicit model tier routing:
- Haiku ($0.80/M input) for extraction/classification tasks
- Sonnet ($3/M) for execution tasks
- Opus ($15/M) reserved for strategic planning only

Measured ~60% cost reduction on equivalent work vs always-Sonnet defaults.

Memory tiering follows Letta's 2026 architecture but stdlib-only: identity always in context, projects auto-imported on keyword match, skills loaded on task match, patterns recall via MCP, references grep-fetched on demand. Weekly consolidation cron acts as sleep-time compute.

Apache 2.0. Happy to deep-dive on any specific piece.

---

**ANTI-PATTERNS to avoid on all three subs:**
- Do NOT upvote your own post
- Do NOT post to r/SideProject with same content (flagged as cross-post spam)
- Do NOT drop link without technical substance (mods remove, auto-ban risk)
- Do NOT post more than 1 URL per comment (triggers spam filter)
- DO respond to first 5 comments within 2 hours (ranking depends on early engagement velocity)
- DO use `code blocks` for code examples (signals tech substance)
