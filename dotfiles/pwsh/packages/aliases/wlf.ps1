#!/usr/bin/env pwsh
# Watch Log File (bash: tail -n 10 -f $LogFile)
function Global:wlf (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $LogFile
) {
    Get-Content -Tail 10 -Wait $LogFile
}
function Global:Watch-LogFile (
    [Parameter(Mandatory=$true, Position=0)]
    [String] $LogFile
) {
    wlf -LogFile $LogFile
}
