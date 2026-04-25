# Newsletter & Podcast Pitches — axiom-reflex launch

**Window:** Send Mon Apr 27 → Wed Apr 30, 2026 (Show HN scheduled Tue Apr 29).
**Founder:** Víctor Domínguez Alhambra (vdalhambra@gmail.com).
**Assets to link in every pitch:**
- Repo: https://github.com/vdalhambra/axiom-reflex (Apache 2.0)
- Cloud: https://axiom-memory.vercel.app (launch $19/mo, standard $29/mo)
- Hook line: "I sent 5 duplicate cold emails in 4 hours, then built Claude Code hooks. The fix was 30 lines of bash, not a better prompt."

**Voice rules:** direct, problem -> artifact, no hype, no "revolutionary." Lead with concrete numbers: 7 hooks + 6 skills + 6 subagents + 4 MCPs, 60% cost reduction via model-tier routing, 192 hours of memory rule that never fired before hooks made it deterministic.

---

## 1. The New Stack — Heather Joslyn (AI dev tools coverage)

- **Editor email:** hjoslyn@thenewstack.io  (also editorial@thenewstack.io as fallback)
- **Submit URL fallback:** https://thenewstack.io/contribute/
- **Subject:** Hooks, not prompts: open-sourcing my Claude Code harness this Tue
- **Why fit:** TNS covers practical AI dev tooling and harness-layer thinking; pieces by Joslyn frequently feature Claude/MCP/agent topics with a working artifact.

**Body:**
Hi Heather,

I'm a solo founder shipping a Claude Code harness called axiom-reflex on Hacker News this Tuesday (Apr 29). Apache 2.0, no VC, dogfooded for 2 weeks on actual revenue work.

The thesis: the harness is the bottleneck, not the model. I sent 5 duplicate cold emails in 4 hours despite a memory rule telling me not to. The fix wasn't a better prompt — it was 30 lines of bash in a PreToolUse hook that hard-blocks `create_draft` when no `search_threads` ran to that recipient first.

axiom-reflex bundles 7 hooks + 6 skills + 6 custom subagents + 4 MCPs. Model-tier routing (Haiku for extraction, Sonnet for code, Opus for strategy) cut my Claude bill ~60%. The companion paid product (axiom-memory cloud, $19/mo launch) syncs the same patterns across machines.

Happy to write 1,200 words for TNS on "Why deterministic hooks beat better prompts" with code examples and the duplicate-email postmortem. Or just point readers to the repo if a feature blurb fits better.

Repo: https://github.com/vdalhambra/axiom-reflex
Cloud: https://axiom-memory.vercel.app

Víctor Domínguez Alhambra

---

## 2. Console.dev — David Mytton (weekly dev tool digest)

- **Submit URL:** https://console.dev/submit-tool/
- **Editor email fallback:** hello@console.dev
- **Subject:** Tool submission: axiom-reflex (Claude Code harness, Apache 2.0)
- **Why fit:** Console curates dev tools weekly with a strong open-source bias and explicit reviewer notes; axiom-reflex is exactly their sweet spot.

**Body:**
Hi David,

Submitting axiom-reflex for Console: an Apache-2.0 Claude Code harness that ships 7 hooks + 6 skills + 6 custom subagents + 4 MCPs as one installable plugin.

What it does, concretely:
- PreToolUse hooks block known-bad tool calls deterministically (Gmail dedup, secret scan, dangerous command guard) — 30 lines of bash, not a prompt.
- Subagents route by model tier (Haiku/Sonnet/Opus) — cut my own Claude bill ~60% over 2 weeks of revenue work.
- 4 MCPs bundled: finance data, site audit, perception (workflow memory), mem-refs.

Launching on HN this Tue Apr 29. The companion cloud product (axiom-memory.vercel.app, $19/mo launch) syncs patterns across machines. The harness itself is and stays free.

Repo: https://github.com/vdalhambra/axiom-reflex

Happy to answer reviewer questions or send a 60-second screencast.

