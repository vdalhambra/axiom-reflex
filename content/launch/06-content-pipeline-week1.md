# Content pipeline — Week 1 post-launch (Apr 30 → May 6, 2026)

*Cross-post target per article: DEV.to + Hashnode (canonical: Hashnode) + Medium mirror.*
*Schedule: 1 article/day, 09:00 Madrid. Each one stands alone. No "as I mentioned in my last post" connective tissue — assume cold reader.*
*Voice: first person, Axiom. Specific numbers, real incidents, no banned phrases. Hook in line 1.*

---

## Article 1 — Day 2 (Apr 30, 2026)

**Title:** Why my AI agent stopped repeating the same 5 mistakes

**Tags:** `claudecode` `ai` `agents` `productivity`

**Hook:** I had a rule written in a memory file for 8 days. The agent ignored it 6 times.

**Abstract (100 words):**
Memory files are reminders. Reminders depend on the agent reading them at the right moment. When I'm in flow and the agent skips the read, the rule might as well not exist. After the 6th repeat of the same class of error — duplicate cold emails, missed Playwright preflight, secrets accidentally written to disk — I stopped writing rules and started writing hooks. A hook is a deterministic block at the tool boundary. The agent can't skip it, can't forget it, can't decide it doesn't apply this time. Three real examples of the mistakes I killed, with the bash that did it.

**H2 sections:**
- The 6th time I sent a duplicate cold email
- Why memory files don't fire (and hooks always do)
- Three hooks I run on every Claude Code session

---

## Article 2 — Day 3 (May 1, 2026)

**Title:** The 60% Claude Code cost reduction nobody talks about

**Tags:** `claudecode` `ai` `cost-optimization` `subagents`

**Hook:** I was paying Sonnet rates to do log parsing. That's a Haiku job and I was burning $40/day on it.

**Abstract (100 words):**
Claude Code's default behavior is "use the model the user picked, for everything." That's wrong for 70% of the work. Extraction, classification, batch prospecting, log parsing, inbox triage — these are Haiku jobs. Strategic planning, client-facing copy, code review — those earn Sonnet. The 5% that's actually hard earns Opus. I wired model tier routing into 6 custom subagents and cut my monthly Anthropic spend by ~60% on identical workloads. This article shows the routing decision tree, the actual cost-per-task numbers I logged over 14 days, and the YAML config you can copy into your own subagents.

**H2 sections:**
- The decision tree: when each model earns its keep
- Six subagents, three model tiers, real cost numbers
- The YAML config that ended my Sonnet-everywhere bill

---

## Article 3 — Day 4 (May 2, 2026)

**Title:** Memory that survives /compact: the architecture I built

**Tags:** `claudecode` `memory` `ai-architecture` `agents`

**Hook:** 59 compactions in 26 days. Every time, my agent forgot why it was working on what it was working on.

**Abstract (100 words):**
The Claude Code subreddit's #1 complaint is the same as mine: `/compact` nukes working state and the agent restarts confused. Anthropic's own issue tracker has the bug — 59 compactions in 26 days reported by one user. I built a 7-tier memory model on top of Claude Code primitives. Tier 0 is CLAUDE.md, always-in-context. Tier 6 is grepped on demand. PreCompact hook dumps state before the chainsaw runs; SessionStart hook restores it. No external database, no vendor lock-in, no semantic-search-required-to-make-it-work. Just files, hooks, and a discipline about what lives where.

**H2 sections:**
- Why /compact is structurally hostile to agent continuity
- The 7 tiers and what lives at each
- The PreCompact + SessionStart hook pair that saves state

---

## Article 4 — Day 5 (May 3, 2026)

**Title:** I built 6 custom subagents in a weekend. Here's the playbook.

**Tags:** `claudecode` `subagents` `ai` `automation`

**Hook:** Most Claude Code users never write a single subagent. I wrote six in 48 hours and now I delegate 70% of my work.

**Abstract (100 words):**
A custom subagent in Claude Code is a folder with a markdown file. That's the entire surface area. Yet 95% of users never make one. The unlock isn't technical — it's recognizing which work is delegable. I shipped 6 over a weekend: outreach researcher, reply-check, pattern consolidator, adversarial verifier, incident scribe, heartbeat watcher. Each has scoped tools, an explicit model tier, a specific job description, and a test case. This is the playbook: how to spot a subagent-shaped task, how to scope its tools, how to pick its model, and how to know when it's done.

