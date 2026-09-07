"""main.py — LFA Web UI + API trên 127.0.0.1 (FastAPI). Không bao giờ bind 0.0.0.0."""
from __future__ import annotations

import os
import subprocess
import threading
import time
import uuid
from pathlib import Path

from fastapi import FastAPI
from fastapi.responses import FileResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel

from . import ollama
from .config import load_config
from .core import Agent
from .tools.analyzer import Analyzer
from .tools.backups import BackupError, BackupManager
from .tools.ctx import Context
from .tools.netlock import selftest

CFG = load_config()
LFA_ROOT = Path(CFG["_lfa_root"])
STATIC_DIR = LFA_ROOT / "ui" / "static"

app = FastAPI(title="Local Flutter AI Assistant", version="0.1.0")

app.mount("/assets", StaticFiles(directory=str(STATIC_DIR)), name="assets")

_JOBS: dict[str, dict] = {}
_LOCK = threading.Lock()


# ------------------------------------------------------------------- models
class ChatIn(BaseModel):
    prompt: str
    auto_fix: bool = True
    review_only: bool = False


class AnalyzeIn(BaseModel):
    kind: str = "dart"       # dart | flutter | test
    scope: str = "lib test"
    paths: list[str] = []


class BackupIn(BaseModel):
    label: str = "manual"


class RollbackIn(BaseModel):
    point_id: str


# ------------------------------------------------------------------- pages
@app.get("/", include_in_schema=False)
def index():
    return FileResponse(STATIC_DIR / "index.html")


@app.post("/api/lockdown")
def trigger_lockdown():
    """Mở lockdown.ps1 với UAC elevation (người dùng xác nhận) — thao tác firewall."""
    ps = f'''
    $ps1 = "{LFA_ROOT / "scripts" / "lockdown.ps1"}"
    if (Test-Path $ps1) {{ Start-Process powershell -Verb RunAs -Wait -ArgumentList "-NoProfile","-ExecutionPolicy","Bypass","-File",$ps1 }}
    else {{ Write-Output "khong tim thay $ps1" }}
    '''
    try:
        subprocess.run(["powershell", "-NoProfile", "-Command", ps], check=False, timeout=60)
    except Exception as exc:  # noqa: BLE001
        return JSONResponse({"error": str(exc)}, status_code=500)
    return {"ok": True}


# ------------------------------------------------------------------- chat (job + poll)
@app.post("/api/chat")
def start_chat(body: ChatIn):
    job_id = uuid.uuid4().hex[:12]
    with _LOCK:
        _JOBS[job_id] = {"status": "running", "events": [], "result": None,
                         "started": time.time()}

    def worker():
        sink: list = _JOBS[job_id]["events"]
        try:
            agent = Agent(CFG, sink=sink)
            res = agent.chat(body.prompt, auto_fix=body.auto_fix and not body.review_only)
            with _LOCK:
                _JOBS[job_id]["result"] = res
                _JOBS[job_id]["status"] = "done"
        except Exception as exc:  # noqa: BLE001
            with _LOCK:
                _JOBS[job_id]["status"] = "error"
                _JOBS[job_id]["result"] = {"status": "error", "error": str(exc)}

    threading.Thread(target=worker, daemon=True).start()
    return {"job_id": job_id}


@app.get("/api/chat/{job_id}")
def get_chat(job_id: str):
    with _LOCK:
        job = _JOBS.get(job_id)
    if job is None:
        return JSONResponse({"error": "job không tồn tại"}, status_code=404)
    return {"id": job_id, "status": job["status"],
            "events": job["events"], "result": job["result"]}


@app.delete("/api/chat/{job_id}")
def drop_chat(job_id: str):
    with _LOCK:
        _JOBS.pop(job_id, None)
    return {"ok": True}


# ------------------------------------------------------------------- health
@app.get("/api/ollama")
def ollama_status():
    client = ollama.OllamaClient(CFG["ollama_base"], CFG["model"])
    tags = [t.get("name") for t in client.tags()]
    return {
        "ok": client.available(),
        "model": CFG["model"],
        "model_available": any(t.startswith(CFG["model"].split(":")[0]) for t in tags),
        "model_loaded": client.model_loaded(),
        "tags": tags[:20],
        "base": CFG["ollama_base"],
    }


@app.get("/api/git")
def git_status():
    ctx = Context(CFG)
    return {"branch": ctx.git_branch(), "status": ctx.git_status()}


