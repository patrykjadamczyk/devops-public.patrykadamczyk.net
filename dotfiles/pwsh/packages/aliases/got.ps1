#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
function Global:TranslateUI (
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline)]
    [string]$Text,
    [Parameter(Mandatory=$false, Position=1)]
    [string]$SourceLanguage = "en",
    [Parameter(Mandatory=$false, Position=2)]
    [string]$TargetLanguage = "pl",
    [Parameter(Mandatory=$false, Position=3)]
    [switch]$Interactive = $false
) {
    if (!(Test-Command got)) {
        if (Test-Command go) {
            go install github.com/fedeztk/got/cmd/got@latest
        } else {
            Write-Host -ForegroundColor Red "got command is not found and golang is not found"
        }
    }
    if ($Interactive) {
        return got -s $SourceLanguage -t $TargetLanguage $Text
    }
    return got -o -s $SourceLanguage -t $TargetLanguage $Text
}
function Global:Translate-InteractiveUI (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (!(Test-Command got)) {
        if (Test-Command go) {
            go install github.com/fedeztk/got/cmd/got@latest
        } else {
            Write-Host -ForegroundColor Red "got command is not found and golang is not found"
        }
    }
    if ($InputObject) {
        return $InputObject | got $AdditionalArgs
    }
    return got $AdditionalArgs
}