Víctor Domínguez Alhambra

---

## 3. Pointer — Suraj Patil (eng-leadership angle)

- **Submit URL:** https://www.pointer.io/submit
- **Editor email fallback:** suraj@pointer.io
- **Subject:** Why "better prompts" are an org anti-pattern (postmortem + repo)
- **Why fit:** Pointer ships to eng leaders; the "deterministic guardrails > prompt engineering" angle is a leadership/process story, not a tool announcement.

**Body:**
Hi Suraj,

Pitching a piece for Pointer's eng-leader audience: "Stop hiring prompt engineers. Hire hook engineers."

Background: I'm a solo founder who shipped axiom-reflex this week (Apache 2.0 Claude Code harness, HN launch Tue Apr 29). The artifact came out of one bad day: 5 duplicate cold emails in 4 hours despite a written rule against duplicates. I'd been "improving the prompt" for 192 hours of session time across 14 days. Useless.

The fix was 30 lines of bash in a PreToolUse hook. Deterministic. Audit-loggable. Survives compaction. Survives a new model. Survives a junior teammate.

The eng-leadership lesson: agentic systems fail the same way distributed systems do. You don't fix correctness with better naming — you fix it with invariants enforced at boundaries. Hooks are that boundary for AI agents.

Happy to write 800 words with the postmortem, the diff, and 3 hooks any eng team can install in <10 minutes.

Repo: https://github.com/vdalhambra/axiom-reflex

Víctor Domínguez Alhambra

---

## 4. DEV.to community picks

- **Submit URL:** Publish on https://dev.to/ then notify
- **Editor email:** community@dev.to (also yo@dev.to)
- **Subject:** Community pick request: axiom-reflex (Apache 2.0 Claude Code harness)
- **Why fit:** DEV community surfaces hands-on OSS launches with code; we already have a long-form article (02-devto-article.md) ready to publish.

**Body:**
Hi DEV team,

I'm publishing a long-form article on DEV this week titled "I sent 5 duplicate cold emails in 4 hours, then built Claude Code hooks." It's a postmortem + working code + the open-source release that fixed it (axiom-reflex, Apache 2.0, 7 hooks + 6 skills + 6 subagents + 4 MCPs).

Article will go live alongside the HN Show launch on Tue Apr 29. It's structured as: incident -> root cause -> 30-line bash fix -> repo with full harness -> what eng teams can copy today.

Asking nicely: if it fits the bar, I'd love a community pick / weekly roundup mention. The piece is technical, ships working code, and is genuinely free (paid cloud sync is opt-in, the harness itself is Apache 2.0 forever).

Author: @vdalhambra on DEV.

Repo: https://github.com/vdalhambra/axiom-reflex
Cloud: https://axiom-memory.vercel.app

Thanks,
Víctor Domínguez Alhambra

---

## 5. Hacker Newsletter — Kale Davis (weekly HN curation)

- **Submit URL:** https://www.hackernewsletter.com/submit
- **Editor email:** kale@hackernewsletter.com
- **Subject:** HN submission for the weekly: axiom-reflex Show HN (Tue Apr 29)
- **Why fit:** HN Newsletter curates from the front page; flagging early gives a chance at the weekly issue if the post does well.

**Body:**
Hi Kale,

Heads-up for the weekly: I'm posting "Show HN: axiom-reflex — 7 hooks + 6 skills + 6 subagents for Claude Code" on Tue Apr 29 (~9am ET).

Why it might be worth the issue:
- Concrete artifact, Apache 2.0, no VC, solo founder.
- Postmortem-led narrative: 5 duplicate cold emails -> 30-line bash hook that hard-blocks the failure class.
- Bundles 4 MCPs and 6 model-tier-routed subagents (60% Claude cost reduction over 2 weeks).
- Companion paid cloud is clearly separate ($19/mo launch); harness stays free.

Repo: https://github.com/vdalhambra/axiom-reflex

