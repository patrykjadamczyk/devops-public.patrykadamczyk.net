#!/usr/bin/env nu

alias Get-Clock-ByTimezones = tz

def --env --wrapped "Get-Clock-ByTimezonesInteractively" [
    ...$args
] {
    if (which timer | is-empty) {
        if (which go | is-not-empty) {
            go install github.com/oz/tz@latest
        } else {
            print $"(ansi red)tz command not found and golang not found(ansi reset)"
        }
    }
    mut selectedTimezone = tz --list | fzf
    if ($selectedTimezone | is-empty) {
        echo $"(ansi red)No timezone selected(ansi reset)"
        return
    }

    let tSelectedTimezone = $selectedTimezone | split row " :: "
    if (($tSelectedTimezone | length) != 2) {
        echo $"(ansi red)Invalid timezone(ansi reset)"
        return
    }

    $selectedTimezone = ( $tSelectedTimezone | last )
    Get-Clock-ByTimezones $selectedTimezone
}
