#!/usr/bin/env nu

# Open directory in new tab (~/go/src max-depth 2)
def --env "f" [] {
    let $title = (input "Choose title: ")
    let $dir = (fd . --type d --max-depth 2 ~/go/src
        | fzf --prompt "Choose a directory: " --preview 'tree -C -L 2 {}')
    wezterm cli spawn --cwd $dir -- nu -e $"tab-title \"($title)\"; c \"($dir)\""
}

# Open directory in new tab (~/go/src)
def --env "fp" [] {
    let $title = (input "Choose title: ")
    let $dir = (fd . --type d ~/go/src
        | fzf --prompt "Choose a directory: " --preview 'tree -C -L 2 {}')
    wezterm cli spawn --cwd $dir -- nu -e $"tab-title \"($title)\"; c \"($dir)\""
}

# Open directory in new tab in neovim (~/go/src)
def --env "fn" [] {
    let $title = (input "Choose title: ")
    let $dir = (fd . --type d ~/go/src
        | fzf --prompt "Choose a directory: " --preview 'tree -C -L 2 {}')
    wezterm cli spawn --cwd $dir -- nu -e $"tab-title \"($title)\"; c \"($dir)\"; n ."
}

# Find string in directory
def --env "fl" [] {
    let $RELOAD = 'reload:rg --column --color=always --smart-case {q} || :'
    fzf --disabled --ansi --bind $"start:($RELOAD)" --bind $"change:($RELOAD)" --delimiter : --preview 'bat --style=full --color=always --highlight-line {2} {1}' --preview-window '~4,+{2}+4/3,<80(up)'
}
