#!/usr/bin/env pwsh
. "$PSScriptRoot\..\cmdletlib\Test-Command.ps1"
function Global:Get-Clock-ByTimezones (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $Timezone
) {
    if (!(Test-Command tz)) {
        if (Test-Command go) {
            go install github.com/oz/tz@latest
        } else {
            Write-Host -ForegroundColor Red "tz command is not found and golang is not found"
        }
    }
    return tz $Timezone
}
function Global:Get-Clock-ByTimezonesInteractively {
    if (!(Test-Command tz)) {
        if (Test-Command go) {
            go install github.com/oz/tz@latest
        } else {
            Write-Host -ForegroundColor Red "tz command is not found and golang is not found"
        }
    }
    $selectedTimezone = tz --list | Invoke-Fzf
    if ([string]::IsNullOrWhiteSpace($selectedTimezone)) {
        Write-Host -ForegroundColor Red "No timezone specified"
        return
    }
    $tSelectedTimezone = $selectedTimezone.Split(" :: ")
    if ($tSelectedTimezone.Length -ne 2) {
        Write-Host -ForegroundColor Red "Invalid timezone"
        return
    }
    $selectedTimezone = $tSelectedTimezone[1]
    return Get-Clock-ByTimezones -Timezone $selectedTimezone
}
