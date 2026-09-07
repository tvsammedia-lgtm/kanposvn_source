"""patcher.py — áp patch/ghi file AN TOÀN: chỉ trong repo root, có backup trước đó."""
from __future__ import annotations

import re
from pathlib import Path

from .ctx import SafePathError, resolve

_HUNK_RE = re.compile(r"^@@ -(\d+)(?:,(\d+))? \+(\d+)(?:,(\d+))?\s*@@(.*)$")


class ApplyError(Exception):
    pass


def _normalize(s: str) -> str:
    return s.rstrip()  # bỏ whitespace cuối dòng để chống nhiễu CRLF/space


class UnifiedPatch:
    """Giữ 1 hunk: item = (op, text) với op in {' ','-','+'}."""

    def __init__(self, old_start: int, old_count: int, new_start: int, new_count: int, items: list):
        self.old_start = old_start
        self.old_count = old_count
        self.new_start = new_start
        self.new_count = new_count
        self.items = items


def _parse_hunks(diff_text: str) -> list[UnifiedPatch]:
    lines = diff_text.splitlines()
    hunks: list[UnifiedPatch] = []
    cur: UnifiedPatch | None = None
    items: list = []
    for raw in lines:
        if raw.startswith("\\"):          # "\ No newline at end of file"
            continue
        if not raw:
            continue
        m = _HUNK_RE.match(raw)
        if m:
            if cur is not None:
                cur.items = items
                hunks.append(cur)
            cur = UnifiedPatch(int(m.group(1)), int(m.group(2) or 1),
                               int(m.group(3)), int(m.group(4) or 1), [])
            items = []
            continue
        if cur is None:
            continue                        # bỏ header ---/+++/diff --git
        if raw[:1] in (" ", "-", "+"):
            items.append((raw[:1], raw[1:]))
    if cur is not None:
        cur.items = items
        hunks.append(cur)
    return hunks


def _apply_hunk(src: list[str], hunk: UnifiedPatch) -> list[str]:
    if not src and hunk.old_start == 0 and hunk.old_count == 0:
        # file mới: chỉ có dòng '+'
        return [text for op, text in hunk.items if op in ("+", " ")]
    pos = hunk.old_start - 1
    if pos < 0:
        pos = 0
    if hunk.old_count == 0 and hunk.old_start >= 1:
        # chèn vào cuối/giữa mà không cần context
        prefix = src[: pos]
        middle = [text for op, text in hunk.items if op == "+"]
        return prefix + middle + src[pos:]

    prefix = src[:pos]
    consumed = 0
    middle: list[str] = []
    src_len = len(src)
    for op, text in hunk.items:
        if op == "+":
            middle.append(text)
            continue
        idx = pos + consumed
        match = None
        if idx < src_len and _normalize(src[idx]) == _normalize(text):
            match = idx
        if match is None:
            # fuzzy: tìm trong 15 dòng kế tiếp
            for j in range(idx, min(idx + 15, src_len)):
                if _normalize(src[j]) == _normalize(text):
                    match = j
                    break
            if match is None:
                raise ApplyError(f"Không khớp dòng {idx + 1}: {text!r}")
            if op == " ":
                middle.extend(src[idx:match])
            consumed += (match - idx)
        if op == "-":
            consumed += 1
            continue
        if op == " ":
            middle.append(text)
            consumed += 1
    suffix = src[pos + consumed:]
    return prefix + middle + suffix


def apply_unified_diff(root: Path, target_rel: str, diff_text: str) -> dict:
    """Áp patch unified diff vào file target_rel (dùng bản---/+++ để biết tên nếu có)."""
    p = resolve(root, target_rel)
    if not p.exists():
        raise ApplyError(f"File chưa tồn tại: {target_rel} (dùng write_file để tạo mới)")
    src = p.read_text(encoding="utf-8", errors="replace").split("\n")
    if src and src[-1] == "":
        src.pop()
    hunks = _parse_hunks(diff_text)
    if not hunks:
        raise ApplyError("Không tìm thấy hunk @@ trong patch")
    changed = src
    for h in hunks:
        changed = _apply_hunk(changed, h)
    p.write_text("\n".join(changed) + "\n", encoding="utf-8")
    return {"applied": True, "file": target_rel, "hunks": len(hunks), "new_size": len(changed)}


def write_file(root: Path, target_rel: str, content: str) -> dict:
    """Ghi đè/tạo file — bắt buộc trong repo root."""
    p = resolve(root, target_rel)
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(content if content.endswith("\n") else content + "\n", encoding="utf-8")
    return {"applied": True, "file": target_rel, "bytes": p.stat().st_size}


class Patcher:
    def __init__(self, cfg: dict):
        self.root = Path(cfg["repo_root"])

    def apply_patch(self, file: str, patch: str) -> dict:
        return apply_unified_diff(self.root, file, patch)

    def write_file(self, file: str, content: str) -> dict:
        return write_file(self.root, file, content)

    def safe_path(self, rel: str) -> str:
        try:
            return str(resolve(self.root, rel))
        except SafePathError:
            return f"(BLOCKED: {rel})"