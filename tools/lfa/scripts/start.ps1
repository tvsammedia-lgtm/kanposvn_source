# start.ps1 — chay LFA: Ollama + Agent/UI tren 127.0.0.1:8790
$ErrorActionPreference = "Continue"
$LFA = $PSScriptRoot | Split-Path -Parent
$py = Join-Path $LFA ".venv\Scripts\python.exe"
if (-not (Test-Path $py)) { $py = "python" }

# Ollama bind loopback
if (-not $env:OLLAMA_HOST) { $env:OLLAMA_HOST = "127.0.0.1:11434" }

# Dam bao Ollama dang chay
$oll = Get-Process -Name "ollama app","ollama" -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $oll) {
    Start-Process "$env:LOCALAPPDATA\Programs\Ollama\ollama app.exe" -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
}

Write-Host "== LFA start ==" -ForegroundColor Cyan
Write-Host "UI:  http://$env:OLLAMA_HOST -> http://127.0.0.1:8790"
try {
    & $py -m agent.main
} catch {
    Write-Host "Loi chay agent: $_" -ForegroundColor Red
    Read-Host "Nhan Enter de dong"
}