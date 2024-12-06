#!/usr/bin/env nu

def --env "Start-Work" [$Time: string = "60m"] {
    Start-GoTimerWithNotification $Time -n "Work"
    print "✔️ Work session finished"
}

def --env "Start-Rest" [$Time: string = "10m"] {
    Start-GoTimerWithNotification $Time -n "Break"
    print "✔️ Break session finished"
}
