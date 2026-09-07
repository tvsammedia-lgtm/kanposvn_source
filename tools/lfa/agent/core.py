"""core.py — vòng lặp Agent: context → Ollama → plan → (read) → patch → analyze/test → rollback."""
from __future__ import annotations

import json
import re
import time
from pathlib import Path

from . import ollama
from .tools.analyzer import Analyzer
from .tools.backups import BackupError, BackupManager
from .tools.ctx import Context, SafePathError
from .tools.netlock import NetworkBlocked, selftest
from .tools.patcher import ApplyError, Patcher

READ_ONLY_TOOLS = {"read_file", "list_dir", "read_git_diff", "run_analyzer"}
WRITE_TOOLS = {"apply_patch", "write_file", "run_test"}
SPECIAL_TOOLS = {"make_backup", "perform_rollback", "final_answer"}

_JSON_BLOCK_RE = re.compile(r"```(?:json)?\s*(\{.*?\})\s*```", re.DOTALL)


def extract_plan(content: str) -> tuple[dict | None, str]:
    """Tìm khối JSON plan trong reply của model. Trả (plan, raw_text)."""
    text = content.strip()
    m = _JSON_BLOCK_RE.search(text)
    candidates = [m.group(1)] if m else []
    if not candidates:
        start = text.find("{")
        end = text.rfind("}")
        if 0 <= start < end:
            candidates.append(text[start:end + 1])
    for cand in candidates:
        try:
            obj = json.loads(cand)
            if isinstance(obj, dict):
                return obj, text
        except Exception:
            continue
    return None, text