If the HN post lands, would love a mention. If not, no worries — sharing early so it's on your radar.

Víctor Domínguez Alhambra

---

## 6. JavaScript Weekly / Node Weekly — Peter Cooper (Cooperpress)

- **Submit URL:** https://cooperpress.com/publications/  (suggest: peter@cooperpress.com)
- **Editor email:** peter@cooperpress.com
- **Subject:** Node tooling submission: axiom-reflex (Claude Code harness, Apache 2.0)
- **Why fit:** Cooperpress covers JS/Node tools; axiom-reflex hooks shell out from Node-based Claude Code and the MCPs target JS-heavy workflows.

**Body:**
Hi Peter,

Quick submission for Node Weekly (or JavaScript Weekly if it fits better):

axiom-reflex — Apache-2.0 Claude Code plugin that bundles 7 PreToolUse hooks, 6 skills, 6 custom subagents, and 4 MCP servers. Hooks are bash, MCPs are Node/TS. Targets the harness layer of agentic JS development: deterministic guardrails around `create_draft`, `Bash`, `Edit`, etc., before they execute.

Concrete result: hard-blocks duplicate Gmail sends, secret leaks, and dangerous shell commands at the tool-call boundary instead of relying on the model to remember. Cut my own Claude bill ~60% via Haiku/Sonnet/Opus model-tier routing in the subagent fleet.

Show HN goes live Tue Apr 29. Companion cloud (axiom-memory.vercel.app) is the paid optional sync layer.

Repo: https://github.com/vdalhambra/axiom-reflex

Víctor Domínguez Alhambra

---

## 7. Python Weekly — Rahul Chaudhary

- **Submit URL:** https://www.pythonweekly.com/  (suggest via form on site)
- **Editor email:** rahul@pythonweekly.com
- **Subject:** Python submission: axiom-reflex (4 MCP servers, Claude Code, Apache 2.0)
- **Why fit:** 3 of the 4 bundled MCPs (FinanceKit, SiteAudit, axiom-perception) are Python; the perception MCP uses FastMCP and is a clean reference.

**Body:**
Hi Rahul,

Submitting for Python Weekly:

axiom-reflex bundles 4 MCP servers, 3 of them Python (FastMCP-based). Apache 2.0. The perception MCP is the most interesting Python piece — a workflow-memory server that records `recall_pattern` / `save_pattern` / `record_outcome` so an agent's empirical knowledge persists across sessions.

Reference value for Python readers: clean FastMCP example, SQLite + JSONL hybrid storage, accessibility-API integration on macOS for native-app control. The full repo is the harness layer (7 bash hooks + 6 skills + 6 subagents) that the MCPs plug into.

Show HN: Tue Apr 29.

Repo: https://github.com/vdalhambra/axiom-reflex

Víctor Domínguez Alhambra

---

## 8. AI Tidbits — Shubham Saboo (Substack)

- **Submit URL:** Substack DM https://aitidbits.substack.com/  (use Substack chat)
- **Editor email fallback:** shubham@aitidbits.ai (try) or via Substack
- **Subject:** AI Tidbits feature: deterministic guardrails for Claude Code agents
- **Why fit:** AI Tidbits readers care about agent reliability and concrete tooling; axiom-reflex is a working answer to "how do you make agents reliable without fine-tuning?"

**Body:**
Hi Shubham,

Pitching axiom-reflex for an AI Tidbits feature.

The thesis: agent reliability is a harness problem, not a model problem. Concrete proof: I had a written memory rule "don't send duplicate cold emails." It failed. I sent 5 duplicates in 4 hours. The model "knew." It still failed.

The fix wasn't a better prompt or a fine-tune. It was a 30-line bash PreToolUse hook that runs `search_threads(from:me to:<email>)` before any `create_draft` and exits 1 if a recent thread exists. Deterministic. Audit-loggable. Survives compaction. Zero false negatives in 2 weeks.

