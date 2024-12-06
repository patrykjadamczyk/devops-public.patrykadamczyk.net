# Cross Platform Get-Disk

## Why
PowerShell Core is very weird in some places. Cmdlet `Get-Disk` is perfect example of that. This cmdlet from the function should be completely cross-platform. Though it isn't. This cmdlet on Windows is built completely around Windows Management Instrumentation (WMI). And it is not exactly part of PowerShell Core itself, rather part of Windows PowerShell Cmdlets that are available in PowerShell Core. This cmdlet because of that is not existent in any platform other than Windows.

So this code below is a pretty good alternative which instead of WMI uses just .NET Framework to function. Why PowerShell Core Team would not just try to make this cmdlet in there: I have no clue. If it took me like 5 minutes to find this. This means that it could be done there in no long time either. Making it completely work Get-Disk (fields and stuff) would be harder but still doable, I think.

## Code
```Console
#!/bin/env pwsh

function Get-Disk {
    return [System.IO.DriveInfo]::getdrives()
}
```