#!/usr/bin/env nu

def --env "Get-Weather" [
    $location: string = "Lodz"
] {
    let Weather = (http get $"http://wttr.in/($location)?format=j1")
    return ($Weather.current_condition | first)
}

def --env "Show-Weather" [
    $location: string = "Lodz",
    --DefaultFormat = false,
    --V2Format = false
] {
    if ($DefaultFormat) {
        return (http get $"http://wttr.in/($location)")
    } else if ($V2Format) {
        return (http get $"http://wttr.in/($location)?format=v2")
    } else {
        let LineSeparator = "    "
        # let Format = "%l:+%c+%t+%w\n+%m+%M+%p+%P+%u"
        let Format = "Location: %l"
            | append "Weather: +%c+%t"
            | append "Wind: +%w"
            | append "Moon: +%m+%M"
            | append "Rain: +%p"
            | append "Pressure: +%P"
            | append "UV Index: +%u"
            | append "Current Time: +%T"
            | append "Times:"
            | append "- Dawn 🌅 +%D"
            | append "- Sunrise 🌅 +%S"
            | append "- Zenith ☀️+%z"
            | append "- Sunset 🌇+%s"
            | append "- Dusk 🌆+%d"
            | str join $LineSeparator
        return (
            http get $'http://wttr.in/($location)?format="($Format)"'
                | split row $LineSeparator
                | each { $in | str replace '"' '' }
        )
    }
}
