# check_security.ps1 — kiem tra an toan LFA (rule firewall, bind loopback, outbound)
param(
    [switch]$Json
)
$ErrorActionPreference = "Continue"
$res = @()

# 1) Firewall rules LFA
$rules = @(Get-NetFirewallRule -DisplayName "LFA-*" -ErrorAction SilentlyContinue)
if ($rules.Count -ge 2) {
    $out = @($rules | Where-Object { $_.Direction -eq 'Outbound' -and $_.Action -eq 'Block' -and $_.Enabled })
    $inc = @($rules | Where-Object { $_.Direction -eq 'Inbound' -and $_.Action -eq 'Block' -and $_.Enabled })
    $res += [pscustomobject]@{ name="firewall-LFA-block-out"; ok = $out.Count -gt 0; detail ="$($out.Count) rule outbound" }
    $res += [pscustomobject]@{ name="firewall-LFA-block-in";  ok = $inc.Count -gt 0; detail ="$($inc.Count) rule inbound" }
} else {
    $res += [pscustomobject]@{ name="firewall-LFA"; ok=$false; detail="chua co rule - chay lockdown.ps1 (Admin)" }
}

# 2) Ollama bind 127.0.0.1
$ls = @(Get-NetTCPConnection -LocalPort 11434 -State Listen -ErrorAction SilentlyContinue | Select-Object -First 1)
$res += [pscustomobject]@{ name="ollama-loopback"; ok = ($ls -and ($ls.LocalAddress -eq '127.0.0.1' -or $ls.LocalAddress -eq '::1')); detail=(($ls | ForEach-Object { "$($_.LocalAddress):$($_.LocalPort)" }) -join ', ') }

# 3) Outbound ESTABLISHED tu tien trinh LFA (ollama / .venv)
$bad = @()
Get-NetTCPConnection -State Established -ErrorAction SilentlyContinue | ForEach-Object {
    $p = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    if ($p -and $p.Path -match 'ollama|\\\.venv\\') {
        if ($_.RemoteAddress -notmatch '^(127\.0\.0\.1|0\.0\.0\.0|\[::1\])') { $bad += "$($_.RemoteAddress):$($_.RemotePort) via $($p.ProcessName)" }
    }
}
$res += [pscustomobject]@{ name="no-outbound-lfa"; ok = $bad.Count -eq 0; detail = ($bad -join '; ') }

# 4) proxy env
$proxy = @($env:HTTP_PROXY, $env:HTTPS_PROXY, $env:ALL_PROXY) | Where-Object { $_ }
$res += [pscustomobject]@{ name="no-proxy-env"; ok = $proxy.Count -eq 0; detail = (($proxy -join ',') -or 'trong') }

if ($Json) {
    $res | ConvertTo-Json -Depth 3
} else {
    $fail = 0
    Write-Host "== LFA check_security ==" -ForegroundColor Cyan
    foreach ($r in $res) {
        $mark = if ($r.ok) { "PASS" } else { $fail++; "FAIL" }
        Write-Host ("{0,-22} {1,-5} {2}" -f $r.name, $mark, $r.detail) -ForegroundColor $(if ($r.ok) { "Green" } elseif ($r.ok -eq $null) { "Yellow" } else { "Red" })
    }
    exit $fail
}