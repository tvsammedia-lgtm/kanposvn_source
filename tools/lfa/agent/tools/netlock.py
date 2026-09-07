"""netlock.py — LỚP CHẶN MẠNG của LFA.

Mọi HTTP request của Agent PHẢI đi qua safe_request(). Chỉ cho phép:
  - host loopback (127.0.0.1 / localhost / ::1)
  - cổng dịch vụ nội bộ đã khai báo (11434 Ollama, 8790 Web UI)

Bất kỳ URL nào khác -> NetworkBlocked. Đây là lớp phòng hộ ở mã nguồn;
tầng kernel (Windows Firewall) chặn OUTBOUND theo tiến trình được làm trong
scripts/lockdown.ps1.
"""
from __future__ import annotations

from urllib.parse import urlparse

import requests

LOOPBACK_HOSTS = {"127.0.0.1", "localhost", "::1"}
ALLOWED_PORTS = {None, 80, 443, 11434, 8790, 8000, 8080}  # có 443/80 chỉ cho localhost proxy nếu dùng


class NetworkBlocked(Exception):
    """URL nằm ngoài allowlist loopback."""

    def __init__(self, url: str):
        super().__init__(f"NetworkBlocked: '{url}' ngoài allowlist loopback")
        self.url = url


class LoopbackError(Exception):
    """Lỗi khi gọi dịch vụ loopback (Ollama/UI)."""


def is_allowed(url: str) -> bool:
    try:
        p = urlparse(url)
    except (ValueError, TypeError):
        return False
    if p.scheme not in ("http", "https"):
        return False
    host = (p.hostname or "").lower().strip("[]")
    if host not in LOOPBACK_HOSTS:
        return False                      # chặn cả 127.0.0.1.evil.com
    if p.port not in ALLOWED_PORTS:
        return False
    return True


def safe_request(url: str, *, method: str = "GET", json: dict | None = None,
                 headers: dict | None = None, timeout: int = 60,
                 stream: bool = False) -> requests.Response:
    """Gọi HTTP qua loopback; bất kỳ URL ngoài allowlist -> NetworkBlocked."""
    if not is_allowed(url):
        raise NetworkBlocked(url)
    try:
        resp = requests.request(method, url, json=json, headers=headers,
                                timeout=timeout, allow_redirects=False, stream=stream)
    except requests.exceptions.RequestException as exc:
        raise LoopbackError(f"Lỗi gọi loopback {url}: {exc}") from exc
    if resp.status_code >= 400:
        body = resp.text[:500]
        resp.close()
        raise LoopbackError(f"HTTP {resp.status_code} từ {url}: {body}")
    return resp


def check_is_allowed(url: str) -> bool:
    return is_allowed(url)


def selftest() -> list[dict]:
    """Kiểm tra nhanh logic netlock (dùng trong check_security + UI)."""
    results = [
        {"name": "allow-localhost-ollama", "ok": is_allowed("http://127.0.0.1:11434/api/tags"), "detail": "loopback:11434"},
        {"name": "allow-localhost-ui", "ok": is_allowed("http://127.0.0.1:8790"), "detail": "loopback:8790"},
        {"name": "block-public-ip", "ok": not is_allowed("http://8.8.8.8/"), "detail": "public IP"},
        {"name": "block-domain", "ok": not is_allowed("https://github.com/"), "detail": "public domain"},
        {"name": "block-host-suffix-trick", "ok": not is_allowed("http://127.0.0.1.evil.com/"), "detail": "host suffix"},
    ]
    return results