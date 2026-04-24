"""mem-refs-mcp — FastMCP server exposing search/add over JSONL reference stores.

Design:
- Backend: JSONL files in ~/.claude/projects/-Users-rayomcqueen/memory/refs/
- Each ref type = one file (gmail_threads.jsonl, linkedin_dms.jsonl, etc).
- Search = grep + jq filter (no vector DB, no embeddings — keeping it simple for v1).
- Add = append to relevant JSONL with auto-timestamp.

Tier 6 of the memory architecture (see MASTER_PLAN.md):
- Not pre-loaded, grep-fetched on demand.
- Stores pointers to external systems (Gmail thread_ids, LinkedIn conversation urls, Linear project keys).
"""
from __future__ import annotations

import json
import os
import re
import subprocess
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from mcp.server.fastmcp import FastMCP


REFS_DIR = Path(
    os.environ.get(
        "MEM_REFS_DIR",
        Path.home() / ".claude/projects/-Users-rayomcqueen/memory/refs",
    )
)
REFS_DIR.mkdir(parents=True, exist_ok=True)

VALID_TYPES = {
    "gmail_thread",
    "linkedin_dm",
    "linear_project",
    "github_pr",
    "calendar_event",
    "misc",
}

app = FastMCP("mem-refs")


def _path_for(ref_type: str) -> Path:
    safe = re.sub(r"[^a-z_]", "", ref_type.lower())
    return REFS_DIR / f"{safe}s.jsonl"


@app.tool()
def search_refs(
    query: str,
    ref_type: str | None = None,
    since_days: int | None = None,
    limit: int = 20,
) -> dict[str, Any]:
    """Search the reference store for entries matching a query.

    Args:
        query: substring to match (case-insensitive grep over the JSONL).
        ref_type: optional type filter (gmail_thread, linkedin_dm, linear_project,
            github_pr, calendar_event, misc). If omitted, searches all types.
        since_days: only include entries added within the last N days (based on
            `added_at` field). Omit for no time filter.
        limit: max results returned (default 20).

    Returns:
        {"matches": [...], "total_matched": N, "searched_types": [...]}.
    """
    if ref_type and ref_type not in VALID_TYPES:
        return {
            "error": f"Invalid ref_type '{ref_type}'. Valid: {sorted(VALID_TYPES)}",
            "matches": [],
            "total_matched": 0,
        }

    files = (
        [_path_for(ref_type)]
        if ref_type
        else [p for p in REFS_DIR.glob("*.jsonl") if p.is_file()]
    )
    q_lower = query.lower()
    cutoff_ts = None
    if since_days is not None:
        cutoff_ts = datetime.now(tz=timezone.utc).timestamp() - (since_days * 86400)

    matches: list[dict[str, Any]] = []
    searched: list[str] = []

    for path in files:
        if not path.exists():
            continue
        searched.append(path.stem)
        with path.open("r", encoding="utf-8") as f:
            for raw in f:
                line = raw.strip()
                if not line:
                    continue
                if q_lower not in line.lower():
                    continue
                try:
                    entry = json.loads(line)
                except json.JSONDecodeError:
                    continue
                if cutoff_ts is not None:
                    added = entry.get("added_at")
                    if added:
                        try:
                            added_ts = datetime.fromisoformat(
                                added.replace("Z", "+00:00")
                            ).timestamp()
                            if added_ts < cutoff_ts:
                                continue
                        except ValueError:
                            pass
                matches.append(entry)
                if len(matches) >= limit:
                    break
            if len(matches) >= limit:
                break

    return {
        "matches": matches,
        "total_matched": len(matches),
        "searched_types": searched,
        "truncated": len(matches) == limit,
    }


@app.tool()
def add_ref(
    ref_type: str,
    data: dict[str, Any],
    tags: list[str] | None = None,
) -> dict[str, Any]:
    """Add a new reference entry.

    Args:
        ref_type: one of gmail_thread, linkedin_dm, linear_project, github_pr,
            calendar_event, misc.
        data: arbitrary JSON-serializable dict with the reference content.
            Typical fields: thread_id, subject, parties, url, date.
        tags: optional list of string tags for faceted search.

    Returns:
        {"added": true, "file": ..., "id": ...}.
    """
    if ref_type not in VALID_TYPES:
        return {
            "error": f"Invalid ref_type '{ref_type}'. Valid: {sorted(VALID_TYPES)}",
            "added": False,
        }

    entry = dict(data)
    entry["ref_type"] = ref_type
    entry["tags"] = tags or []
    entry["added_at"] = datetime.now(tz=timezone.utc).isoformat()

    # Auto-assign id if not present
    if "id" not in entry:
        entry["id"] = f"{ref_type}-{int(datetime.now(tz=timezone.utc).timestamp())}"

    path = _path_for(ref_type)
    with path.open("a", encoding="utf-8") as f:
        f.write(json.dumps(entry, ensure_ascii=False) + "\n")

    return {"added": True, "file": str(path), "id": entry["id"]}


@app.tool()
def list_ref_types() -> dict[str, Any]:
    """List all valid reference types and per-type entry counts."""
    counts: dict[str, int] = {}
    for ref_type in VALID_TYPES:
        path = _path_for(ref_type)
        if path.exists():
            with path.open("r", encoding="utf-8") as f:
                counts[ref_type] = sum(1 for _ in f if _.strip())
        else:
            counts[ref_type] = 0
    return {
        "valid_types": sorted(VALID_TYPES),
        "counts": counts,
        "refs_dir": str(REFS_DIR),
    }


@app.tool()
def grep_refs(pattern: str, ref_type: str | None = None, limit: int = 50) -> dict[str, Any]:
    """Raw grep over JSONL files — use when search_refs isn't flexible enough.

    Args:
        pattern: regex pattern (passed to `grep -E`).
        ref_type: optional type filter.
        limit: max lines returned.

    Returns:
        {"lines": [raw JSONL strings], "total": N}.
    """
    if ref_type and ref_type not in VALID_TYPES:
        return {
            "error": f"Invalid ref_type '{ref_type}'. Valid: {sorted(VALID_TYPES)}",
            "lines": [],
        }

    files = (
        [str(_path_for(ref_type))]
        if ref_type
        else [str(p) for p in REFS_DIR.glob("*.jsonl") if p.is_file()]
    )
    files = [f for f in files if Path(f).exists()]
    if not files:
        return {"lines": [], "total": 0}

    try:
        result = subprocess.run(
            ["grep", "-E", "--no-filename", pattern, *files],
            capture_output=True,
            text=True,
            timeout=5,
        )
    except (subprocess.TimeoutExpired, FileNotFoundError) as e:
        return {"lines": [], "total": 0, "error": str(e)}

    lines = [line for line in result.stdout.splitlines() if line.strip()][:limit]
    return {"lines": lines, "total": len(lines), "truncated": len(lines) == limit}


def main() -> None:
    """Entry point for `mem-refs-mcp` console script."""
    app.run()


if __name__ == "__main__":
    main()
