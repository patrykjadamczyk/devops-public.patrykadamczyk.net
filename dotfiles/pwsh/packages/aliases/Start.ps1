#!/usr/bin/env pwsh

# Start a process in the background without hanging the terminal
function global:Start-NoHangProcess {
    if ($_IsWindows) {
        cmd /c start /B "$args" &
    } else {
        sh -c "nohup $args >/dev/null 2>&1 &"
    }
}
