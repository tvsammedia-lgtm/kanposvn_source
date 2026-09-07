# lockdown.ps1 — KHOA TOAN BO MANG cho LFA (chay voi quyen ADMIN)
# Chặn OUTBOUND/INBOUND theo tiến trình: ollama.exe, "ollama app.exe", python.exe LFA.
# Vẫn cho phép loopback nên Ollama/Agent/UI nói chuyện bình thường.
#Requires -RunAsAdministrator
$ErrorActionPreference = "Continue"

$LFA = $PSScriptRoot | Split-Path -Parent
$progs = @(
    "$env:LOCALAPPDATA\Programs\Ollama\ollama.exe"
    "$env:LOCALAPPDATA\Programs\Ollama\ollama app.exe"
    "$env:LOCALAPPDATA\Programs\Ollama\ollama_gpu.exe"
    (Join-Path $LFA ".venv\Scripts\python.exe")
    (Join-Path $LFA ".venv\Scripts\pythonw.exe")
)

Write-Host "== LFA LOCKDOWN ==" -ForegroundColor Cyan
foreach ($p in $progs) {
    if (-not (Test-Path $p)) { continue }
    $name = Split-Path $p -Leaf
    $out = new-netfirewallrule -DisplayName "LFA-Block-Out-$name" -Direction Outbound -Program $p -Action Block -Profile Any -ErrorAction SilentlyContinue
    $in  = new-netfirewallrule -DisplayName "LFA-Block-In-$name"  -Direction Inbound  -Program $p -Action Block -Profile Any -ErrorAction SilentlyContinue
    if (Get-NetFirewallRule -DisplayName "LFA-Block-Out-$name" -ErrorAction SilentlyContinue) {
        Write-Host "  OK block outbound: $name" -ForegroundColor Green
    } else {
        Write-Host "  LOI tao rule cho $name" -ForegroundColor Red
    }
}

# Bind loopback cho Ollama + xoa proxy (tranh hieu ung qua proxy ra ngoai)
[Environment]::SetEnvironmentVariable("OLLAMA_HOST", "127.0.0.1:11434", "User")
[Environment]::SetEnvironmentVariable("OLLAMA_HOST", "127.0.0.1:11434", "Machine")
Remove-Item Env:HTTP_PROXY, Env:HTTPS_PROXY, Env:ALL_PROXY, Env:http_proxy, Env:https_proxy, Env:all_proxy -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "== KHOA MANG XONG. XAC MINH: ==" -ForegroundColor Yellow
& "$PSScriptRoot\check_security.ps1"