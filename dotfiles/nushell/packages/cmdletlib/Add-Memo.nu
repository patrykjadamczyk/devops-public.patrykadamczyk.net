#!/usr/bin/env nu

def --env "Add-Memo" [$text: string] {
    mut _text = $text
    if ($_text == "" ) {
        $_text = (input "Enter the text to memorize")
    }

    let Path = "~" | path join "Memos.csv" | path expand
    let Time = (date now | date to-timezone UTC | format date "%Y%m%dT%H%M%S%3f0Z")

    if (($Path | path exists) == false) {
        echo "" | save $Path
    }

    open $Path
        | append { TIME: $Time, TEXT: $text }
        | save -f $Path

    print "✔️ saved to 📄$Path"
}
