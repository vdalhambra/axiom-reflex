# Show HN post — axiom-reflex

**Scheduled for:** 2026-04-29 Tuesday 10:00 ET (HN front-page optimal window per Show HN analysis).

**Title (80 char max HN):**
`Show HN: Axiom Reflex – Hooks that block Claude Code mistakes at tool-call time`

**URL field:** https://github.com/vdalhambra/axiom-reflex

**Body (HN accepts ~500 words, keep tight):**

---

Hi HN. Solo founder. Last week I sent 5 duplicate cold emails in 4 hours because a rule I had written down for 8 days wasn't enforced anywhere. The rule lived in a memory file that depended on me remembering it before tool calls.

I built a 30-line bash hook that reads `claude-code` transcript, checks if `search_threads(to:X)` happened in recent turns before `create_draft(to:X)`, and blocks the tool call with a JSON reason if it hasn't. Deterministic. Haven't sent a duplicate since.

Then I kept building. [axiom-reflex](https://github.com/vdalhambra/axiom-reflex) now ships:

- 7 production hooks (Gmail dedup block, Playwright pattern warn, secrets scanner, session heartbeat, pre-compact state dump, daily note reminder, subagent logger)
- 6 auto-invocable skills (with Claude Code's skill system — description matches task → loads procedure)
- 6 custom subagents with scoped tools + model tier routing (Haiku for extraction/classification, Sonnet for execution, Opus only for planning)
- 1 slash command `/status` — instant dashboard of Rayo/pipeline/patterns/hooks
- 1 reference-tier MCP (`mem-refs-mcp`, JSONL-backed, grep-fetched on demand)
- Memory tiering architecture inspired by Letta 2026's sleep-time compute but stdlib-only

Apache 2.0. Production-tested on my own revenue work — 11 cold emails sent without duplicates after the hook, 10 LinkedIn invites, tracked via structured JSONL traces.

Why I'm sharing: the gap vs. Codex April 2026 background agents isn't the model — it's the harness. Claude Code has equivalent primitives (hooks, skills, agents, MCPs, scheduling) but they must be composed. This repo is that composition, opinionated from running my own outreach pipeline.

The philosophy: reflexes over reminders. A hook that blocks a known-bad tool call is more reliable than a memory note asking Claude to "remember not to do X." Evidence-based — each skill cites the incident that created it.

Built the cloud version too (axiom-memory.vercel.app, $29/mo for sync across machines + team pattern sharing), but this repo is the free foundation. If you run Claude Code daily you're losing 60-ish minutes per day to context loss, duplicate sends, and trial-and-error on patterns you've already solved. These hooks fix the class, not the instances.

Happy to answer anything about the hooks design, skill architecture, or tradeoffs vs. just writing better memory notes.

---

**NOTES:**
- First comment (immediately after post): reply from Víctor account with the technical stack choice rationale (why bash hooks vs Python, why Apache 2.0, why Claude Code-only vs model-agnostic).
- Be ready to respond to questions within the first 2 hours — HN ranking depends heavily on early engagement velocity.
- Anti-patterns to avoid: don't upvote your own post (auto-flagged), don't ping friends to upvote (also flagged), don't reply defensively to criticism.
