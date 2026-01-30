#!/usr/bin/env pwsh

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$packageFile = Join-Path $scriptDir 'winget.list'

if (-not (Test-Path $packageFile)) {
    Write-Error "Package list not found: $packageFile"
    exit 1
}

$packages = Get-Content -Path $packageFile | ForEach-Object {
    $line = $_.Trim()
    if (-not $line) { return }
    $line = ($line -split '#', 2)[0].Trim()
    if ($line) { $line }
}

if (-not $packages) {
    Write-Warning "No packages found in $packageFile"
    exit 0
}

$ambiguousPackages = @()
$failedPackages = @()

foreach ($package in $packages) {
    Write-Host "Installing $package"
    $result = & winget install --id $package --accept-source-agreements --accept-package-agreements -e 2>&1
    $exitCode = $LASTEXITCODE
    if ($exitCode -ne 0) {
        if ($result -match '(?i)ambiguous') {
            $ambiguousPackages += $package
        }
        else {
            $failedPackages += $package
        }
        Write-Warning "Failed to install $package; exit code $exitCode."
    }
}

if ($failedPackages.Count -or $ambiguousPackages.Count) {
    Write-Host ''
    Write-Host 'Installation summary:'
    if ($failedPackages.Count) {
        Write-Host '  Failed packages:'
        $failedPackages | ForEach-Object { Write-Host "    $_" }
    }
    if ($ambiguousPackages.Count) {
        Write-Host '  Ambiguous packages:'
        $ambiguousPackages | ForEach-Object { Write-Host "    $_" }
    }
}
