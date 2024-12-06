#!/usr/bin/env nu

def --env "Start-Hibernation" [] {
    if ($_IsWindows) {
        print "Hibernating computer..."
        sleep 500ms
        pwsh -NoProfile -Command '[system.threading.thread]::currentThread.currentCulture = [system.globalization.cultureInfo]"en-US";& rundll32.exe powrprof.dll,SetSuspendState 1,1,0'
        # bHibernate,bForce,bWakeupEventsDisabled
        return
    }

    if ($_IsLinux) {
        print "Hibernating computer..."
        sleep 500ms
        ^sudo pm-hibernate
        return
    }

    if ($_IsMacOS) {
        print "Hibernating computer..."
        sleep 500ms
        ^pmset sleepnow
        return
    }

    print $"(ansi red)⚠️ Unsupported OS(ansi reset)"
}
