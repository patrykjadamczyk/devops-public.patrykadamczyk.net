#!/usr/bin/env pwsh -NoProfile
Write-Host "Installing Profiler"
try {
    Import-Module PSProfiler -ErrorAction Stop
} catch {
    try {
        Install-Module -Name PSProfiler -Repository PSGallery -ErrorAction Stop
    } catch {
        Install-PSResource -Name PSProfiler
    }
}
Write-Host "Importing Profiler"
Import-Module PSProfiler
Write-Host "Profiling Index.ps1 Directly"
Measure-Script $PSScriptRoot\Index.ps1
Write-Host "Profiling Profile Directly"
. "$PSScriptRoot\Measure-Index.ps1"
