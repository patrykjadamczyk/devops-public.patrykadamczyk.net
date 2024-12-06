#!/usr/bin/env nu

# Watch Log File
def --env "wlf" [
    $LogFile: string
] {
    if ($_IsWindows) {
        ^pwsh -NoProfile -Command $"Get-Content -Tail 10 -Wait ($LogFile)"
    } else {
        ^tail -n 10 -f $LogFile
    }
}

# Watch Log File using FZF
def --env "wlfzf" [
    $LogFile: string
] {
    cat $LogFile | fzf --tail 1000 --tac --no-sort --exact
}

# Cat file in hex using fzf
def --env "cat-hex-fzf" [$File: string] {
    cat $File | xxd | fzf --tac
}
