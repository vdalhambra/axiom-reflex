# Discord / Slack distribution targets — axiom-reflex

**Goal:** 12 communities to seed launch beyond Reddit + HN + Twitter/LinkedIn. Lower volume than Reddit per community but much higher signal — these are where builders actually lurk.

**Hard rules from Víctor (apply universally):**
- No mass-tag, no link-spam, no cold DMs to non-followers.
- Every server: read `#rules` and pinned posts first. Etiquette varies wildly.
- Most servers require introduction in `#introductions` before any project share. Skipping = ban.
- Affiliate disclosure: NOT in the Discord/Slack message. Goes in the linked Medium/Hashnode article.
- One link per message. If multiple resources, link the GitHub repo only and let people navigate from the README.
- Wait at least 24h between joining a server and posting (some have rate limits, all have cultural ones).
- Never post identical text across servers — flagged as spam by community members.

**Risk legend:**
- **LOW** — server explicitly welcomes project shares in a designated channel.
- **MED** — shares allowed but only after rapport / introduction / weekly thread timing.
- **HIGH** — strong anti-self-promo culture; share only via genuine answer to someone else's question.

**Invite URLs:** verify on day-of before joining. Discord/Slack invites rotate; if a link 404s, search for an updated one on the project's homepage or GitHub README.

---

## 1. Anthropic Discord — Claude Developers

**Invite:** https://www.anthropic.com/discord (official redirect from anthropic.com; canonical link)

**Recommended channel:** `#claude-code-tips` or `#community-projects` (verify exact names on day-of — channel layout shifts). Avoid `#general` for project shares.

**Etiquette:**
- Mods are active. Read `#welcome` and `#rules` carefully.
- Introduction in `#introductions` first. One sentence about who you are, what you're building.
- Wait 48h+ before any link share. Lurk, comment in others' threads, build minimum rapport.
- Project shares allowed in `#community-projects` (or equivalent) but framed as "I built this on Claude Code" not "buy my thing."

**Risk:** MED — Anthropic-employee mods are reasonable but consistent enforcers.

**Message draft (~140 words):**

> Hi all — been running Claude Code as my daily driver for the last two months on solo-founder revenue work and finally cleaned up the harness layer I built around it.
>
> Open-sourced as `axiom-reflex` (Apache 2.0): https://github.com/vdalhambra/axiom-reflex
>
> Most of it is `PreToolUse`/`PostToolUse`/`SessionStart` hooks (~30 lines of bash each) that block specific failure classes deterministically — e.g., a Gmail dedup blocker that's prevented every duplicate cold email since I installed it.
>
> Plus six scoped subagents with explicit model-tier routing (Haiku/Sonnet/Opus) and a memory tiering layout that mirrors the Letta 2026 sleep-time-compute paper.
>
> Sharing because the hook patterns specifically use Claude Code primitives that I think are underdocumented. Happy to answer questions or take feedback. The seven production hooks are inline in the README with their bash sources.

---

## 2. ModelContextProtocol Discord (MCP official)

**Invite:** https://modelcontextprotocol.io/community (canonical; click through to Discord)

**Recommended channel:** `#showcase` or `#mcp-servers` for project shares. `#general` for discussion.

**Etiquette:**
- Smaller, technical, very welcoming to MCP-specific content.
- The repo includes `mem-refs-mcp` (a real MCP server) — lead with that, not the broader bundle.
- Light intro is fine; this server is share-positive when content is on-topic.

**Risk:** LOW — explicitly built for MCP work; project shares welcome.

**Message draft (~150 words):**

> Hello — sharing an MCP server I built and open-sourced as part of a larger Claude Code harness bundle.
>
> `mem-refs-mcp`: JSONL-backed reference memory. Designed for "Tier 6" memory — references like Gmail thread IDs, LinkedIn conversation URLs, Linear project IDs. Grep-fetched on demand, never preloaded into context. Stdlib-only, no DB.
>
> Use case: I needed lightweight reference memory that wouldn't bloat the agent's context. Vector stores are overkill for "look up this thread ID by recipient." Greppable JSONL turned out to be the right shape.
>
> The MCP itself: https://github.com/vdalhambra/axiom-reflex/tree/main/mcp-servers/mem-refs
>
> Bundle context (the rest is hooks + skills + subagents, less MCP-relevant): https://github.com/vdalhambra/axiom-reflex
>
> Apache 2.0. Curious if others here have built similar lightweight reference-memory servers — feels like an under-explored shape vs the heavier vector-DB MCPs that are everywhere right now.

