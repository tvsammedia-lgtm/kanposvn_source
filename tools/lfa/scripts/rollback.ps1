# rollback.ps1 — khoi phuc repo ve restore-point da tao
param(
    [Parameter(Mandatory = $true)][string]$Id
)
$ErrorActionPreference = "Stop"
$LFA = $PSScriptRoot | Split-Path -Parent
$py = Join-Path $LFA ".venv\Scripts\python.exe"
if (-not (Test-Path $py)) { $py = "python" }

Write-Host "== LFA ROLLBACK: $Id ==" -ForegroundColor Cyan
& $py -m agent.cli rollback --id $Id
if ($LASTEXITCODE -eq 0) {
    Write-Host "XONG. Kiem tra lai: & $PSScriptRoot\..\scripts\..\..\agent\cli.py status" -ForegroundColor Green
    & $py -m agent.cli status
} else {
    Write-Host "ROLLBACK that bai" -ForegroundColor Red
    exit 1
}
Write-Host "Chay lai agent:  $PSScriptRoot\start.ps1"