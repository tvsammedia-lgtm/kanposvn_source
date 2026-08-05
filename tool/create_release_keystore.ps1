# tool/create_release_keystore.ps1
# Generates a release keystore for signing the kanposvn Android APK.
#
# Steps:
#   1. Run this script (PowerShell):  ./tool/create_release_keystore.ps1
#   2. It creates:
#        - android/app/upload-keystore.jks   (the keystore - KEEP SECURE)
#        - android/key.properties            (local signing config - gitignored)
#   3. Copy the printed BASE64 value and passwords into GitHub Secrets:
#        - KEYSTORE_BASE64   -> base64 of upload-keystore.jks (printed below)
#        - KEYSTORE_PASSWORD -> the keystore password you enter
#        - KEY_ALIAS         -> the alias you enter (default: kanposvn)
#        - KEY_PASSWORD      -> the key password (default: same as keystore password)
#   4. Commit & push; GitHub Actions will build and sign the release APK.
#
# NOTE: Re-running this script will OVERWRITE android/app/upload-keystore.jks.
#       If you already shipped an app with an existing keystore, do NOT regenerate
#       it or you will lose the ability to update that app on the Play Store.

param(
    [string]$Alias = "kanposvn",
    [int]$ValidityDays = 10000
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$appDir = Join-Path $root "android\app"
$keystoreFile = Join-Path $appDir "upload-keystore.jks"
$keyPropsFile = Join-Path $root "android\key.properties"

$keytool = "C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe"
if (-not (Test-Path $keytool)) {
    $cmd = Get-Command keytool -ErrorAction SilentlyContinue
    if ($cmd) { $keytool = $cmd.Source }
    else { throw "keytool not found. Install JDK or set -KeytoolPath." }
}

Write-Host "Keytool: $keytool"

$storePass = Read-Host "Keystore password (min 6 chars)"
if ($storePass.Length -lt 6) { throw "Keystore password too short." }
$keyPass = Read-Host "Key password (leave empty = same as keystore password)"
if ([string]::IsNullOrWhiteSpace($keyPass)) { $keyPass = $storePass }
$displayName = Read-Host "Your name / org (for keystore DN) [KanPosVN]"
if ([string]::IsNullOrWhiteSpace($displayName)) { $displayName = "KanPosVN" }

& $keytool -genkeypair -v `
    -keystore $keystoreFile `
    -alias $Alias `
    -keyalg RSA -keysize 2048 `
    -validity $ValidityDays `
    -storepass $storePass `
    -keypass $keyPass `
    -dname "CN=$displayName, OU=KanPosVN, O=$displayName, L=Hanoi, ST=Hanoi, C=VN"

if ($LASTEXITCODE -ne 0) { throw "keytool failed with exit code $LASTEXITCODE" }

@"
storePassword=$storePass
keyPassword=$keyPass
keyAlias=$Alias
storeFile=upload-keystore.jks
"@ | Set-Content -Path $keyPropsFile -Encoding Ascii

$base64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($keystoreFile))

Write-Host ""
Write-Host "===== ADD THESE TO GITHUB REPO SETTINGS > SECRETS AND VARIABLES > ACTIONS ====="
Write-Host "KEYSTORE_BASE64   = $base64"
Write-Host "KEYSTORE_PASSWORD = $storePass"
Write-Host "KEY_ALIAS         = $Alias"
Write-Host "KEY_PASSWORD      = $keyPass"
Write-Host ""
Write-Host "Local config written to android\key.properties (gitignored)."
