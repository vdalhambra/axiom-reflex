# mem-refs-mcp

**Tier 6 reference memory for Claude Code** — lightweight JSONL-backed MCP for pointers to external systems (Gmail threads, LinkedIn DMs, Linear projects, GitHub PRs, Calendar events).

Part of the [axiom-reflex](https://github.com/vdalhambra/axiom-reflex) self-improvement stack.

## Why

Claude Code's memory hierarchy benefits from **tiered storage**. Tier 0 (CLAUDE.md) is always in context. Tier 1-2 load on keyword match. But Tier 6 — pointers to historical artifacts like "when did I email Ryan?", "what was that Linear ticket?" — should be **grep-fetched on demand**, never pre-loaded.

This MCP gives Claude that capability without setting up a vector DB, embedding pipeline, or graph database. Plain JSONL + grep. Works offline. Under 200 LOC.

## Features

- `search_refs(query, ref_type?, since_days?, limit?)` — case-insensitive substring search
- `add_ref(ref_type, data, tags?)` — append new reference with auto-timestamp + id
- `list_ref_types()` — enumerate types + counts
- `grep_refs(pattern, ref_type?, limit?)` — raw regex grep over JSONLs

## Install

```bash
cd ~/projects/mcp-servers/mem-refs
uv sync  # or: pip install -e .
```

Register in `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "mem-refs": {
      "type": "stdio",
      "command": "uv",
      "args": ["run", "--directory", "/Users/rayomcqueen/projects/mcp-servers/mem-refs", "mem-refs-mcp"]
    }
  }
}
```

Or via `claude mcp add`:

```bash
claude mcp add mem-refs -- uv run --directory ~/projects/mcp-servers/mem-refs mem-refs-mcp
```

## Storage

Default: `~/.claude/projects/-Users-rayomcqueen/memory/refs/`

Override with env var:
```bash
MEM_REFS_DIR=/custom/path mem-refs-mcp
```

One JSONL file per type:
- `gmail_threads.jsonl`
- `linkedin_dms.jsonl`
- `linear_projects.jsonl`
- `github_prs.jsonl`
- `calendar_events.jsonl`
- `miscs.jsonl`

## Example data entry

```json
{
  "ref_type": "gmail_thread",
  "id": "gmail_thread-1714000000",
  "thread_id": "19db9c45e4295063",
  "subject": "Llamadas perdidas en Dentalarroque Boadilla",
  "parties": ["vdalhambra@gmail.com", "boadilla@dentalarroque.es"],
  "date": "2026-04-23",
  "tags": ["smartcall", "outreach", "dental"],
  "notes": "First cold email to dental clinic chain",
  "added_at": "2026-04-23T11:20:00+00:00"
}
```

## Query examples

**"When did I email Ryan?"**
```python
search_refs(query="ryan", ref_type="gmail_thread")
```

**"Latest LinkedIn DMs about SmartCall?"**
```python
search_refs(query="smartcall", ref_type="linkedin_dm", since_days=14)
```

**"All Linear tickets for MaxiBot?"**
```python
search_refs(query="maxibot", ref_type="linear_project")
```

## Integration with existing axiom-perception MCP

They complement each other:

- **axiom-perception** = Tier 5 procedural patterns (how-to workflows)
- **mem-refs** = Tier 6 historical pointers (what happened, when, with whom)

No overlap. Both grep-fetched on demand.

## Status

v0.1.0 (2026-04-24) — initial release. Part of Fase 6 of Claude self-improvement plan.

Roadmap:
- v0.2: backfill scripts (Gmail history → JSONL)
- v0.3: hybrid search (BM25 layer optional)
- v0.4: temporal validity fields (inspired by Zep)

## License

Apache 2.0
