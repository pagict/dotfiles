#!/usr/bin/env pwsh
$ErrorActionPreference = 'Stop'
$asset = 'DevConverter-PowerToysRun-x64.zip'
$url = "https://github.com/pagict/DevConverter/releases/latest/download/$asset"

$temp = Join-Path ([IO.Path]::GetTempPath()) ('devconverter-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $temp | Out-Null
try {
    $archive = Join-Path $temp $asset
    Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $archive
    Expand-Archive -LiteralPath $archive -DestinationPath $temp -Force
    $source = Join-Path $temp 'DevConverter'
    if (-not (Test-Path (Join-Path $source 'plugin.json'))) {
        throw 'DevConverter plugin missing from release archive.'
    }

    $pluginRoot = Join-Path $env:LOCALAPPDATA 'Microsoft\PowerToys\PowerToys Run\Plugins'
    $target = Join-Path $pluginRoot 'DevConverter'
    Get-Process | Where-Object ProcessName -Like 'PowerToys*' | Stop-Process -Force
    New-Item -ItemType Directory -Path $pluginRoot -Force | Out-Null
    if (Test-Path $target) { Remove-Item -LiteralPath $target -Recurse -Force }
    Copy-Item -LiteralPath $source -Destination $target -Recurse

    $powerToys = Join-Path $env:LOCALAPPDATA 'PowerToys\PowerToys.exe'
    if (Test-Path $powerToys) { Start-Process -FilePath $powerToys }
    Write-Host "Latest DevConverter release installed to $target"
}
finally {
    if (Test-Path $temp) { Remove-Item -LiteralPath $temp -Recurse -Force }
}
