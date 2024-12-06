#!/usr/bin/env nu

def --env "Translate" [
    $Text: string,
    $SourceLanguage: string = "en",
    $TargetLanguage: string = "pl"
] {
    let translateBody = { q: $Text, source: $SourceLanguage, target: $TargetLanguage, format: "text" }
    let ret = (
        http post "https://translate.terraprint.co/translate" --content-type application/json $translateBody
    )
    if ($ret | is-empty) {
        return $ret
    }
    if ($ret.translatedText | is-empty) {
        return $ret
    }
    return $ret.translatedText
}
