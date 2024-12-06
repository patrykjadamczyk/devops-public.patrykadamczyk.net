#!/usr/bin/env pwsh
function Start-Timer(
    [Parameter(Position = 0, Mandatory = $true)]
    [int]$Seconds
) {
    if ($Seconds -eq 0 ) {
        [int]$Seconds = Read-Host "Enter number of seconds"
    }

    for ($i = $Seconds; $i -gt 0; $i--) {
	Clear-Host
	Write-Host "T-$i seconds"
	Start-Sleep -seconds 1
    }

    Clear-Host
    Write-Host "`a"
    Write-Host "✔️ $Seconds seconds countdown finished"
}
