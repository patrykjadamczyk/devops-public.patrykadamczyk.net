#!/usr/bin/env pwsh
. "$PSScriptRoot\Test-IsWindows.ps1"
function Global:Get-ExeInformation(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$Path
) {
    if ($Path -eq "") {
        Write-Error "Specify correct path to executable file"
    }
    if (-not (Test-IsWindows)) {
        Write-Warning "Warning! This function is giving empty object for non Windows OS"
    }

    return Get-ChildItem $Path | Foreach-Object { $_.VersionInfo } | Select-Object *
}
