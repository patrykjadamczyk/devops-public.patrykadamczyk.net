#!/usr/bin/env pwsh
. "$PSScriptRoot\..\packages\cmdletlib\Test-Command.ps1"
if (Test-Command direnv) {
    Invoke-Expression "$(direnv hook pwsh)"
}
