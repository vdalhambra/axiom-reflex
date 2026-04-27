# Changelog

## v0.2.0 — 2026-04-28

Pre-launch polish ahead of Show HN.

### Added

- README badges (Stars, License, Last Commit, Open Issues, Discussions) + Star History chart.
- GitHub Discussions seeded with [#1 Pre-launch: what hooks would you build?](https://github.com/vdalhambra/axiom-reflex/discussions/1).
- Launch content set under `content/launch/`: HN Show HN draft, DEV.to article, Reddit posts, Twitter/LinkedIn assets, newsletter pitches, influencer outreach templates.
- This CHANGELOG.

### Changed

- Pricing alignment across all launch assets: cloud product is `$29/mo standard, $19/mo lifetime for first 100 users`.
- Subagent count harmonized at **6** (outreach-researcher, reply-check, pattern-consolidator, verifier-adversarial, incident-scribe, rayo-heartbeat-watcher) across HN/Reddit/README.

### Fixed

- DEV.to article subject and body templates aligned with the working email template proven in production outreach.
- README install instructions tightened (no implicit `mkdir`, all paths explicit).

## v0.1.0 — 2026-04-25

Initial public release. Hooks + skills + agents + 1 reference MCP, Apache 2.0.

- 7 hooks (Gmail dedup BLOCK, Playwright pattern WARN, secrets scanner, session heartbeat, pre-compact state dump, daily note reminder, subagent logger)
- 6 auto-invocable skills
- 6 custom subagents with model tier routing
- 1 slash command `/status`
- 1 reference MCP (`mem-refs-mcp`)
