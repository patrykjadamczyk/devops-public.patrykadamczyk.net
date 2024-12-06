#!/usr/bin/env nu

def --env "Start-Timer" [
    $Seconds: int
] {
    seq 1 $Seconds
        | reverse
        | each { |i|
            clear
            print $"T-($i) seconds"
            sleep 1sec
        }
    clear
    print $"(char bel)✔️ ($Seconds) seconds countdown finished"
}
