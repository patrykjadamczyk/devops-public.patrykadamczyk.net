#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
if (Test-Command zeit) {
    Invoke-Expression -Command (zeit completion powershell | Out-String)
}
