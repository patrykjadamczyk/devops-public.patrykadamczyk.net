#!/usr/bin/env nu

alias "Start-GoTimer" = timer --format 24h

def --env --wrapped "Start-GoTimerWithAlarm" [
    $AlarmRepeat: int = 20,
    ...$args
] {
    if (which timer | is-empty) {
        if (which go | is-not-empty) {
            go install github.com/caarlos0/timer@latest
        } else {
            print $"(ansi red)sttr command not found and golang not found(ansi reset)"
        }
    }
    $in | timer --format 24h ...$args
    seq 0 $AlarmRepeat | each { echo $"(char bel)"; sleep 1sec }
}

def --env --wrapped "Start-GoTimerWithNotification" [
    ...$args
] {
    if (which timer | is-empty) {
        if (which go | is-not-empty) {
            go install github.com/caarlos0/timer@latest
        } else {
            print $"(ansi red)sttr command not found and golang not found(ansi reset)"
        }
    }
    $in | timer --format 24h ...$args
    if ($env.LAST_EXIT_CODE == 0) {
        notify "Go Timer" $"Timer run out. Timer from command ``timer ($args)`` finished."
    }
}
