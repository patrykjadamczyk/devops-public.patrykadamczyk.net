#!/usr/bin/env pwsh
foreach ($file in (Get-ChildItem $PSScriptRoot/*.ps1 -Exclude Index.ps1)) {
    . $file.FullName
}