"""ollama.py — client Ollama loopback duy nhất qua netlock.safe_request()."""
from __future__ import annotations

import time

from .tools.netlock import LoopbackError, safe_request


class OllamaClient:
    def __init__(self, base: str, model: str):
        self.base = base.rstrip("/")
        self.model = model

    # ---------------------------------------------------------------- status
    def available(self) -> bool:
        try:
            res = safe_request(f"{self.base}/api/tags", timeout=5)
            return res.status_code == 200
        except Exception:
            return False

    def model_loaded(self) -> bool:
        try:
            res = safe_request(f"{self.base}/api/ps", timeout=5)
            models = (res.json() or {}).get("models", [])
            return any(m.get("name", "").startswith(self.model) for m in models)
        except Exception:
            return False

    def tags(self) -> list[dict]:
        try:
            res = safe_request(f"{self.base}/api/tags", timeout=5)
            return (res.json() or {}).get("models", [])
        except Exception:
            return []

    # ---------------------------------------------------------------- chat
    def chat(self, messages: list[dict], options: dict, timeout: int = 900) -> str:
        body = {
            "model": self.model,
            "messages": messages,
            "stream": False,
            "options": options,
        }
        started = time.time()
        res = safe_request(f"{self.base}/api/chat", method="POST", json=body, timeout=timeout)
        payload = res.json() or {}
        elapsed = round(time.time() - started, 1)
        content = (payload.get("message") or {}).get("content") or ""
        if not content:
            raise LoopbackError(f"Ollama trả về trống (model={self.model}, {elapsed}s)")
        return content


def build_messages(system_prompt: str, user_prompt: str) -> list[dict]:
    return [
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": user_prompt},
    ]