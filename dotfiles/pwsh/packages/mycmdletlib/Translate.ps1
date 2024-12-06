#!/usr/bin/env pwsh
function Global:Translate (
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline)]
    [string]$Text,
    [Parameter(Mandatory=$false, Position=1)]
    [string]$SourceLanguage = "en",
    [Parameter(Mandatory=$false, Position=2)]
    [string]$TargetLanguage = "pl"
) {
    $translateApiUrl = "https://translate.terraprint.co/translate"
    $translateBody = @{
        q = $Text
        source  = $SourceLanguage
        target = $TargetLanguage
        format = "text"
    }
    $translateHeaders = @{
        "Content-Type" = "application/json"
    }
    $translateBody = $translateBody | ConvertTo-Json
    $ret = Invoke-RestMethod -Method "POST" -Uri $translateApiUrl -Body $translateBody -Headers $translateHeaders
    if ((-not ($null -eq $ret)) -and (-not ($null -eq $ret.translatedText))) {
        return $ret.translatedText
    }
    return $ret
}
