#!/usr/bin/env pwsh
# Based on https://github.com/fleschutz/PowerShell/blob/2077f676cf91687f70e6168af5bd57486a3a4e5d/scripts/hibernate.ps1
. "$PSScriptRoot\Test-IsWindows.ps1"
. "$PSScriptRoot\Test-IsLinux.ps1"
. "$PSScriptRoot\Test-IsMacOS.ps1"
function Global:Start-Hibernation {
    if (Test-IsWindows) {
        try {
            [system.threading.thread]::currentThread.currentCulture = [system.globalization.cultureInfo]"en-US"
            Write-Host "Hibernating computer..."
            Start-Sleep -milliseconds 500
            & rundll32.exe powrprof.dll,SetSuspendState 1,1,0 # bHibernate,bForce,bWakeupEventsDisabled
            exit 0 # success
        } catch {
            "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
            exit 1
        }
    } elseif (Test-IsLinux) {
        Write-Host "Hibernating computer..."
        Start-Sleep -milliseconds 500
        sudo pm-hibernate
    } elseif (Test-IsMacOS) {
        Write-Host "Hibernating computer..."
        Start-Sleep -milliseconds 500
        pmset sleepnow
    } else {
        Write-Error "⚠️ Unsupported OS"
    }
}
