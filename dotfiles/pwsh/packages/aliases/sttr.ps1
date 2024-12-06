#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
function Global:Start-StringUtility (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (!(Test-Command sttr)) {
        if (Test-Command go) {
            go install github.com/abhimanyu003/sttr@latest
        } else {
            Write-Host -ForegroundColor Red "sttr command is not found and golang is not found"
        }
    }
    if ($InputObject) {
        return $InputObject | sttr $AdditionalArgs
    }
    return sttr $AdditionalArgs
}