# ------------------------------------------------------------------- analyzer
@app.post("/api/analyze")
def run_analyze(body: AnalyzeIn):
    ana = Analyzer(CFG)
    if body.kind == "flutter":
        res = ana.flutter_analyze()
    elif body.kind == "test":
        res = ana.flutter_test(body.paths or None)
    else:
        res = ana.dart_analyze(body.scope)
    return {
        "cmd": res["cmd"], "code": res["code"], "issues": res["issues"],
        "duration_sec": res["duration_sec"], "output": res["output"][:20000],
        "timed_out": res["timed_out"],
    }


# ------------------------------------------------------------------- backups
@app.get("/api/backups")
def list_backups():
    bk = BackupManager(CFG)
    return {"points": bk.list_points()}


@app.post("/api/backups")
def make_backup(body: BackupIn):
    bk = BackupManager(CFG)
    try:
        return {"point": bk.make_backup(body.label)}
    except Exception as exc:  # noqa: BLE001
        return JSONResponse({"error": str(exc)}, status_code=500)


@app.post("/api/backups/rollback")
def do_rollback(body: RollbackIn):
    bk = BackupManager(CFG)
    try:
        return {"result": bk.rollback(body.point_id)}
    except BackupError as exc:
        return JSONResponse({"error": str(exc)}, status_code=400)
    except Exception as exc:  # noqa: BLE001
        return JSONResponse({"error": str(exc)}, status_code=500)


# ------------------------------------------------------------------- security
@app.get("/api/security")
def security():
    checks = selftest()

    # proxy env
    proxies = [k for k in ("HTTP_PROXY", "HTTPS_PROXY", "ALL_PROXY", "http_proxy", "https_proxy", "all_proxy")
               if os.environ.get(k)]
    checks.append({"name": "no-proxy-env", "ok": not proxies, "detail": ", ".join(proxies) or "trống"})

    # bind loopback (netstat)
    listen_lines = _netstat_listen()
    for port in (11434, 8790):
        lines = [ln for ln in listen_lines if f":{port} " in ln]
        non_loop = [ln for ln in lines if "127.0.0.1:" not in ln and "[" not in ln]
        checks.append({"name": f"loopback-bind:{port}", "ok": len(non_loop) == 0,
                       "detail": "; ".join(l.strip() for l in lines[:2]) or "không nghe"})

    # firewall rules
    if _has_admin():
        rules = _firewall_rules()
        checks.append({"name": "firewall-LFA-block-out", "ok": rules.get("out", 0) > 0,
                       "detail": f"{rules.get('out', 0)} rule outbound block LFA"})
        checks.append({"name": "firewall-LFA-block-in", "ok": rules.get("in", 0) > 0,
                       "detail": f"{rules.get('in', 0)} rule inbound block LFA"})
    else:
        checks.append({"name": "firewall-LFA", "ok": None, "detail": "chạy lockdown.ps1 (Admin) để kích hoạt"})

    return {"checks": checks, "repo_root": CFG["repo_root"], "model": CFG["model"]}


def _netstat_listen() -> list[str]:
    try:
        out = subprocess.run(["netstat", "-ano"], capture_output=True, text=True, timeout=10)
        return [ln for ln in out.stdout.splitlines() if "LISTENING" in ln]
    except Exception:
        return []


def _has_admin() -> bool:
    try:
        return subprocess.run(["net", "session"], capture_output=True, timeout=5).returncode == 0
    except Exception:
        return False


def _firewall_rules() -> dict:
    ps = r"""
    $out = 0; $inc = 0
    Get-NetFirewallRule -DisplayName 'LFA-*' -ErrorAction SilentlyContinue | ForEach-Object {
        if ($_.Direction -eq 'Outbound' -and $_.Action -eq 'Block' -and $_.Enabled) { $out++ }
        elseif ($_.Direction -eq 'Inbound' -and $_.Action -eq 'Block' -and $_.Enabled) { $inc++ }
    }
    Write-Output "$out|$inc"
    """
    try:
        res = subprocess.run(["powershell", "-NoProfile", "-Command", ps],
                             capture_output=True, text=True, timeout=20)
        o, i = (res.stdout or "").strip().split("|")
        return {"out": int(o), "in": int(i)}
    except Exception:
        return {"out": -1, "in": -1}


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host=CFG["ui_host"], port=CFG["ui_port"], log_level="info")