**H2 sections:**
- How to spot a subagent-shaped task
- Scoping tools and model tier (the two decisions that matter)
- The 6 I shipped and what each one earns me per week

---

## Article 5 — Day 6 (May 4, 2026)

**Title:** Why hooks beat prompts for AI agent reliability

**Tags:** `claudecode` `ai` `agents` `opinion`

**Hook:** Prompts are wishes. Hooks are laws. If your agent's reliability lives in a system prompt, it doesn't live anywhere.

**Abstract (100 words):**
Every "make the agent do X reliably" thread on Reddit gets the same answer: "add it to your system prompt." That works for taste. It does not work for safety. A prompt is read at inference time, by a stochastic process, optimized for plausibility. A hook is read by a shell script, by a deterministic process, optimized for correctness. If you want the agent to NEVER send a duplicate email — that's not a prompt job, it's a hook job. This is the philosophical case for moving reliability out of the model and into the runtime, and the line where each tool earns its keep.

**H2 sections:**
- The three failure modes prompts cannot fix
- What hooks earn (and what they can't do either)
- A 30-second test: prompt or hook?

---

## Article 6 — Day 7 (May 5, 2026)

**Title:** The Claude Code stack I run for revenue work in 2026

**Tags:** `claudecode` `stack` `ai` `productivity`

**Hook:** Claude Pro alone is a Ferrari with the seatbelt off. Here's everything else I bolted on to make it actually drive my revenue.

**Abstract (100 words):**
Claude Pro is the engine. Hooks, skills, subagents, MCPs, and a memory architecture are the rest of the car. This is a tour of the full stack I run every day to ship outreach, content, code, and client work — including the open-source repo (axiom-reflex) and the hosted product (axiom-memory) that wraps it for cross-machine sync. I'll show what I install, what I configure, what each piece costs in time and money, and which pieces I'd skip if I were starting today. Also the one MCP I built and never use, and why.

**H2 sections:**
- The 9 MCPs I keep loaded (and the 4 I uninstalled)
- Hooks, skills, subagents: what each layer earns
- Open-source axiom-reflex vs hosted axiom-memory: when each matters

---

## Article 7 — Day 8 (May 6, 2026)

**Title:** Open source vs hosted: how I split axiom-reflex and axiom-memory

**Tags:** `opensource` `pricing` `saas` `indiehackers`

**Hook:** I gave away the code and charge for the cloud. Here's the pricing math, the trust math, and the moat math.

**Abstract (100 words):**
Open-sourcing the hooks felt obvious. Charging $19/mo for the cloud version felt presumptuous — until I did the math. The repo is the trust layer: you can audit every line, fork it, run it offline forever. The hosted product is the convenience layer: cross-machine sync, semantic search across patterns, team sharing. They serve different jobs and they reinforce each other — every star on the repo is a free trial of the philosophy. This is the post-mortem on the split: how I priced it, what I open-sourced and why, and the trap I almost fell into of charging for the wrong half.

**H2 sections:**
- The trap: charging for the part that should be free
- What's in the repo, what's in the cloud, why the line is there
- The pricing decision: $19 launch, $29 standard, no enterprise tier yet

---

## Operational notes

- **Order of operations per article:** draft → run through `axiom-voice` skill → cross-post DEV.to + Hashnode (canonical Hashnode) → Medium mirror with canonical link → 1 X thread teaser (3-5 tweets) → 1 LinkedIn Axiom Company Page post linking it → 2-3 Reddit comments where relevant (`r/ClaudeAI`, `r/LocalLLaMA`, `r/SaaS`) using the article as payload, NOT as a top-level post.
- **Tracking:** every CTA URL gets `?ref=blog-${slug}` for attribution. Repo links and landing links both.
- **Auto-promo ratio:** articles 6 and 7 are explicit auto-promo. Articles 1-5 mention the repo at the end only. Hits the 1-in-5 ratio across the week with one to spare.
- **Kill switch:** if any article hits >5K views in <24h, immediately write a follow-up extending the most-clicked H2 into its own piece. Compounding > scheduling.
- **Distribution volume per article:** 50+ touchpoints minimum first 48h. Reply on 20+ tweets in the same orbit, comment on 10-15 LinkedIn posts where the article is a genuine answer, drop the link in 5+ relevant subreddit comment threads (never as a post unless r/ rules explicitly allow).
