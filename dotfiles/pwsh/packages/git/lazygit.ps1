#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
function Global:lg (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (!(Test-Command lazygit)) {
        if (Test-Command go) {
            go install github.com/jesseduffield/lazygit@latest
        } else {
            Write-Host -ForegroundColor Red "lazygit command is not found and golang is not found"
        }
    }
    if ($InputObject) {
        return $InputObject | lazygit $AdditionalArgs
    }
    return lazygit $AdditionalArgs
}
