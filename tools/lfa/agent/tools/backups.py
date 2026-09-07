"""backups.py — snapshot zip + git restore-point + manifest + rollback + retention."""
from __future__ import annotations

import json
import os
import shutil
import subprocess
import time
import zipfile
from datetime import datetime, timezone
from pathlib import Path


def _now_stamp() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%d_%H%M%S")


class BackupManager:
    def __init__(self, cfg: dict):
        self.root = Path(cfg["repo_root"])
        self.lfa_root = Path(cfg["_lfa_root"])
        self.backup_dir = self.lfa_root / "backups"
        self.backup_dir.mkdir(parents=True, exist_ok=True)
        self.manifest_path = self.backup_dir / "manifest.json"
        self.excludes = set(cfg["backup"].get("excludes", []))
        self.retention = int(cfg["backup"].get("retention", 30))
        self._load()

    # ------------------------------------------------------------ manifest
    def _load(self) -> None:
        self.points: list[dict] = []
        if self.manifest_path.exists():
            try:
                data = json.loads(self.manifest_path.read_text(encoding="utf-8"))
                self.points = data.get("points", [])
            except Exception:
                self.points = []

    def _save(self) -> None:
        self.manifest_path.write_text(
            json.dumps({"points": self.points}, ensure_ascii=False, indent=2), encoding="utf-8")

    # ------------------------------------------------------------ create
    def _git_commit(self, label: str) -> str | None:
        try:
            subprocess.run(["git", "add", "-A"], cwd=str(self.root), capture_output=True, text=True, timeout=60)
            res = subprocess.run(
                ["git", "commit", "-m", f"ai-restore {label}"],
                cwd=str(self.root), capture_output=True, text=True, timeout=60)
            return res.stdout.strip().split()[-1] if res.returncode == 0 else None
        except Exception:
            return None

    def _zip_snapshot(self, zip_path: Path) -> None:
        count = 0
        with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zf:
            for dirpath, dirnames, filenames in os.walk(self.root):
                dirnames[:] = [d for d in dirnames if d not in self.excludes and not d.startswith(".")]
                for f in filenames:
                    fp = Path(dirpath) / f
                    rel = fp.resolve().relative_to(self.root.resolve())
                    zf.write(fp, str(rel))
                    count += 1
        return

    def make_backup(self, label: str = "manual") -> dict:
        stamp = _now_stamp()
        pid = f"ai_{stamp}"
        zip_path = self.backup_dir / f"{pid}.zip"
        self._zip_snapshot(zip_path)
        sha = None
        if (self.root / ".git").exists():
            sha = self._git_commit(pid + " " + label)
        point = {"id": pid, "at": stamp, "request": label,
                 "git_sha": sha, "zip": f"{pid}.zip", "status": "keep"}
        self.points.insert(0, point)
        self._trim()
        self._save()
        return point

    # ------------------------------------------------------------ list
    def list_points(self) -> list[dict]:
        return self.points

    # ------------------------------------------------------------ rollback
    def rollback(self, point_id: str) -> dict:
        point = next((p for p in self.points if p["id"] == point_id), None)
        if not point:
            raise BackupError(f"Không tìm thấy restore-point {point_id}")
        zip_path = self.backup_dir / point["zip"]
        if not zip_path.exists():
            raise BackupError(f"Thiếu file {point['zip']}")

        # 1) git reset (nhanh) — nếu có sha
        if point.get("git_sha"):
            try:
                subprocess.run(["git", "reset", "--hard", point["git_sha"]],
                               cwd=str(self.root), capture_output=True, text=True, timeout=120)
            except Exception:
                pass
        # 2) copy file repo đang tồn tại sau git reset về api trạng thái snapshot (an toàn đè)
        self._extract_over(zip_path)
        point["status"] = "restored"
        self._save()
        return {"id": point_id, "action": "restored", "at": _now_stamp()}

    def _extract_over(self, zip_path: Path) -> None:
        tmp = self.backup_dir / f"_tmp_{time.time_ns()}"
        tmp.mkdir(parents=True, exist_ok=True)
        try:
            with zipfile.ZipFile(zip_path) as zf:
                zf.extractall(tmp)
            for item in tmp.iterdir():
                dest = self.root / item.name
                if dest.name == "backups":
                    continue
                if dest.exists():
                    if dest.is_dir():
                        shutil.rmtree(dest, ignore_errors=True)
                    else:
                        dest.unlink()
                shutil.move(str(item), dest)
        finally:
            shutil.rmtree(tmp, ignore_errors=True)

    # ------------------------------------------------------------ trim
    def _trim(self) -> None:
        if len(self.points) <= self.retention:
            return
        for old in self.points[self.retention:]:
            if old.get("status") == "keep":
                f = self.backup_dir / (old.get("zip") or "")
                if f.exists():
                    try:
                        f.unlink()
                    except OSError:
                        pass
        self.points = self.points[:self.retention]


class BackupError(Exception):
    pass