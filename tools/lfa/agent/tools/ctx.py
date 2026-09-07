"""ctx.py — thu thập ngữ cảnh codebase (chỉ trong repo, không mạng)."""
from __future__ import annotations

import os
import subprocess
from pathlib import Path

DEFAULT_EXCLUDES = {".git", ".dart_tool", ".gradle", "build", "node_modules", ".next",
                    "downloads", "windows", "backups", ".venv", "__pycache__",
                    ".idea", ".vscode", ".dart_tool"}


class SafePathError(Exception):
    """Đường dẫn nằm ngoài repo root."""


def resolve(root: Path, rel: str) -> Path:
    p = (root / rel).resolve()
    r = root.resolve()
    try:
        p.relative_to(r)
    except ValueError as exc:
        raise SafePathError(f"Đường dẫn ngoài repo root: {rel}") from exc
    return p


class Context:
    def __init__(self, cfg: dict):
        self.root = Path(cfg["repo_root"])
        self.excludes = set(cfg.get("backup", {}).get("excludes", [])) | DEFAULT_EXCLUDES
        self.tree_depth = int(cfg["context"].get("tree_depth", 4))
        self.tree_max = int(cfg["context"].get("tree_max_items", 400))
        self.include_git_diff = bool(cfg["context"].get("include_git_diff", True))

    # ---------------------------------------------------------------- tree
    def tree(self, base: str | None = None) -> list[str]:
        """Danh sách entry dạng 'dir/' hoặc 'path' (relative repo root), giới hạn độ sâu."""
        base_dir = self.root if not base else resolve(self.root, base)
        base_parts = len(Path(base).parts) if base else 0
        items: list[str] = []
        for dirpath, dirnames, filenames in os.walk(base_dir):
            dirnames[:] = [d for d in dirnames if d not in self.excludes and not d.startswith(".")]
            rel_dir = Path(dirpath).resolve().relative_to(self.root.resolve())
            depth = max(0, len(rel_dir.parts) - base_parts)
            if depth >= self.tree_depth:
                dirnames[:] = []
            cur_prefix = "" if rel_dir == Path(".") else str(rel_dir).replace("\\", "/") + "/"
            for f in filenames:
                if f in self.excludes:
                    continue
                items.append(cur_prefix + f)
                if len(items) >= self.tree_max:
                    return items
            for d in dirnames:
                items.append(cur_prefix + d + "/")
            if len(items) >= self.tree_max:
                return items
        return items

    # ---------------------------------------------------------------- read
    def read_file(self, rel: str, max_chars: int = 60000) -> str:
        p = resolve(self.root, rel)
        if p.is_dir():
            raise SafePathError(f"{rel} là thư mục, không phải file đọc được")
        if not p.exists():
            raise SafePathError(f"File không tồn tại: {rel}")
        raw = p.read_text(encoding="utf-8", errors="replace")
        if len(raw) > max_chars:
            raw = raw[:max_chars] + f"\n... [đã cắt {len(raw) - max_chars} ký tự]"
        return raw

    # ---------------------------------------------------------------- git
    def _git(self, args: list[str]) -> str:
        try:
            res = subprocess.run(["git", *args], cwd=str(self.root), capture_output=True,
                                 text=True, timeout=30, errors="replace")
            out = (res.stdout or "").strip()
            if res.returncode != 0:
                return ""
            return out
        except Exception:
            return ""

    def git_status(self) -> str:
        return self._git(["status", "--short"]) or "(trạng thái git rỗng)"

    def git_diff(self, max_chars: int = 3000) -> str:
        if not self.include_git_diff:
            return ""
        diff = self._git(["diff", "HEAD"]) or "(không có diff đang chờ)"
        if len(diff) > max_chars:
            diff = diff[:max_chars] + "\n... [diff bị cắt]"
        return diff

    def git_branch(self) -> str:
        return self._git(["branch", "--show-current"]) or "master"

    def exists(self, rel: str) -> bool:
        try:
            return resolve(self.root, rel).exists()
        except SafePathError:
            return False