"""Nạp cấu hình LFA từ config/agent.yaml với default hợp lý."""
from __future__ import annotations

import copy
from pathlib import Path

import yaml

LFA_ROOT = Path(__file__).resolve().parents[1]          # tools/lfa
DEFAULT_REPO_ROOT = LFA_ROOT.parents[1]                 # gốc repo (kanposvn)

_DEFAULTS = {
    "model": "lfa-qwen3",
    "ollama_base": "http://127.0.0.1:11434",
    "ui_host": "127.0.0.1",
    "ui_port": 8790,
    "repo_root": str(DEFAULT_REPO_ROOT),
    "llm": {"temperature": 0.3, "num_ctx": 8192, "max_tokens": 4096, "timeout_sec": 900},
    "context": {"max_chars": 120000, "tree_depth": 4, "tree_max_items": 400, "include_git_diff": True},
    "auto_fix": {
        "analyze_after_patch": True,
        "test_after_patch": True,
        "rollback_on_fail": True,
        "known_fail_tests": [],
    },
    "analyze_cmds": {"dart": ["dart", "analyze", "lib", "test"],
                     "flutter": ["flutter", "analyze", "--no-fatal-infos"],
                     "test": ["flutter", "test"]},
    "backup": {
        "retention": 30,
        "excludes": [".git", ".dart_tool", ".gradle", "build", "node_modules", ".next",
                     "downloads", "windows", "backups", ".venv", "__pycache__", ".idea", ".vscode"],
    },
    "security": {"checksum_netlock": True},
}


def _deep_merge(base: dict, override: dict) -> dict:
    out = copy.deepcopy(base)
    for k, v in override.items():
        if isinstance(v, dict) and isinstance(out.get(k), dict):
            out[k] = _deep_merge(out[k], v)
        else:
            out[k] = v
    return out


def load_config(path: str | Path | None = None) -> dict:
    cfg_path = Path(path) if path else LFA_ROOT / "config" / "agent.yaml"
    override: dict = {}
    if cfg_path.exists():
        try:
            loaded = yaml.safe_load(cfg_path.read_text(encoding="utf-8")) or {}
            if isinstance(loaded, dict):
                override = loaded
        except Exception:
            override = {}

    cfg = _deep_merge(_DEFAULTS, override)

    repo_root = str(cfg.get("repo_root") or "").strip()
    if not repo_root:
        repo_root = str(DEFAULT_REPO_ROOT)
    cfg["repo_root"] = str(Path(repo_root).resolve())
    cfg["_lfa_root"] = str(LFA_ROOT)

    # Nếu model custom chưa tồn tại, giữ nguyên để Ollama báo khi cần
    return cfg