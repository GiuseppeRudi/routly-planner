from __future__ import annotations

from pathlib import Path


def write_pddl(text: str, path: str | Path) -> None:
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")
    print(f"PDDL written: {path}")
