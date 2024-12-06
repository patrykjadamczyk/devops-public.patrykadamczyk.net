#!/usr/bin/env pwsh
# Restart Session
function Global:Restart-Session {
    Get-Process -Id $PID | Select-Object -ExpandProperty Path | ForEach-Object { Invoke-Command { & "$_" } -NoNewScope }
}