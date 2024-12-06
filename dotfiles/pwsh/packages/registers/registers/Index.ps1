#!/usr/bin/env pwsh
. "$PSScriptRoot\..\..\cmdletlib\Get-OS.ps1"
$local:os = Get-OS
foreach ($file in (Get-ChildItem $PSScriptRoot/$os/*.ps1)) {
    . $file.FullName
}
