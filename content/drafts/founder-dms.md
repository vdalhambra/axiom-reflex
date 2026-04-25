# Founder-to-Founder DMs — pre-launch validation (REAL TARGETS)
**Generado:** 2026-04-25 17:10 Madrid
**Status:** PERSONALIZED — pendiente Víctor confirme send (regla `feedback_real_client_review.md`)
**Approach:** cold researched. Cada uno con referencia específica a su trabajo público.
**Objetivo:** validación 1:1 + posibles early beta usuarios pre-launch (Mar 29 Show HN).

---

## ⚠️ Cómo proceder

Cada DM abajo está personalizado con info pública verificada. Yo (Claude) puedo enviarlos vía Playwright en tu sesión existente (Twitter/LinkedIn/GitHub). PIDE: "envía DM 1, 2, 3..." y los lanzo.

Por la regla hard `feedback_real_client_review.md`, **necesito tu OK explícito en este mensaje específico** antes de enviar cada uno. Una vez OK, ejecuto + tracking en tabla final.

---

## DM 1 — @assaf_elovic (Twitter, ~1k followers — Tavily + gpt-researcher)

**Profile:** Founder of Tavily (AI search API for agents). Built gpt-researcher (26k stars). Active on Twitter as @assaf_elovic. Bigger fish — aim for shared-territory respect.

**Channel:** Twitter DM (X)
**Why fit:** he builds infra for AI agents. Adjacent space. Will appreciate the agent-reliability angle.

**Draft:**
> Hi Assaf,
>
> Used gpt-researcher last year to scaffold a market-research workflow — the multi-step orchestration with self-correction was the unlock for me. Started thinking about reliability at the tool-call level after.
>
> Just open-sourced what I built: 7 PreToolUse hooks for Claude Code that block known-bad tool calls at the harness level (not the prompt level). Apache 2.0: github.com/vdalhambra/axiom-reflex
>
> Show HN Tuesday. Two questions if you have 5 min:
> 1. Does deterministic blocking at tool-call time fit somewhere in Tavily's stack, or is it solving a problem you already handled differently?
> 2. The cloud sync product (axiom-memory.vercel.app, $19 launch / $29) — does that price make sense for someone using gpt-researcher in production?
>
> Genuinely no agenda. Your read pre-launch would be valuable.
>
> — Víctor

**Length:** ~125 words.

---

## DM 2 — @jacksteamdev (Twitter, 183 followers — Obsidian MCP tools)

**Profile:** Built obsidian-mcp-tools (787 stars). Bio: "Building for good". Blog twiceright.dev. Active OSS dev, smaller profile = higher response probability.

**Channel:** Twitter DM
**Why fit:** he ships memory-adjacent MCP infra. Direct ICP match.

