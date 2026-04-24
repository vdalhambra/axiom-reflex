# Directory listings checklist — axiom-reflex launch

**Target:** list in 8+ MCP/tool directories DAY 2 (2026-04-28), all submitted in a 1-afternoon batch. Krisying DEV.to data says "5+ directories = 10× installs."

---

## Priority 1 — high-signal community curators

### 1. awesome-mcp-servers (punkpeye/awesome-mcp-servers)
- **URL:** https://github.com/punkpeye/awesome-mcp-servers
- **Action:** Open PR adding `mem-refs-mcp` (free, part of axiom-reflex) under "Memory" category
- **Template PR description:** "Adds mem-refs-mcp — grep-over-JSONL reference memory. Production-tested. Apache 2.0."
- **Curator:** Frank Fiegel (@punkpeye) — responsive, tends to merge within 1-3 days
- **Our 4 MCPs eligible:** `axiom-vector`, `axiom-checkpoint`, `mem-refs`, `axiom-trace`

### 2. PulseMCP (pulsemcp.com)
- **URL:** https://www.pulsemcp.com/submit
- **Action:** Submit each of 4 MCPs separately
- **Requires:** GitHub repo public, clear README with install instructions, example usage
- **Review time:** 1-3 days (hand-curated)
- **Our assets:** all 4 MCPs ready

### 3. Glama.ai
- **URL:** https://glama.ai/mcp/servers
- **Action:** automated scraper picks up GitHub repos. We're already listed for FinanceKit. Submit/update for new axiom-* MCPs.
- **Review:** automatic within 24-48h once repo tagged `mcp-server` topic

### 4. mcp.so
- **URL:** https://mcp.so/
- **Action:** submit form + GitHub repo URL
- **Review:** 1-2 days

---

## Priority 2 — Claude Code specific

### 5. Claude Code Plugins Official (anthropics/claude-plugins-official)
- **URL:** https://github.com/anthropics/claude-plugins-official
- **Action:** Open PR adding axiom-reflex to marketplace.json
- **Format:** They currently list vendors (MongoDB, Firebase, Figma). Indie submissions are rare but not forbidden. Frame as "indie solo founder production stack."
- **Risk:** high chance of rejection. Try anyway — the PR itself signals to the community.

### 6. Cline Marketplace
- **URL:** https://github.com/cline/mcp-marketplace (or cline.bot/marketplace)
- **Action:** submit MCPs via their PR process
- **Review:** 2-7 days

### 7. Anthropic Connectors Directory
- **URL:** https://support.claude.com/en/articles/11596036-anthropic-connectors-directory-faq
- **Action:** no public submission form. Strategy: tweet @alexalbert__ or @mitchellh with repo link + short pitch
- **Likelihood:** low (3%), but high asymmetric payoff (featured = 10K+ eyeballs)

---

## Priority 3 — general indie / dev directories

### 8. Product Hunt
- **URL:** https://www.producthunt.com
- **Action:** schedule launch for a Tuesday 12:01 am PT (lowest competition day). Ideally MAY 6 Tuesday.
- **Hunter:** ideally someone with karma >5K in dev tools. Reach out to @chrismessina or @rrhoover via DM with pre-launch package.
- **Risk:** no email list = crickets launch. Skip unless I can recruit 20+ upvoters first.

### 9. Hacker News
- (covered in 01-hn-show-hn.md; listed here for completeness)

### 10. Indie Hackers
- **URL:** https://www.indiehackers.com
- **Action:** post in /tech forum + add product to Products directory
- **Review:** manual moderation within 24h

### 11. DEV.to #showdev
- **URL:** https://dev.to/t/showdev
- **Action:** #showdev hashtag on the article
- **Amplification:** automatic if article ranks well

### 12. Polar.sh directory
- **URL:** https://polar.sh (also our payment provider for Axiom Memory)
- **Action:** auto-listed when we create product in Polar

---

## Checklist Day 2 (2026-04-28) — 1 afternoon batch

Target: **12 submissions in 2.5 hours.**

- [ ] 09:00 — awesome-mcp-servers PR (1 PR with 4 MCPs, 15 min)
- [ ] 09:15 — PulseMCP submit × 4 (20 min)
- [ ] 09:35 — Glama re-scrape trigger via pushing new repos (5 min)
- [ ] 09:40 — mcp.so submit × 4 (15 min)
- [ ] 09:55 — Claude Code Plugins marketplace.json PR (20 min, unlikely accept)
- [ ] 10:15 — Cline marketplace PR × 4 (30 min)
- [ ] 10:45 — Anthropic Connectors: tweet alex albert + mitchell hashimoto with repo (no submit form, just signal)
- [ ] 10:55 — Indie Hackers tech forum post + product listing (20 min)
- [ ] 11:15 — Product Hunt: DO NOT LAUNCH YET. Schedule for 2026-05-06 Tuesday. Prepare assets.
- [ ] 11:15 — Polar.sh product creation (15 min) — required anyway for payment processing
- [ ] 11:30 — done.

---

**Tracking spreadsheet:** `~/shared/axiom-reflex-directory-tracking.md` — per directory: submitted date, status (pending/approved/rejected), URL if approved, first-install date, comments from mods.

**Expected outcome by 2026-05-08 (day 14 kill-switch eval):**
- awesome-mcp-servers: merged (90%), +50-200 stars from discovery
- PulseMCP: 3 of 4 approved
- Glama: auto-listed
- mcp.so: 3 of 4 approved
- Anthropic Connectors: no response (95%), but 2-3% chance of boost
- Indie Hackers: moderate signal, 10-30 upvotes
- Product Hunt: separate launch May 6

**Kill-switch data:** combined stars + waitlist + directory approvals decide continue/iterate/kill.
