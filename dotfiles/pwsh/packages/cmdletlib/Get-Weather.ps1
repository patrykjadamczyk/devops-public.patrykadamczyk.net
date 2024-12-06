#!/usr/bin/env pwsh
function Global:Get-Weather(
    [string]$location = "Lodz"
) {
	$Weather = (Invoke-WebRequest http://wttr.in/${location}?format=j1 -userAgent "curl" -useBasicParsing).Content | ConvertFrom-Json
    return $Weather.current_condition
}

function Global:Show-Weather(
    [string]$location = "Lodz",
    [switch]$DefaultFormat = $false,
    [switch]$V2Format = $false
) {
    if ($DefaultFormat) {
        return (Invoke-WebRequest http://wttr.in/${location} -userAgent "curl" -useBasicParsing).Content
    } elseif ($V2Format) {
        return (Invoke-WebRequest http://wttr.in/${location}?format=v2 -userAgent "curl" -useBasicParsing).Content
    } else {
        $Format = "%l:+%c+%t+%w\n+%m+%M+%p+%P+%u"
        $Format = [String]::Concat("",
            "Location: %l\n",
            "Weather: +%c+%t\n",
            "Wind: +%w\n",
            "Moon: +%m+%M\n",
            "Rain: +%p\n",
            "Pressure: +%P\n",
            "UV Index: +%u\n",
            "Current Time: +%T\n",
            "Times:\n",
            "- Dawn 🌅 +%D\n",
            "- Sunrise 🌅 +%S\n",
            "- Zenith ☀️+%z\n",
            "- Sunset 🌇+%s\n",
            "- Dusk 🌆+%d\n",
            ""
        )
        return (Invoke-WebRequest http://wttr.in/${location}?format="$Format" -userAgent "curl" -useBasicParsing).Content
    }
}
