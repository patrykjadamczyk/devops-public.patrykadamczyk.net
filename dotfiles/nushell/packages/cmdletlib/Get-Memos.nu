#!/usr/bin/env nu

def --env "Get-Memos" [] {
    let Path = "~" | path join "Memos.csv" | path expand
    if (($Path | path exists) == false) {
        print $"(ansi yellow)Sorry, no memos saved yet(ansi reset)"
        return
    }
    return (
        open $Path
            | each { |cell|
                return {
                    Time: (
                        $cell.TIME
                            | parse --regex "^(.*)[0-9]{4}(Z)"
                            | each { $"($in.capture0)($in.capture1)" }
                            | first
                            | into datetime -z u
                            # These lines are for correct translation of date but didn't work for whatever reason
                            # So cutting miliseconds and parsing date without format somehow works (with format didn't work)
                            # | parse --regex "^(.*)[0-9](Z)"
                            # | into datetime -z u --format "%Y%m%dT%H%M%S%3fZ"
                        ),
                    Text: $cell.TEXT
                }
            }
    )
}
