# install.ps1 — Cài đặt Local Flutter AI Assistant
# Chạy 1 lần với quyền thường (bước pull model CẦN Internet lần duy nhất này).
# Sau khi xong BẮT BUỘC: chạy lockdown.ps1 (Admin) để khóa mạng.
$ErrorActionPreference = "Stop"
$LFA = $PSScriptRoot | Split-Path -Parent
Write-Host "== LFA install ==" -ForegroundColor Cyan
Write-Host "Thu muc: $LFA"

# 1) Ollama
if (-not (Get-Command ollama -ErrorAction SilentlyContinue)) {
    Write-Host "-> Cai Ollama (winget)..." -ForegroundColor Yellow
    winget install --id Ollama.Ollama -e --accept-source-agreements --accept-package-agreements
} else {
    Write-Host "-> Ollama da co" -ForegroundColor Green
}

# 2) Model Qwen3 8B Q4_K_M (~5.2GB) - CAN INTERNET LAN NAY
Write-Host "-> Pull qwen3:8b-q4_K_M (~5.2GB)..." -ForegroundColor Yellow
ollama pull qwen3:8b-q4_K_M
Write-Host "-> Tao model lfa-qwen3 tu Modelfile..." -ForegroundColor Yellow
ollama create lfa-qwen3 -f (Join-Path $LFA "config\Modelfile")

# 3) Python venv
if (-not (Test-Path (Join-Path $LFA ".venv"))) {
    Write-Host "-> Tao venv + cai deps..." -ForegroundColor Yellow
    python -m venv (Join-Path $LFA ".venv")
}
& (Join-Path $LFA ".venv\Scripts\python.exe") -m pip install --upgrade pip --quiet
& (Join-Path $LFA ".venv\Scripts\python.exe") -m pip install -r (Join-Path $LFA "requirements.txt")

Write-Host ""
Write-Host "== XONG. BUOC TIEP THEO (QUAN TRONG): ==" -ForegroundColor Yellow
Write-Host "1) MO PowerShell ADMIN roi chay:  $LFA\scripts\lockdown.ps1"
Write-Host "2) Chay app:                      $LFA\scripts\start.ps1"
Write-Host "3) Kiem tra an toan:              $LFA\scripts\check_security.ps1"