"""analyzer.py — gọi flutter/dart analyze & test cục bộ, phân tích output."""
from __future__ import annotations

import re
import subprocess
import time
from pathlib import Path

_ISSUE_RE = re.compile(
    r"([\w.\-/\\]+\.dart):(\d+):(\d+)\s*-\s*(error|warning|info)\s*-\s*(.+)$"
)


class Analyzer:
    def __init__(self, cfg: dict):
        self.root = Path(cfg["repo_root"])
        self.cfg = cfg
        self.known_fail = [str(x).lower() for x in cfg["auto_fix"].get("known_fail_tests", [])]

    def run(self, cmd: list[str], timeout: int = 1200) -> dict:
        started = time.time()
        try:
            res = subprocess.run(cmd, cwd=str(self.root), capture_output=True,
                                 text=True, timeout=timeout, errors="replace")
            output = (res.stdout or "") + (("\n" + res.stderr) if res.stderr else "")
            code = res.returncode
            timed_out = False
        except subprocess.TimeoutExpired:
            output = f"TIMEOUT sau {timeout}s"
            code = -999
            timed_out = True
        except FileNotFoundError:
            output = f"Không tìm thấy lệnh: {cmd[0]} (cài Flutter/Dart rồi thử lại)"
            code = -998
            timed_out = False
        return {
            "cmd": cmd, "code": code, "output": output,
            "issues": self.parse_issues(output),
            "duration_sec": round(time.time() - started, 1),
            "timed_out": timed_out,
        }

    def dart_analyze(self, scope: str = "lib test") -> dict:
        cmd = [*self.cfg["analyze_cmds"]["dart"]] if scope in ("lib test", "") else ["dart", "analyze", *scope.split()]
        return self.run(cmd)

    def flutter_analyze(self) -> dict:
        return self.run(self.cfg["analyze_cmds"]["flutter"])

    def flutter_test(self, paths: list[str] | None = None) -> dict:
        cmd = [*self.cfg["analyze_cmds"]["test"]]
        if paths:
            cmd += list(paths)
        return self.run(cmd)

    # ---------------------------------------------------------------- parse
    def parse_issues(self, text: str) -> list[dict]:
        issues = []
        for line in text.splitlines():
            m = _ISSUE_RE.search(line)
            if m:
                issues.append({
                    "file": m.group(1), "line": int(m.group(2)), "col": int(m.group(3)),
                    "level": m.group(4), "message": m.group(5).strip(),
                })
        return issues

    def error_count(self, res: dict) -> int:
        return sum(1 for i in res.get("issues", []) if i["level"] == "error")

    def analyze_clean(self, res: dict) -> bool:
        return res.get("code") in (0,) or self.error_count(res) == 0

    def test_had_regression(self, res: dict) -> bool:
        """Co là 'hồi quy' nếu test thất bại và KHÔNG phải lỗi đã biết từ trước."""
        if res.get("code") in (0,):
            return False
        out = (res.get("output") or "").lower()
        failed_lines = [ln for ln in out.splitlines() if "[e]" in ln or "some tests failed" in ln]
        if self.known_fail:
            return any(not any(k in ln for k in self.known_fail) for ln in failed_lines)
        return True

    def summary(self, res: dict) -> str:
        issues = res.get("issues", [])
        errs = sum(1 for i in issues if i["level"] == "error")
        warns = sum(1 for i in issues if i["level"] == "warning")
        return (f"{res.get('cmd', [])[1:] if res.get('cmd') else ''} → "
                f"code={res.get('code')}, {errs} error, {warns} warning, "
                f"{res.get('duration_sec')}s")