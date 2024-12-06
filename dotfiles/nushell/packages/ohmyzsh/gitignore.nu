#!/usr/bin/env nu

def --env "Get-GitIgnore" [] {
    return (
        http get "https://www.toptal.com/developers/gitignore/api/list"
            | split row ","
            | each { $in | str trim }
            | str join "\n"
            | fzf
            | http get $"https://www.toptal.com/developers/gitignore/api/($in)"
    )
}

def --env "Add-GitIgnore" [] {
    let pathToRepo = (git rev-parse --show-toplevel)
    if ($pathToRepo | is-empty) {
        print $"(ansi red)Path to repo is not found(ansi reset)"
        return
    }
    Get-GitIgnore | save --append ($pathToRepo | path join ".gitignore")
}