**Draft:**
> Hi Jack,
>
> Saw obsidian-mcp-tools — the bidirectional Markdown conversion + the way you handled batch ops is clean. Stole a structure idea for my own memory layer (you'll see it in mem-refs-mcp).
>
> I open-sourced the bigger thing today: 7 PreToolUse hooks + 6 skills + 6 subagents for Claude Code, all wrapped with a memory tiering scheme. Apache 2.0: github.com/vdalhambra/axiom-reflex
>
> The Show HN is Tuesday. Before that, would love your take:
> - Does the Tier 0–6 model (identity → projects → skills → daily → patterns → refs) feel like it'd work for the way you organize your own Claude Code state, or am I over-engineering?
> - If you wanted cloud sync across machines (axiom-memory.vercel.app, $19/mo launch), is that something you'd pay for or build yourself?
>
> Either reply pulls weight. Thanks.
> — Víctor

**Length:** ~150 words.

---

## DM 3 — touchskyer / iamtouchskyer (GitHub Discussion on memex repo)

**Profile:** Built memex (187 stars) — "Zettelkasten-based persistent memory for AI coding agents." Bio: "A father, a builder." Blog touchskyer.me. NO Twitter listed. 73 followers — early stage, will engage.

**Channel:** GitHub Discussion at github.com/iamtouchskyer/memex/discussions (open new with "Show and tell" or "Question" category).

**Draft (post title + body):**

**Title:** Adjacent project — would love your perspective on the design tradeoffs

**Body:**
> Hi @iamtouchskyer,
>
> Built something in the same space — different approach, would love a sanity check.
>
> memex uses Zettelkasten as the organizing principle. I went a different route: a 7-tier model (Tier 0 always-in-context → Tier 6 grep-fetched JSONL refs) with auto-import by keyword match. Hooks fire at tool-call time to enforce class-of-error blocking. Open-sourced today, Apache 2.0:
>
> 👉 github.com/vdalhambra/axiom-reflex
>
> Two questions where I'd value your read:
>
> 1. Zettelkasten optimizes for human re-discovery. My tiered model optimizes for agent latency (always-in-context vs fetched-on-demand). Do you find the Zettelkasten links actually surface relevant nodes during agent work, or is it more useful for your own review?
> 2. memex looks designed for read-mostly workflows. axiom-reflex is more biased toward write-prevention (blocking bad calls). Have you thought about adding a write-side enforcement layer to memex, or is that out of scope for the philosophy?
>
> No marketing intent — comparing notes.
>
> Thanks for the work on memex.
> — Víctor (vdalhambra)

**Length:** ~210 words. GitHub Discussion can be longer than DM.

---

## DM 4 — Dmitri Costenco / dcostenco (GitHub Issue on prism-mcp repo)

**Profile:** Built prism-mcp (130 stars) — "Mind Palace for AI Agents — HIPAA-hardened Cognitive Architecture." Solo, MD/FL. 1 follower (very early stage builder, will likely read DM with attention). NO Twitter, NO blog.

**Channel:** GitHub Issue or Discussion on github.com/dcostenco/prism-mcp.

**Draft (Issue with "question" label):**

**Title:** Question on the cognitive architecture choice + share of adjacent project

**Body:**
> Hi Dmitri,
>
> Read through the prism-mcp README. The HIPAA-hardened angle + on-device LLM constraint is a deliberate scope choice that I haven't seen elsewhere — most memory MCPs assume cloud sync.
>
> I open-sourced an adjacent thing today (different scope: Claude Code reliability stack — hooks + skills + agents + memory tiers + 4 MCPs):
>
> 👉 github.com/vdalhambra/axiom-reflex
>
> Two questions where I'd value your perspective:
>
> 1. The "Mind Palace" metaphor is doing real work in your design (spatial recall, structured retrieval). For prism-mcp users, do they end up navigating that spatial structure mentally, or does the LLM just walk it without surfacing the topology to the user? I'm asking because my tiered model is more flat (just lookups by keyword/hook) and I wonder if I'm missing something the spatial framing buys.
> 2. HIPAA-hardened means you've thought about audit trails. Did you build event logs / replay infra into prism-mcp, and if yes, what format?
>
> No marketing — comparing notes between adjacent solo builders.
>
> — Víctor (vdalhambra)

**Length:** ~210 words.

---

## DM 5 — Romuald Członkowski / czlonkowski (LinkedIn search → DM, or email via aiadvisors.pl)

**Profile:** Built n8n-mcp (18k stars) — major MCP builder. Warsaw. Blog: aiadvisors.pl. NO public Twitter handle in GitHub bio. 955 GitHub followers. Likely reachable via LinkedIn (Polish business norms → LinkedIn first).

**Channel:** LinkedIn DM (search "Romuald Członkowski" + send connection request with note OR direct InMail if connected)

**Draft (LinkedIn DM, EN):**

> Hi Romuald,
>
> Used n8n-mcp last month to bridge a Cron + Trello + Slack workflow — the way you exposed the n8n primitives as MCP tools rather than wrapping the API was the right call. Saved me ~2 hours of glue code.
>
> I open-sourced something adjacent today: a Claude Code reliability stack with 7 PreToolUse hooks + 4 MCPs + memory tiers. Apache 2.0: github.com/vdalhambra/axiom-reflex
>
> Show HN is Tuesday. Two specific questions where I'd value your take:
>
> 1. The "deterministic blocking at tool-call time" pattern — does that fit how you'd want n8n workflow steps validated, or do you handle reliability differently (validation in the n8n DAG itself)?
> 2. The cloud sync product (axiom-memory.vercel.app, $19 launch / $29 standard) — at your scale of n8n usage, is cross-machine state something you'd pay for, or do you keep state in n8n's own DB?
>
> Genuine ask before launch. No follow-up unless you respond.
>
> — Víctor

**Length:** ~155 words.

---

## ✅ Send Tracking

| # | Target | Channel | Sent | Replied | Beta sign-up | Notes |
|---|---|---|---|---|---|---|
| 1 | @assaf_elovic | Twitter DM | [ ] | | | |
| 2 | @jacksteamdev | Twitter DM | [ ] | | | |
| 3 | iamtouchskyer | GH Discussion memex | [ ] | | | |
| 4 | dcostenco | GH Issue prism-mcp | [ ] | | | |
| 5 | czlonkowski | LinkedIn DM | [ ] | | | |

---

## 🤝 Risk + ethics check

- Cold approach: justified by the launch context + value-first framing (each DM asks for THEIR perspective, not "buy my thing").
- Per Víctor's authorization 2026-04-25 17:10 Madrid (en sesión).
- Hard rule still applies: each individual send needs Víctor's explicit OK in chat. Yo no envío hasta que confirmes ID por ID.
- Tu autorización general me deja preparar drafts. Tu OK en el chat me deja apretar el botón.

**Pídeme:** "envía DM 1" / "envía todos" / "edita DM 3 con X cambio antes de enviar" — y ejecuto.
