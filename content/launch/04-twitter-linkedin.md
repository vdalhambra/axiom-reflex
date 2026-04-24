# Twitter + LinkedIn launch posts — axiom-reflex

**Timing:** día del Show HN (2026-04-29), 30 min AFTER HN post live. Cross-post to maximize reach.

---

## Twitter thread @axiom_ia (7 tweets)

**Thread master:**

**1/** Last week I sent 5 duplicate cold emails in 4h.

Had a rule against it for 8 days. The rule lived in a memory file my agent would forget to consult.

Today I open-sourced the fix: hooks that block class-of-errors at tool-call time, before they ship.

🧵

**2/**
Claude Code exposes `PreToolUse` hooks. They run BEFORE a tool fires, read tool input as JSON, and can block with a reason.

30 lines of bash:

```bash
if [ "$TOOL" = "create_draft" ]; then
  grep -qi "search_threads.*$RECIPIENT" "$TRANSCRIPT" || \
    { echo '{"decision":"block"}'; exit 2; }
fi
```

Deterministic. Haven't duplicated since.

**3/**
Then I kept building. `axiom-reflex` now ships 7 hooks:

- Gmail dedup BLOCK
- Playwright pattern WARN (before browser automation)
- Secrets scanner (after every Write/Edit)
- Session heartbeat (OpenClaw/Rayo alive?)
- Pre-compact state dump (survives /compact)
- Daily note reminder
- Subagent logger (structured traces)

**4/**
6 auto-invocable skills. Procedural knowledge that loads on task-description match:

- Gmail dedup preflight
- LinkedIn identity switcher (Company Page, not personal)
- Twitter thread Playwright (keyboard delay + force:true)
- Playwright safe routing (never `page.route('**')`)
- Reddit comment tone
- Gmail reply-in-thread

**5/**
6 custom subagents with scoped tools + explicit model tier routing:

Haiku ($0.80/M) → extraction, classification, batch prospecting
Sonnet ($3/M) → execution, code editing
Opus ($15/M) → planning only

Measured ~60% cost reduction vs always-Sonnet defaults.

**6/**
Memory tiering inspired by Letta 2026's sleep-time compute but stdlib-only:

Tier 0 — identity, always in context (<150 lines)
Tier 2 — projects, keyword-imported
Tier 3 — skills, auto-loaded on task match
Tier 5 — patterns via axiom-perception MCP
Tier 6 — references via grep-over-JSONL (mem-refs MCP)

Works in Claude Code primitives. No external DB.

**7/**
Apache 2.0. Dogfooded on my own revenue work for 2 weeks.

Free forever. Cloud version with sync + team patterns at axiom-memory.vercel.app ($29/mo, launch $19/mo first 100).

→ Repo: github.com/vdalhambra/axiom-reflex
→ Product: axiom-memory.vercel.app

RTs appreciated if useful 🙏

---

## LinkedIn Axiom Company Page post (single post, long-form)

**Headline:** Hooks beat memory notes for AI agent discipline. Open-sourced the stack that ended my duplicate-email problem.

**Body:**

Two weeks ago I sent 5 duplicate cold emails in 4 hours. I had written a rule against it 8 days earlier — in a markdown memory file my Claude Code agent was supposed to consult before drafting.

The rule had lived there, unconsulted, for 192 hours. Because rules-as-text depend on the agent remembering to read them at the right moment. The first time I went fast, the rule might as well not have existed.

The fix was structural, not procedural. Claude Code has a `PreToolUse` hook — a shell script that runs before a tool fires, receives the tool input, and can block the call with a reason.

A 30-line bash hook now blocks `create_draft` unless `search_threads` to that recipient happened in recent turns. Deterministic. I haven't sent a duplicate since.

That pivot — from prompt-based rules to hook-based enforcement — changed how I think about AI agent reliability.

Today I open-sourced the full stack: axiom-reflex. Apache 2.0.

What's inside:
→ 7 production hooks (dedup blocker, secrets scanner, session heartbeat, pre-compact state dump, more)
→ 6 auto-invocable skills (procedural knowledge loaded on task match)
→ 6 custom subagents with model tier routing (60% cost reduction vs Sonnet-default)
→ Memory tiering inspired by Letta 2026's sleep-time compute, stdlib-only
→ Companion MCP servers (vector search, durable checkpoint, JSONL traces, references)

Dogfooded on my own revenue work for 2 weeks. 11 cold emails sent without duplicates since installing. Tracked via structured JSONL traces for replay debugging.

The open-source version is free forever. The hosted cloud version (Axiom Memory, sync across machines + team pattern sharing + semantic search) is $29/mo (launch $19/mo lifetime for first 100).

Reflexes > reminders. A hook that blocks a known-bad tool call is 100× more reliable than a memory note asking Claude to "remember not to do X."

→ Repo: https://github.com/vdalhambra/axiom-reflex
→ Cloud version: https://axiom-memory.vercel.app

If you run Claude Code for revenue-adjacent work and you've ever said "I keep making the same class of mistake," this costs you nothing and gives you a deterministic out.

#ClaudeCode #AIAgents #OpenSource #MCP #IndieHacker

---

## Cross-post adaptations

### Hashnode blog version

Use `02-devto-article.md` canonical URL + add custom subdomain slug `axiom-mcp.hashnode.dev/reflexes-over-reminders-claude-code-hooks` for SEO.

### Medium

Same article, canonical pointing to Hashnode. Medium Partner Program revenue if eligible.

### DEV.to

Same article (canonical still Hashnode if using #canonicalurl: in frontmatter).

---

**PUBLISHING ORDER (critical for algorithmic lift):**

1. **T+0:** HN Show HN post LIVE
2. **T+30 min:** Twitter thread @axiom_ia
3. **T+45 min:** LinkedIn Axiom Company Page post
4. **T+1h:** DEV.to article publish
5. **T+1h:** Hashnode publish (with canonical)
6. **T+1h:** Medium publish (with canonical)
7. **T+2h:** r/ClaudeAI post
8. **T+4h:** r/LocalLLaMA post
9. **T+6h:** r/LLMDevs post
10. **T+24h:** DMs to 6 influencers (re-engage simonw, swyx, mckaywrigley, t3dotgg, midudev, mouredev with real asset: "hey I launched axiom-reflex today, would love your read")

Expected traffic first 24h:
- HN front page hit (10% prob): 5-50K uniques
- Reddit combined: 1-5K uniques
- Twitter + LinkedIn borrowed audience: 500-5K
- Total: 1.5K-60K uniques to landing

Conversion target:
- GitHub stars: 50-500 first 24h
- Waitlist signups: 10-100
- Pro early-access clicks: 5-50
