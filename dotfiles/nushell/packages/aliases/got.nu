#!/usr/bin/env nu

def --env "Translate-UI" [
    $Text: string,
    $SourceLanguage?: string = "en",
    $TargetLanguage?: string = "pl",
    $Interactive?: bool = false
] {
    if (which got | is-empty) {
        if (which go | is-not-empty) {
            go install github.com/fedeztk/got/cmd/got@latest
        } else {
            print $"(ansi red)got command not found and golang not found(ansi reset)"
        }
    }
    if ($Interactive) {
        ^got -s $SourceLanguage -t $TargetLanguage $Text
        return
    }
    return (^got -o -s $SourceLanguage -t $TargetLanguage $Text)
}

alias "Translate-InteractiveUI" = got
