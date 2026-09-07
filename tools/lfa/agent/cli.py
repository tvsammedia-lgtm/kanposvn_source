"""cli.py — lệnh dòng lệnh cho LFA (scripts/*.ps1 gọi qua python).

usage:
    python -m agent.cli status
    python -m agent.cli backup --label "manual"
    python -m agent.cli rollback --id ai_YYYYMMDD_HHMMSS
    python -m agent.cli check
    python -m agent.cli chat "fix lỗi ..." [--no-fix]
"""
from __future__ import annotations

import argparse
import json
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.stderr.reconfigure(encoding="utf-8", errors="replace")
except Exception:  # noqa: BLE001
    pass

from .config import load_config
from .core import Agent
from .tools.backups import BackupError, BackupManager
from .tools.netlock import selftest


def main() -> None:
    cfg = load_config()
    parser = argparse.ArgumentParser(prog="lfa")
    subs = parser.add_subparsers(dest="cmd", required=True)

    subs.add_parser("status")
    subs.add_parser("check")

    p_backup = subs.add_parser("backup")
    p_backup.add_argument("--label", default="manual")

    p_rollback = subs.add_parser("rollback")
    p_rollback.add_argument("--id", required=True)

    p_chat = subs.add_parser("chat")
    p_chat.add_argument("prompt")
    p_chat.add_argument("--no-fix", action="store_true")

    args = parser.parse_args()

    if args.cmd == "status":
        from . import ollama
        client = ollama.OllamaClient(cfg["ollama_base"], cfg["model"])
        bk = BackupManager(cfg)
        print(json.dumps({
            "repo_root": cfg["repo_root"],
            "ollama_ok": client.available(),
            "model": cfg["model"],
            "model_loaded": client.model_loaded(),
            "backup_points": len(bk.list_points()),
            "backup_dir": str(bk.backup_dir),
        }, ensure_ascii=False, indent=2))

    elif args.cmd == "check":
        ok = all(c["ok"] for c in selftest())
        print(json.dumps(selftest(), ensure_ascii=False, indent=2))
        print(f"=> netlock self-test: {'PASS' if ok else 'FAIL'}")

    elif args.cmd == "backup":
        p = BackupManager(cfg).make_backup(args.label)
        print(json.dumps(p, ensure_ascii=False, indent=2))
        print("OK")

    elif args.cmd == "rollback":
        try:
            r = BackupManager(cfg).rollback(args.id)
            print(json.dumps(r, ensure_ascii=False, indent=2))
            print("OK")
        except BackupError as exc:
            print(f"LỖI: {exc}")
            raise SystemExit(1)

    elif args.cmd == "chat":
        agent = Agent(cfg)
        res = agent.chat(args.prompt, auto_fix=not args.no_fix)
        print("\n===== RESULT", res.get("status"), "=====")
        print(res.get("summary") or res.get("llm_reply") or res.get("error"))
        if res.get("failures"):
            print("failures:", res["failures"])
        for e in res.get("events", []):
            if e["t"] in ("backup", "rollback", "patch"):
                print(f"[{e['t']}]", e)


if __name__ == "__main__":
    main()