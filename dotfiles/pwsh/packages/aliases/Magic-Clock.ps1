#!/usr/bin/env pwsh
function Global:Magic-Clock(
    [Parameter(Position = 0, Mandatory = $false)]
    [int] $Skip = 0,
    [Parameter(Position = 1, Mandatory = $false)]
    [string] $SkipTime = ""
) {
    if ($Skip -le 1) {
        Start-GoTimerWithNotification -n "Day Phase W: Consider waking up fully and chilling" ($SkipTime -eq "" ? "2h" : $SkipTime)
        Clear-Host
    }
    if ($Skip -le 2) {
        Start-GoTimerWithNotification -n "Day Phase A: Consider working" ($SkipTime -eq "" ? "3h" : $SkipTime)
        Clear-Host
    }
    if ($Skip -le 3) {
        Start-GoTimerWithNotification -n "Day Phase B: Consider working" ($SkipTime -eq "" ? "3h" : $SkipTime)
        Clear-Host
    }
    if ($Skip -le 4) {
        Start-GoTimerWithNotification -n "Day Phase C: Consider chilling" ($SkipTime -eq "" ? "3h" : $SkipTime)
        Clear-Host
    }
    if ($Skip -le 5) {
        Start-GoTimerWithNotification -n "Day Phase D: Consider chilling" ($SkipTime -eq "" ? "3h" : $SkipTime)
        Clear-Host
    }
    if ($Skip -le 6) {
        Start-GoTimerWithNotification -n "Day Phase E: Consider chilling and planning" ($SkipTime -eq "" ? "3h" : $SkipTime)
        Clear-Host
    }
    Start-GoTimerWithNotification -n "Day Phase F: Consider chilling and sleeping" ($SkipTime -eq "" ? "10h" : $SkipTime)
}
