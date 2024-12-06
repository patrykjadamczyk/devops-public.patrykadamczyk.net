#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
function Global:Start-GoTimer (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (!(Test-Command timer)) {
        if (Test-Command go) {
            go install github.com/caarlos0/timer@latest
        } else {
            Write-Host -ForegroundColor Red "timer command is not found and golang is not found"
        }
    }
    if ($InputObject) {
        return $InputObject | timer --format 24h $AdditionalArgs
    }
    return timer --format 24h $AdditionalArgs
}

function Global:Start-GoTimerWithAlarm (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter()]
    [int]$AlarmRepeat = 20,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (!(Test-Command timer)) {
        if (Test-Command go) {
            go install github.com/caarlos0/timer@latest
        } else {
            Write-Host -ForegroundColor Red "timer command is not found and golang is not found"
        }
    }
    if ($InputObject) {
        $InputObject | timer --format 24h $AdditionalArgs
    } else {
        timer --format 24h $AdditionalArgs
    }
    for ($i = 0; $i -le $AlarmRepeat; $i++) {
        Write-Host "`a" -NoNewline
        Start-Sleep 1
    }
}

function Global:Start-GoTimerWithNotification (
    [Parameter(Position=0,ValueFromRemainingArguments)]
    [string[]]$AdditionalArgs,
    [Parameter(ValueFromPipeline)]
    [string]$InputObject
) {
    if (!(Test-Command timer)) {
        if (Test-Command go) {
            go install github.com/caarlos0/timer@latest
        } else {
            Write-Host -ForegroundColor Red "timer command is not found and golang is not found"
        }
    }
    if ($InputObject) {
        $InputObject | timer --format 24h $AdditionalArgs
    } else {
        timer --format 24h $AdditionalArgs
    }
    if ($LastExitCode -eq 0) {
        Invoke-OSC-Notification "Go Timer" "Timer run out. Timer from command ``timer $AdditionalArgs`` finished."
    }
}