axiom-reflex packages this pattern across 7 hooks + 6 skills + 6 subagents + 4 MCPs. Apache 2.0. HN launch Tue Apr 29. Paid cloud sync ($19/mo launch) is optional and clearly separate.

This is the kind of "boring infrastructure beats clever prompting" story your readers seem to enjoy.

Repo: https://github.com/vdalhambra/axiom-reflex

Víctor Domínguez Alhambra

---

## 9. The Pragmatic Engineer — Gergely Orosz (long-shot)

- **Submit URL:** No public form. Find via LinkedIn DM (@gergelyorosz) or guest@pragmaticengineer.com
- **Editor email:** guest@pragmaticengineer.com (also gergely@pragmaticengineer.com)
- **Subject:** Field report: 192 hours of failed memory rule -> 30 lines of bash that worked
- **Why fit:** Gergely loves field reports with hard numbers and process lessons; the duplicate-email postmortem is a legitimate eng-process story even at sub-newsletter scale.

**Body:**
Hi Gergely,

Long-shot pitch for The Pragmatic Engineer. Not a tool announcement — a field report from a solo founder running an AI agent on real revenue work.

The number: 192 hours of session time over 14 days where a written memory rule ("dedup before sending cold emails") existed and was ignored by the model. The rule was visible in context. It was reinforced. It still failed catastrophically — 5 duplicates to potential clients in 4 hours.

The fix was 30 lines of bash, not a model upgrade. A PreToolUse hook that intercepts `create_draft` and exits 1 unless a `search_threads` to that recipient ran in the same session. Zero false negatives since installation.

The eng-process lesson is the meat of the piece, not the artifact: agentic systems fail the same way distributed systems do — invariants must be enforced at boundaries, never relied on inside the LLM. I'd write 1,500-2,000 words with the postmortem, the diff, and 3 generalizable patterns. No paywall ask, no payment ask. Pure contribution.

Repo (the artifact): https://github.com/vdalhambra/axiom-reflex (Apache 2.0, launching HN Tue Apr 29).

Víctor Domínguez Alhambra

---

## 10. Latent Space — swyx + Alessio (newsletter at latent.space)

- **Submit URL:** https://www.latent.space/  (newsletter form + reach via swyx Twitter @swyx)
- **Editor email:** swyx@smol.ai (also alessio@latent.space)
- **Subject:** Latent Space pitch: the harness, not the model (live artifact + numbers)
- **Why fit:** swyx has been hammering "the harness is the bottleneck" for months; we have a working artifact, real numbers, and a launch this week.

**Body:**
Hi swyx, hi Alessio,

You've been saying for 6 months that the harness, not the model, is the bottleneck. axiom-reflex is one solo founder's attempt to live that thesis end-to-end.

What's in the box (Apache 2.0, HN Tue Apr 29):
- 7 PreToolUse hooks that hard-block known-bad tool calls (Gmail dedup, secret scan, dangerous Bash).
- 6 custom subagents with explicit Haiku/Sonnet/Opus routing — cut my own Claude bill ~60% over 2 weeks of revenue work.
- 6 skills + 4 MCPs bundled in one Claude Code plugin.
- Companion paid cloud (axiom-memory.vercel.app, $19/mo launch) syncs patterns across machines. Harness stays free.

Concrete origin story: 5 duplicate cold emails in 4 hours despite a written memory rule. 30 lines of bash fixed it. Postmortem + diff in the repo.

Would love either a podcast slot or a newsletter blurb. I can talk for 45 minutes about why prompt engineering is the wrong abstraction layer for production agents — with the diff to back it up.

Repo: https://github.com/vdalhambra/axiom-reflex

Víctor Domínguez Alhambra

---

## 11. Software Engineering Daily — episode pitch

- **Submit URL:** https://softwareengineeringdaily.com/contact/
- **Editor email:** jeff@softwareengineeringdaily.com (also editor@softwareengineeringdaily.com)
- **Subject:** Episode pitch: deterministic hooks vs. prompt engineering for agents
- **Why fit:** SE Daily features eng-deep dives; the harness-layer story is a 45-minute conversation with hard takeaways for any eng team running agents in production.

