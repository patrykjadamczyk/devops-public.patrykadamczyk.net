#!/usr/bin/env nu

let _CheatSheetPath = "~"
    | path join "go" "src" "devops.patrykadamczyk.net"
    | path join "dotfiles" "pwsh" "packages"
    | path join "autocomplete" "cheatsheets"
    | path expand

def --env "Get-CheatSheet" [] {
    let CheatSheetPathGlob = ($"($_CheatSheetPath)(char path_sep)**(char path_sep)*.md" | into glob)
    return (
        ls -f $CheatSheetPathGlob
            | each { $in | get name }
            | into string
            | str join "\n"
            | fzf --prompt "CheatSheet > " --preview "bat {} | gum format -t markdown" --preview-window "down:50%"
    )
}

def --env "Open-CheatSheet" [] {
    glow (Get-CheatSheet)
}

# TODO: Search-CheatSheet

# TODO: Edit-CheatSheet
