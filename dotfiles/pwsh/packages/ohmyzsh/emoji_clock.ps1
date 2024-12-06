#!/usr/bin/env pwsh
function Global:Emoji-Clock {
    $currentDate = (Get-Date).AddMinutes(15)
    $choice = (($currentDate.Hour % 12) * 2) + (1 * (($currentDate.Minute % 60) -ge 30))

    switch ($choice) {
        0 { return "🕛"; }
        1 { return "🕧"; }
        2 { return "🕐"; }
        3 { return "🕜"; }
        4 { return "🕑"; }
        5 { return "🕝"; }
        6 { return "🕒"; }
        7 { return "🕞"; }
        8 { return "🕓"; }
        9 { return "🕟"; }
        10 { return "🕔"; }
        11 { return "🕠"; }
        12 { return "🕕"; }
        13 { return "🕡"; }
        14 { return "🕖"; }
        15 { return "🕢"; }
        16 { return "🕗"; }
        17 { return "🕣"; }
        18 { return "🕘"; }
        19 { return "🕤"; }
        20 { return "🕙"; }
        21 { return "🕥"; }
        22 { return "🕚"; }
        23 { return "🕦"; }
        default { return "⌛"; }
    }
}
