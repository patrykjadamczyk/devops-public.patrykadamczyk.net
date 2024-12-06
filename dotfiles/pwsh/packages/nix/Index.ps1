#!/usr/bin/env pwsh
if ($_IsWindows) {
    return
}
foreach ($file in (Get-ChildItem $PSScriptRoot/*.ps1 -Exclude Index.ps1)) {
    . $file.FullName
}
