# Influencer Outreach Plan — axiom-reflex launch

**Hard rule (memory `feedback_twitter_dm_policy.md`):** No cold DMs to non-followers. Strategy = meaningful replies + quote tweets + DMs only to followers/mutuals.

**Window:** T+24h post Show HN (2026-04-30 morning ET) — when repo has stars + HN URL is real.

---

## Tier 1 — High-leverage (English)

### 1. @simonw (Simon Willison) — datasette, sqlite-utils, llm-cli authority
**Approach:** Reply to a recent post about LLMs/MCP/Claude with axiom-reflex as concrete data point. Do NOT DM.
**Asset to drop:** github.com/vdalhambra/axiom-reflex
**Draft reply (template, adapt to actual post):**
> Built something adjacent — 7 PreToolUse hooks for Claude Code that block known-bad tool calls deterministically. The Gmail dedup hook is 30 lines of bash and I haven't sent a duplicate cold email since installing it. Apache 2.0: github.com/vdalhambra/axiom-reflex
**When:** T+24h (Apr 30 morning ET). Find his most recent post about agent tooling/MCP/Claude.

### 2. @swyx (Sean Welch) — Latent Space podcast, dev tools insider
**Approach:** Quote-tweet his latest post on AI dev workflows or reply with the repo as a "real artifact" example.
**Draft quote-tweet:**
> The harness, not the model, is the bottleneck. Open-sourced what I run for my own revenue work: 7 hooks + 6 skills + 6 subagents with explicit model tier routing (60% cost reduction vs always-Sonnet). github.com/vdalhambra/axiom-reflex
**When:** T+24h.

### 3. @mckaywrigley — builder community, Claude/Cursor influencer
**Approach:** He posts a lot about what he builds. Reply on a relevant post with the repo. Could DM if he follows back.
**Draft reply:**
> I built this after sending 5 duplicate cold emails in 4h. The fix wasn't a prompt — it was a 30-line PreToolUse hook that blocks `create_draft` when no `search_threads` to that recipient. Open-sourced the full stack: github.com/vdalhambra/axiom-reflex
**When:** T+24h.

### 4. @t3dotgg (Theo) — YouTube/Twitter, dev tooling commentary
**Approach:** Reply on a Claude/Anthropic/agents post. Theo replies to interesting tech.
**Draft reply:**
> Stop reaching for "better prompts." Reach for hooks. PreToolUse runs 30 lines of bash before any tool call and can hard-block. axiom-reflex bundles 7 of them. Open source: github.com/vdalhambra/axiom-reflex
**When:** T+24h to T+48h.

### 5. @alexalbert__ (Anthropic, Claude DevRel) — official channel awareness
**Approach:** Tweet @ him with concrete artifact. His role is to amplify community work.
**Draft tweet:**
> @alexalbert__ open-sourced this today: 7 hooks + 6 skills + 6 subagents for Claude Code. PreToolUse blocks known-bad tool calls deterministically. Inspired by Letta 2026 sleep-time compute, stdlib-only. Apache 2.0: github.com/vdalhambra/axiom-reflex
**When:** T+24h.

### 6. @mitchellh (Mitchell Hashimoto, ghostty creator, also Anthropic-adjacent)
**Approach:** Same as alexalbert. Concrete artifact, no fluff.
**Draft tweet:**
> @mitchellh built a Claude Code plugin around Letta 2026's sleep-time compute idea — but using only Claude Code primitives (no external DB). 7 hooks + 6 skills + 6 subagents, Apache 2.0: github.com/vdalhambra/axiom-reflex
**When:** T+24h.

---

## Tier 2 — Spanish community (cobertura ES preferente)

### 7. @midudev (Miguel Ángel Durán) — comunidad ES tech enorme
**Approach:** Reply en español a un post sobre AI / dev tools / Claude.
**Draft reply (ES):**
> Llevo 2 semanas usando hooks de Claude Code para enforcar reglas a nivel de tool-call (no a nivel de prompt). 30 líneas de bash bloquean clases enteras de errores. Open-sourced: github.com/vdalhambra/axiom-reflex (Apache 2.0)
**When:** T+24h to T+48h.

### 8. @mouredev (Brais Moure) — similar audience
**Approach:** Same as midudev.
**Draft reply (ES):**
> Una manera de hacer agentes IA más fiables sin tocar el modelo: hooks deterministas que bloquean tool calls antes de que pasen. Open-sourced 7 + 6 skills + 6 subagentes: github.com/vdalhambra/axiom-reflex
**When:** T+24h to T+48h.

---

## Tier 3 — DMs (only if mutual or follower)

### 9. Cline team (Saoud Rizwan, @sdrzn)
**If mutual:** DM with axiom-reflex repo + Cline marketplace mention. Soft ask: would you list our 4 MCPs?
**If not mutual:** Reply on a Cline announcement post.

### 10. Aider team (Paul Gauthier)
**If mutual:** DM about pattern-consolidator subagent (similar to Aider's repo map idea).
**If not mutual:** GitHub issue/discussion in aider repo.

---

## Discord servers (require Víctor logged in — DRAFT only, do not auto-post)

### 11. Anthropic Discord — #claude-code channel
**Draft post:**
> Hey all — open-sourced what I run for my own daily revenue work today. Hooks that block class-of-errors at tool-call time (the Gmail dedup one ended my duplicate-email problem after 8 days of memory-file rules failing). 7 hooks + 6 skills + 6 subagents + 1 reference MCP. Apache 2.0, dogfooded for 2 weeks: github.com/vdalhambra/axiom-reflex. Curious what hooks others have built.

### 12. ClaudeAI subreddit Discord (different from Anthropic's)
Same draft, slightly less formal.

### 13. MCP Discord (modelcontextprotocol.io community)
**Draft post:**
> Released 4 MCPs alongside a Claude Code bundle: axiom-vector (semantic search), axiom-checkpoint (durable SQLite state survives /compact), mem-refs (grep-over-JSONL refs), axiom-trace (structured telemetry). Live in github.com/vdalhambra/axiom-reflex/tree/main/mcp-servers. Feedback welcome.

---

## Execution rules

1. **NEVER cold-DM a non-follower.** Reply > Quote-tweet > DM (mutuals only).
2. **Each engagement must add value first.** No "hey check out my project" without context.
3. **One URL per reply max** (Reddit + X spam filters).
4. **Track replies/responses** in `~/projects/axiom-reflex/content/launch/influencer-tracking.md`.
5. **NO mass-tag.** Personalize each.
6. **Wait until T+24h post-Show-HN** so the repo has real stars + HN URL to point at.

## Backup signals (no DM, just discovery)

- GitHub Sponsors page enabled on axiom-reflex
- Add `mcp-server` topic to all 4 MCP server repos so Glama auto-scrapes
- Submit to npm "MCP" topic listing if applicable
- Hashnode tags: `claudecode`, `mcp`, `ai-agents`, `opensource`
