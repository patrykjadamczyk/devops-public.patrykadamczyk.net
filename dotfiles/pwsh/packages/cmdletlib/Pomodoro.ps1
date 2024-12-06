#!/usr/bin/env pwsh
function Start-Work(
    [Parameter(Position = 0, Mandatory = $false)]
    [string]$Time = "60m"
) {
    Start-GoTimerWithNotification $Time -n "Work"
    if ($LastExitCode -ne 0) {
        return
    }
    Write-Host "`a"
    Write-Host "✔️ Work session finished"
}
function Start-Rest(
    [Parameter(Position = 0, Mandatory = $false)]
    [string]$Time = "10m"
) {
    Start-GoTimerWithNotification $Time -n "Break"
    if ($LastExitCode -ne 0) {
        return
    }
    Write-Host "`a"
    Write-Host "✔️ Break session finished"
}