---

## 3. Cursor Discord (community)

**Invite:** https://discord.gg/cursor (linked from cursor.com)

**Recommended channel:** `#show-and-tell` or equivalent project-share channel. Avoid `#general` for self-promo.

**Etiquette:**
- Cursor-flavored but Claude Code crossover content tolerated if framed for Cursor users (many run both).
- Active mods, tight on pure self-promo.
- `#help` and `#feedback` channels are NOT for shares.

**Risk:** MED — tolerant of crossover but only with a real Cursor angle.

**Message draft (~150 words):**

> For folks here who run both Cursor and Claude Code (a lot of you do based on threads I've seen):
>
> Open-sourced the harness layer I built around Claude Code — `axiom-reflex` — and there's enough overlap with Cursor patterns that it might be useful even if you stay primarily in Cursor.
>
> Closest Cursor analogs:
> - The hooks → `.cursorrules` + MCP servers (but Cursor doesn't (yet) expose `PreToolUse`-style deterministic blocking).
> - The skills (auto-load on task match) → `.cursor/rules/*.mdc` files.
> - The model tier routing → Cursor's per-rule model overrides.
>
> If you're switching between agents, the patterns are useful as cross-references.
>
> https://github.com/vdalhambra/axiom-reflex (Apache 2.0)
>
> Genuine question for anyone here: has Cursor's team hinted at adding lifecycle hooks? The closest I see is the `.cursor/rules` directory but it doesn't fire deterministically at tool calls. Feels like a primitive worth advocating for.

---

## 4. Cline Discord (cline.bot — VS Code agent)

**Invite:** https://discord.gg/cline (verify at cline.bot/community on day-of)

**Recommended channel:** `#showcase` or `#community-projects`.

**Etiquette:**
- Smaller, builder-heavy. Project shares welcomed but on-topic.
- Cline + Claude Code crossover users are common — frame as harness-pattern share.

**Risk:** LOW — small server, share-friendly.

**Message draft (~140 words):**

> Cross-posting a small open-source release that has Cline overlap — even though it's primarily Claude Code-targeted.
>
> `axiom-reflex` (Apache 2.0): hooks + skills + scoped subagents for Claude Code. https://github.com/vdalhambra/axiom-reflex
>
> Cline-relevant pieces:
> - The "skills" (markdown files with YAML triggers that auto-load on task match) — Cline doesn't have an exact equivalent but the pattern transfers if you wire it via `CLINE_RULES.md` or workspace settings.
> - The model-tier routing (Haiku/Sonnet/Opus per task class) — Cline's per-task model picker can be configured similarly. About 60% cost reduction on my workload vs always-Sonnet.
> - The memory tiering layout (always-in-context vs keyword-imported vs grep-fetched) — language-agnostic, applies to any long-running agent.
>
> Curious if anyone here has built a hooks-equivalent shim for Cline. The lifecycle event surface area feels smaller and I'd love to be wrong.

---

## 5. Aider Discord

**Invite:** https://discord.gg/Tv2uQnR88V (linked from aider.chat — verify on day-of)

**Recommended channel:** `#general` or `#showcase` (varies). `#help` strictly off-limits for shares.

**Etiquette:**
- Smaller, mature audience. Aider is older and the community is opinionated about agent-design philosophy.
- "I built another agent" framing will be ignored. Share specific patterns or comparisons.

**Risk:** MED — opinionated community, requires substance.

**Message draft (~150 words):**

> Aider users — you've been doing principled small-agent design longer than most. Posting because there's a pattern I think Aider folks would push back on productively.
>
> Released `axiom-reflex` (Apache 2.0): https://github.com/vdalhambra/axiom-reflex
>
> It's built around Claude Code (which has a much chunkier lifecycle / hook system than Aider's `--cmd` and `/run`). The thesis: deterministic enforcement at the tool-call boundary catches a class of failure that prompt-engineering doesn't.
>
> I think Aider's design (small surface, explicit `/commands`, no hooks) gets to the same reliability via a different route — by giving the user direct control rather than scripted enforcement. Both work. But the trade-off is interesting.
>
> Genuinely curious how Aider users here would attack the duplicate-cold-email problem. My fix was a `PreToolUse` blocker; in Aider land I'd guess the answer is "don't have the agent send emails in the first place." Both valid.

---

## 6. Latent Space Discord (latent.space)

**Invite:** https://discord.gg/latent-space (verify at latent.space on day-of — Swyx/Alessio community)

**Recommended channel:** `#paper-club`, `#showcase`, or `#in-the-news`. Avoid `#general`.

**Etiquente:**
- Engineer-podcast audience. High signal, low tolerance for low-effort.
- Frame around "interesting pattern" not "free tool."
- Linking to a written piece (Hashnode article > raw GitHub) often performs better.

**Risk:** MED — mature audience, will judge content quality.

**Message draft (~160 words):**

> Latent Space crew — sharing a small experiment in deterministic enforcement layers for LLM agents that might be on-theme for the podcast's recurring "harness > model" thread.
>
> Released `axiom-reflex` (Apache 2.0): https://github.com/vdalhambra/axiom-reflex
>
> The interesting bit isn't the code — it's the argument. Modern agent harnesses (Claude Code, Codex, OpenAI Agents SDK) expose lifecycle hooks (`PreToolUse`, `PostToolUse`, `SessionStart`, `PreCompact`). These are the equivalent of `systemd` `ExecStartPre` or git pre-commit hooks for the agent loop. Largely under-used.
>
> Concrete: a `PreToolUse` hook that blocks `create_draft` unless `search_threads` to the same recipient happened in the recent transcript. ~30 lines of bash. Eliminated 100% of duplicate cold-email sends across 11 trials post-install.
>
> The repo bundles seven hooks in this style + memory tiering layout following the Letta 2026 sleep-time-compute paper.
>
> Would be curious to hear Swyx / Alessio's take on whether harness-layer composition is the next frontier vs model-layer improvements.

---

## 7. AI Engineer Foundation Slack

**Invite:** https://aiefoundation.org/slack (verify URL — sometimes routed via signup form)

**Recommended channel:** `#show-and-tell`, `#open-source`, or `#projects`.

**Etiquette:**
- Slack workspace, founder-heavy.
- Threads preferred over `#general` posts for substantive shares.
- Introduction in `#introductions` is mandatory before any share.

**Risk:** MED — professional / founder context, share quality matters.

**Message draft (~150 words):**

> Hi all — solo AI founder, sharing an open-source harness layer I extracted from my own workflow after two months of dogfooding.
>
> `axiom-reflex` (Apache 2.0): https://github.com/vdalhambra/axiom-reflex
>
> Bundle: 7 lifecycle hooks for Claude Code (deterministic enforcement at tool-call boundary), 6 auto-invoking skills (procedural knowledge that loads on task match), 6 scoped subagents with explicit model-tier routing (60% cost reduction vs default), memory tiering inspired by Letta 2026.
>
> Most concrete win: a 30-line `PreToolUse` hook that eliminated 100% of duplicate cold-email sends in my workflow. Before: 5 dupes in 4 hours. After: 0/11.
>
> The companion paid product (`axiom-memory.vercel.app`) is for cloud sync + team pattern sharing, but the OSS bundle is fully self-contained.
>
> Posting in case anyone here is solving similar reliability problems on their own agent stack — would love to compare notes.

---

## 8. MLOps Community Slack (mlops.community)

**Invite:** https://go.mlops.community/slack (canonical from mlops.community)

**Recommended channel:** `#tools-of-the-trade`, `#open-source`, or `#llm-in-production`.

**Etiquette:**
- Large workspace, MLOps practitioners. Strict against pure marketing; shares fine if framed around production reliability.
- Read pinned messages in target channel — some have specific share threads.

**Risk:** MED — production-focused audience expects substance.

**Message draft (~160 words):**

> Sharing an OSS release that's relevant to anyone running LLM agents in production-ish contexts (even if "production" is just your own daily-driver workflow).
>
> `axiom-reflex` (Apache 2.0): https://github.com/vdalhambra/axiom-reflex
>
> The MLOps-flavored bits:
>
> - **Observability:** every subagent run emits structured JSONL (`_logs/subagents.jsonl` + per-run `_traces/*.json`) for replay debugging. Captures tool call sequence, model tier used, token counts, latency.
> - **Reliability:** seven `PreToolUse` / `PostToolUse` / `SessionStart` hooks that enforce known-bad-action blockers at the tool boundary. Deterministic, not prompt-based. 100% block rate on the dedup-email failure class.
> - **Cost control:** explicit model-tier routing per subagent (Haiku/Sonnet/Opus). Anecdotal 60% cost reduction vs always-Sonnet defaults on solo-founder workload.
> - **State preservation:** `PreCompact` hook snapshots agent state before context compaction.
>
> Curious how folks here are instrumenting their LLM agent workflows — the observability surface still feels under-developed compared to traditional ML ops.

---

## 9. Indie Hackers Discord

**Invite:** https://www.indiehackers.com/community (Discord/forum hybrid — some channels via Discord, primary forum at indiehackers.com)

**Recommended channel:** `#products` / `#i-made-this` if in Discord, or main IH forum thread.

**Etiquette:**
- Founder community, very share-friendly but anti-spam.
- Story arc + lesson > pitch. "What I learned shipping" outperforms "I built this."
- Posting on the main IH website (forum) typically gets more reach than the Discord side.

**Risk:** LOW — share-friendly culture if framed as founder-experience post.

**Message draft (~170 words):**

> Solo founder here — 27-day sprint to hit a revenue floor (€500 MRR by May 20 or pivot the strategy). Day one I sent five duplicate cold emails to the same prospects in four hours. The rule against duplicates had been written for eight days. The rule never fired because rules-as-text live where models can skip them.
>
> Fixed it with a 30-line bash hook that runs before any draft is created. Refuses to let a draft happen unless the inbox has been searched for that recipient first. Deterministic. Zero duplicates across the next 11 cold emails.
>
> Generalized the pattern, open-sourced the result: https://github.com/vdalhambra/axiom-reflex
>
> Apache 2.0, free forever. Six more hooks like the dedup one, plus skills and scoped subagents. ~5 minute install if you're on Claude Code.
>
> Founder lesson if you're running multi-workflow solo ops: any rule you can't enforce at the action boundary is a wish, not a rule. The duplicate cost me a 6-day reply window with five prospects who saw the dupe and dismissed me.

---

## 10. DEV.to (Forem) community

**Invite:** https://dev.to (account signup; not strictly Discord — but it's a community surface that fits this list)

**Recommended channel:** Tags `#claude`, `#ai`, `#opensource`, `#showdev`. Use `showdev` discussion tag specifically.

**Etiquette:**
- Article-first platform. Comments on others' posts before publishing your own builds reputation.
- A linked DEV.to article (already drafted in `02-devto-article.md`) is the asset; the community signal is the comments / tag-following / reactions.

**Risk:** LOW — DEV.to explicitly encourages project shares via `showdev` tag.

**Message draft (~150 words — for the `#showdev` post intro / discussion comment, not the full article):**

> Just published a write-up of the harness layer I built around Claude Code: deterministic enforcement via lifecycle hooks, auto-invoking skills with task-match triggers, six scoped subagents with explicit model-tier routing.
>
> Concrete result: a 30-line `PreToolUse` hook that eliminated 100% of duplicate cold-email sends in my workflow (5 in 4 hours pre-install → 0/11 post-install).
>
> The argument I'm trying to make: the gap between current Claude Code and OpenAI Codex April 2026 isn't the model — it's the harness composition. Claude Code already has the primitives (hooks, skills, scoped subagents, MCP). They have to be wired explicitly.
>
> Repo (Apache 2.0): https://github.com/vdalhambra/axiom-reflex
>
> Article walks through each of the seven hooks with bash sources inline, plus the memory tiering layout following Letta 2026 sleep-time-compute.
>
> Genuinely curious: if you've built around Cursor / Cline / Aider, where do hooks-equivalents live in your stack?

---

## 11. LangChain Discord

**Invite:** https://discord.gg/langchain (verify at langchain.com/community)

**Recommended channel:** `#showcase` or `#general-builds`.

**Etiquette:**
- Large, framework-flavored. Cross-framework content tolerated if framed around general agent design.
- Avoid framing as "alternative to LangChain" — frame as "complementary patterns."

**Risk:** MED — large enough that mods are strict on relevance.

**Message draft (~150 words):**

> LangChain crew — sharing a Claude Code-flavored harness bundle that has cross-framework relevance for anyone running long-lived agents (LangGraph, LangChain agents, custom).
>
> `axiom-reflex` (Apache 2.0): https://github.com/vdalhambra/axiom-reflex
>
> Cross-framework bits:
>
> - The memory tiering layout (always-in-context / keyword-imported / task-triggered / grep-fetched) is framework-agnostic. I'd love to see a LangGraph implementation.
> - The hooks pattern (deterministic enforcement at tool boundary) maps cleanly onto LangGraph's node-level interrupt + checkpoint primitives. Slightly different mechanism, same idea.
> - The model-tier routing (Haiku/Sonnet/Opus per task class) is implementable as a `RunnableLambda` selector in LangChain.
>
> Genuinely curious if anyone here has built equivalent enforcement layers in LangGraph — the interrupt/checkpoint surface feels like the natural place for it but I haven't seen examples that lean into deterministic-blocking specifically.

---

## 12. Tildes (https://tildes.net) — community alternative to HN/Lobsters

**Invite:** https://tildes.net (open registration via invite, or apply at tildes.net/invite)

**Recommended group:** `~comp` (computing) or `~tech`. `~comp.programming` for the technical write-up.

**Etiquette:**
- Small, opinionated, anti-noise community. Quality bar high; no marketing language.
- Self-promo allowed if substantive and labeled. Tag your post with `Open Source` or `Show & Tell` (group conventions vary).
- Strong moderation; one bad post can earn an account warning.

**Risk:** HIGH — small, prickly community with strong anti-self-promo norms; only post if genuinely useful and willing to engage seriously in comments.

**Message draft (~170 words):**

> **Title:** axiom-reflex — open-source harness bundle for Claude Code (hooks + skills + scoped subagents)
>
> **Body:**
>
> After two months running Claude Code as a daily-driver agent for solo-founder revenue work, I extracted and open-sourced the harness layer I'd accumulated. Apache 2.0.
>
> Repo: https://github.com/vdalhambra/axiom-reflex
>
> The substantive claim: deterministic enforcement at the agent's tool-call boundary catches a class of failure that prompt-engineering doesn't. Concrete example — a 30-line bash hook that fires at `PreToolUse`, inspects the transcript for recent `search_threads` calls before allowing `create_draft`, and exits with a block decision otherwise. Zero duplicate cold emails across 11 subsequent trials, vs five duplicates in four hours pre-install.
>
> Bundle includes seven such hooks, six auto-invoking skills, six scoped subagents with explicit model-tier routing (Haiku/Sonnet/Opus per task class), and a memory tiering layout following the Letta 2026 sleep-time-compute architecture but stdlib-only.
>
> Posting here rather than only on HN/Reddit because Tildes' technical bar is higher and I'd rather get sharp criticism than uncritical upvotes. Open to hearing it.

---

## Posting cadence (12 communities, ~7 days)

| Day | Community | Notes |
|---|---|---|
| Mon | Anthropic Discord | After 48h+ lurk; intro first |
| Mon | MCP Discord | Lead with `mem-refs-mcp` MCP server angle |
| Tue | Cursor Discord | Frame as crossover content |
| Tue | Cline Discord | Small server, low risk |
| Wed | Aider Discord | Substance-first; expect pushback |
| Wed | Latent Space | High-signal audience; frame as pattern |
| Thu | AI Engineer Foundation Slack | Intro first; show-and-tell channel |
| Thu | MLOps Community Slack | Production / observability angle |
| Fri | Indie Hackers | Founder story arc |
| Fri | DEV.to `#showdev` | Article + discussion intro |
| Sat | LangChain Discord | Cross-framework framing |
| Sun | Tildes ~comp | Highest quality bar; only if energy is there |

**Universal pre-post checklist:**

1. Server joined ≥48h ago (or genuinely lurked first).
2. Read `#rules` and pinned messages today.
3. Posted introduction in the right channel (most servers).
4. Substantive comment on someone else's post first (rapport).
5. Message is community-specific, not a copy-paste.
6. One link only (the GitHub repo).
7. Affiliate disclosure NOT in the message.
8. After posting: stay in the channel for 1h+ to answer follow-ups.

**Removal / ban protocol:**

- If muted/warned: do not argue. Apologize briefly, leave the channel for that topic, do not repost.
- If banned: do not register a second account. Treat as data — wrong fit, move on.
- Track outcomes per server in `~/shared/pipeline.md` to inform future launches.
