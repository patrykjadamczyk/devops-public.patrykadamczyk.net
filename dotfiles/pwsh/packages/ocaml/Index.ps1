#!/usr/bin/env pwsh
return
$OpamEnvPath = Join-Path $PSScriptRoot "opam.ps1"
if (-not (Test-Path $OpamEnvPath)) {
    try {
        opam env > $OpamEnvPath
    }
    catch {}
}
foreach ($file in (Get-ChildItem $PSScriptRoot/*.ps1 -Exclude Index.ps1)) {
    . $file.FullName
}