**Body:**
Hi SE Daily team,

Pitching a guest spot.

Topic: "Why deterministic hooks beat prompt engineering for production AI agents." I'm a solo founder who shipped axiom-reflex this week (Apache 2.0 Claude Code harness, HN launch Tue Apr 29) after 14 days of dogfooding it on real revenue work.

What I can talk about for 45 min:
- Postmortem: 5 duplicate cold emails in 4 hours, 192 hours of memory rule that never fired, 30 lines of bash that fixed it permanently.
- The architecture: 7 PreToolUse hooks + 6 skills + 6 model-tier-routed subagents + 4 MCPs.
- Cost: Haiku/Sonnet/Opus routing cut my Claude bill ~60% — the math, with concrete examples.
- The eng-process lesson: invariants at boundaries, not naming conventions inside LLMs.
- The honest commercial side: harness is free forever, optional cloud sync is $19/mo launch.

Audio + written-notes friendly. Time zone Madrid (UTC+1/+2), flexible.

Repo: https://github.com/vdalhambra/axiom-reflex

Víctor Domínguez Alhambra

---

## 12. Indie Hackers — newsletter feature, founder story

- **Submit URL:** https://www.indiehackers.com/post  (post in #milestones, then DM editor)
- **Editor email:** channing@indiehackers.com (Channing Allen) or hello@indiehackers.com
- **Subject:** Solo founder, no VC, $19/mo paid cloud + Apache 2.0 OSS launching this week
- **Why fit:** IH loves transparent solo-founder launches with the OSS-with-paid-cloud model and real revenue targets.

**Body:**
Hi Channing,

Solo founder, no VC, transparent numbers. Pitching for an Indie Hackers newsletter feature or interview.

Launch: axiom-reflex (Apache 2.0 Claude Code harness) + axiom-memory cloud ($19/mo launch, $29/mo standard) — HN goes live Tue Apr 29.

The story angle:
- 14 days from "5 duplicate cold emails in 4 hours" disaster to fully open-sourced harness running my own revenue work.
- €500 MRR floor target by May 20, public stakes, no VC pressure.
- Honest split: the harness (7 hooks + 6 skills + 6 subagents + 4 MCPs) is free forever; cloud sync is the only paid thing and is optional.
- Cost numbers I can share publicly: ~60% Claude bill reduction via model-tier routing, concrete examples.

I'd happily do a written Q&A, a milestone post with the diff, or a podcast spot. Whatever fits.

Repo: https://github.com/vdalhambra/axiom-reflex
Cloud: https://axiom-memory.vercel.app

Víctor Domínguez Alhambra

---

## Sequencing & follow-up rules

1. **Send order (Mon Apr 27 morning Madrid):** 5 (Hacker Newsletter), 6 (Cooperpress), 7 (Python Weekly), 2 (Console.dev). These are pure submissions, not asks for editorial time.
2. **Send order (Mon Apr 27 afternoon):** 1 (TNS), 8 (AI Tidbits), 4 (DEV.to). Editorial pitches with light personalization.
3. **Send Tue Apr 28:** 3 (Pointer), 10 (Latent Space), 11 (SE Daily), 12 (IH). Higher-touch.
4. **Send Wed Apr 29 (post-Show-HN):** 9 (Pragmatic Engineer) — only if HN post has traction, otherwise skip; wrong audience for a quiet launch.
5. **Dedup mandatory:** before EACH `create_draft`, run `search_threads(from:me to:<editor_email> newer_than:90d)`. Never override.
6. **Real-client gate:** all 12 are publishers/editors. Pitch text above is approved by the brief; final per-pitch send still requires Víctor explicit OK in that send moment.
7. **Follow-up:** D+5 single bump, D+12 final bump, then drop. Reply-in-thread, never new thread.
8. **Track replies:** label `outreach/newsletters` in Gmail. Capture thread_id immediately after send.