class Agent:
    def __init__(self, cfg: dict, sink: list | None = None):
        self.cfg = cfg
        self.sink = sink if sink is not None else []
        self.root = Path(cfg["repo_root"])
        self.ctx = Context(cfg)
        self.ana = Analyzer(cfg)
        self.patcher = Patcher(cfg)
        self.bk = BackupManager(cfg)
        self.client = ollama.OllamaClient(cfg["ollama_base"], cfg["model"])
        self.system_prompt = (Path(__file__).parent / "prompts" / "system.md").read_text(encoding="utf-8")

    # ----------------------------------------------------------- events
    def _emit(self, typ: str, **data) -> None:
        self.sink.append({"t": typ, "ts": time.time(), **data})

    # ----------------------------------------------------------- context
    def gather_context(self) -> str:
        parts = []
        parts.append(f"### Branch\n{self.ctx.git_branch()}")
        parts.append(f"### git status\n{self.ctx.git_status()}")
        diff = self.ctx.git_diff()
        if diff and diff != "(không có diff đang chờ)":
            parts.append(f"### git diff HEAD\n{diff}")
        parts.append("### Cây thư mục")
        tree = "\n".join(self.ctx.tree())
        max_tree = int(self.cfg["context"].get("tree_max_chars", 20000))
        if len(tree) > max_tree:
            tree = tree[:max_tree] + "\n... (đã cắt cây)"
        parts.append(tree)
        text = "\n\n".join(parts)
        cap = int(self.cfg["context"].get("max_chars", 120000))
        if len(text) > cap:
            text = text[:cap] + "\n... [ngữ cảnh bị cắt]"
        return text

    # ----------------------------------------------------------- tools
    def run_tool(self, name: str, args: dict, state: dict) -> dict:
        try:
            if name == "read_file":
                self._emit("tool", name=name, detail=f"read {args.get('path')}")
                return {"ok": True, "out": self.ctx.read_file(args.get("path", ""))}
            if name == "list_dir":
                self._emit("tool", name=name, detail=f"ls {args.get('path', '.')}")
                return {"ok": True, "out": "\n".join(self.ctx.tree(args.get("path"))[:500])}
            if name == "read_git_diff":
                self._emit("tool", name=name)
                return {"ok": True, "out": f"STATUS:\n{self.ctx.git_status()}\n\nDIFF:\n{self.ctx.git_diff()}"}
            if name == "run_analyzer":
                kind = args.get("kind", "dart")
                res = self.ana.dart_analyze() if kind in ("dart", "") else \
                    (self.ana.flutter_test() if kind == "test" else self.ana.flutter_analyze())
                self._emit("analyze", **clean(res))
                return {"ok": True, "out": res["output"][:8000]}
            if name == "make_backup":
                p = self.bk.make_backup(args.get("label", "manual") or "manual")
                state["active_point"] = p
                self._emit("backup", point=p["id"])
                return {"ok": True, "out": f"Backup tạo: {p['id']} (git={p.get('git_sha') or 'n/a'})"}
            if name == "perform_rollback":
                pid = args.get("id") or (state.get("active_point") or {}).get("id")
                if not pid:
                    raise BackupError("Thiếu restore-point id")
                self.bk.rollback(pid)
                self._emit("rollback", point=pid)
                return {"ok": True, "out": f"Đã rollback về {pid}"}
            if name in WRITE_TOOLS and not state.get("auto_fix"):
                raise ValueError("Tool sửa code bị cấm ở chế độ CHỈ XEM (auto_fix=false)")
            if name == "apply_patch":
                r = self.patcher.apply_patch(args.get("file", ""), args.get("patch", ""))
                state["edited"].append(r["file"])
                self._emit("patch", file=r["file"], hunks=r["hunks"])
                return {"ok": True, "out": f"Patched {r['file']} ({r['hunks']} hunk)"}
            if name == "write_file":
                r = self.patcher.write_file(args.get("file", ""), args.get("content", ""))
                state["edited"].append(r["file"])
                self._emit("patch", file=r["file"], mode="write", bytes=r["bytes"])
                return {"ok": True, "out": f"Ghi {r['file']} ({r['bytes']} bytes)"}
            if name == "run_test":
                paths = args.get("paths") or []
                res = self.ana.flutter_test(paths)
                self._emit("analyze", kind="test", **clean(res))
                return {"ok": True, "out": res["output"][:8000]}
            if name == "final_answer":
                return {"ok": True, "final": args.get("text", ""), "out": args.get("text", "")}
            return {"ok": False, "out": f"Tool không hợp lệ: {name}"}
        except (ApplyError, SafePathError, BackupError, NetworkBlocked, ValueError) as exc:
            self._emit("error", msg=str(exc))
            return {"ok": False, "out": f"LỖI: {exc}"}
        except Exception as exc:  # noqa: BLE001
            self._emit("error", msg=str(exc))
            return {"ok": False, "out": f"LỖI nội bộ: {exc}"}

    # ----------------------------------------------------------- loop
    def chat(self, prompt: str, auto_fix: bool = True, max_rounds: int = 2) -> dict:
        self._emit("log", msg="Bắt đầu — thu thập ngữ cảnh (chỉ local)...")
        context = self.gather_context()
        self._emit("log", msg=f"Ngữ cảnh sẵn sàng ({len(context)} ký tự)")

        state = {"edited": [], "active_point": None, "auto_fix": auto_fix}
        messages = ollama.build_messages(
            self.system_prompt,
            f"# YÊU CẦU\n{prompt}\n\n# NGỮ CẢNH HIỆN TẠI\n{context}\n"
            f"\nChế độ: {'TỰ SỬA + ROLLBACK' if auto_fix else 'CHỈ XEM PHÂN TÍCH'}\n"
            "Trả về JSON plan như hướng dẫn hệ thống.",
        )

        plan_summary, risk, plan = "", "low", []
        collected_reads: list[str] = []

        for rnd in range(1, max_rounds + 1):
            self._emit("llm", msg=f"→ Gọi Ollama {self.client.model} (vòng {rnd}/{max_rounds})...")
            try:
                content = self.client.chat(messages, {
                    "temperature": self.cfg["llm"]["temperature"],
                    "num_ctx": self.cfg["llm"]["num_ctx"],
                    "num_predict": self.cfg["llm"]["max_tokens"],
                }, timeout=int(self.cfg["llm"]["timeout_sec"]))
            except Exception as exc:
                self._emit("error", msg=f"Không gọi được Ollama: {exc}")
                return {"status": "error", "error": str(exc), "events": list(self.sink)}

            parsed, raw = extract_plan(content)
            if parsed is None:
                self._emit("llm", msg="Model trả reply văn bản (không có JSON plan).")
                return {"status": "llm_reply", "llm_reply": raw, "summary": raw[:500],
                        "events": list(self.sink)}

            plan_summary = parsed.get("summary") or ""
            risk = parsed.get("risk") or "low"
            plan = parsed.get("plan") or []
            self._emit("log", msg=f"Plan (risk={risk}): {plan_summary}")

            if not plan:
                return {"status": "llm_reply", "llm_reply": raw, "summary": plan_summary,
                        "events": list(self.sink)}

            # Triển khai; tách: nếu còn round sau thì chỉ đọc; patch để round cuối
            has_patch = any(p.get("tool") in WRITE_TOOLS for p in plan)
            need_backup = has_patch and state["auto_fix"] and state["active_point"] is None
            if need_backup:
                point = self.bk.make_backup("auto-fix " + (plan_summary[:60] or prompt[:60]))
                state["active_point"] = point
                self._emit("backup", point=point["id"], auto=True)

            results: list[dict] = []
            for step in plan:
                tname = step.get("tool")
                targs = step.get("args") or {}
                res = self.run_tool(tname, targs, state)
                results.append((tname, res))
                if res.get("ok") and not res.get("final"):
                    collectible = tname in READ_ONLY_TOOLS and has_patch and rnd < max_rounds
                    if collectible:
                        out = res.get("out") or ""
                        collected_reads.append(f"[{tname} {targs.get('path') or targs.get('file')}]\n{out[:4000]}")
                    if tname in WRITE_TOOLS:
                        self._emit("log", msg=f"→ đã sửa {targs.get('file')}")

            final = next((r["out"] for n, r in results if n == "final_answer" and r.get("final")), None)

            # Kết thúc nếu không cần vòng đọc-tiếp hoặc đã có patch
            if not has_patch and rnd >= max_rounds:
                return {
                    "status": "ok", "summary": final or plan_summary, "risk": risk,
                    "plan": plan, "events": list(self.sink),
                    "edited_files": state["edited"],
                    "llm_reply": final,
                }

            if collected_reads and has_patch and rnd < max_rounds:
                messages = messages[:2] + [
                    {"role": "user", "content":
                        "[KẾT QUẢ ĐỌC — dùng để ra quyết định patch]:\n" + "\n---\n".join(collected_reads[-6:]) +
                        "\nGiờ hãy trả về JSON plan CUỐI (chỉ gồm patch/write thực sự cần thiết + final_answer)."}
                ]
                continue  # -> vòng 2 ra patch

            if state["edited"]:
                return self._post_edit(state, plan, plan_summary, risk, auto_fix)

            return {"status": "ok", "summary": final or plan_summary, "risk": risk,
                    "plan": plan, "events": list(self.sink), "edited_files": state["edited"],
                    "llm_reply": final}

        return {"status": "error", "error": "Không đạt được kết thúc sau max_rounds"}

    # ----------------------------------------------------------- verify
    def _post_edit(self, state: dict, plan: list, summary: str, risk: str, auto_fix: bool) -> dict:
        results: dict[str, dict | None] = {"analyze": None, "test": None}
        failures: list[str] = []
        af = self.cfg["auto_fix"]

        if af["analyze_after_patch"]:
            self._emit("log", msg="▶ Chạy dart analyze...")
            res = self.ana.dart_analyze()
            results["analyze"] = clean(res)
            if not self.ana.analyze_clean(res):
                failures.append(f"analyze còn {self.ana.error_count(res)} error")

        if af["test_after_patch"] and state["edited"]:
            self._emit("log", msg="▶ Chạy flutter test...")
            res = self.ana.flutter_test()
            results["test"] = clean(res)
            if self.ana.test_had_regression(res):
                failures.append("test có hồi quy")

        if failures and auto_fix and af["rollback_on_fail"] and state.get("active_point"):
            pid = state["active_point"]["id"]
            self._emit("log", msg=f"✖ {'; '.join(failures)} → TỰ ROLLBACK {pid}")
            try:
                self.bk.rollback(pid)
            except BackupError as exc:
                self._emit("error", msg=f"Rollback lỗi: {exc}")
                return {"status": "error", "error": f"{'; '.join(failures)} + rollback lỗi: {exc}",
                        "plan": plan, "events": list(self.sink)}
            return {"status": "rolledback", "summary": summary, "risk": risk, "plan": plan,
                    "edited_files": state["edited"], "backup_point": state["active_point"],
                    "failures": failures, "analyze": results["analyze"], "test": results["test"],
                    "events": list(self.sink)}

        if failures:
            return {"status": "warn", "summary": summary, "risk": risk, "plan": plan,
                    "edited_files": state["edited"], "backup_point": state.get("active_point"),
                    "failures": failures, "analyze": results["analyze"], "test": results["test"],
                    "events": list(self.sink)}

        return {"status": "ok", "summary": summary, "risk": risk, "plan": plan,
                "edited_files": state["edited"], "backup_point": state.get("active_point"),
                "analyze": results["analyze"], "test": results["test"], "events": list(self.sink)}


def clean(res: dict) -> dict:
    """Bọc kết quả analyzer gọn hơn cho UI."""
    return {k: res.get(k) for k in ("cmd", "code", "issues", "duration_sec", "timed_out")}