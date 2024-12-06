#!/usr/bin/env nu

if (which navi | is-empty) {
    return
}

let navi_command = open (navi info config-path)
    | get -i 'shell'
    | default { command: null }
    | get -i command
    | default 'bash'

# use dotfiles cheats if it exists
if ($"~/.config/navi/" | path exists) {
    $env.NAVI_PATH = $"~/.config/navi/main/(char esep)~/.config/navi/($_os_l)/(char esep)~/.local/share/navi/cheats/"
}

def _navi_widget [] {
    let input = commandline
    let last_command = ($input | navi fn widget::last_command)
    let result = if ($last_command == "") { navi --print } else { navi --print --query $last_command } | str trim

    if $result == "" {
        return
    }
    let tmpfile = mktemp --tmpdir --suffix .nu
    try {
        $result | save --force $tmpfile
        commandline edit -r $result
        # we can't do that, cheats are written in bash:
        # history insert $result
        # nu $tmpfile
    } catch { |e|
        use std log
        log error $"Command failed: ($e)"
    }
    rm $tmpfile
    ignore
}

def _navi_widget_local_only [] {
    let navi_path_local = $"($env.NAVI_PATH)"
    $env.NAVI_PATH = $"~/.config/navi/main/(char esep)~/.config/navi/($_os_l)/"
    let input = commandline
    let last_command = ($input | navi fn widget::last_command)
    let result = if ($last_command == "") { navi --print } else { navi --print --query $last_command } | str trim

    if $result == "" {
        return
    }
    let tmpfile = mktemp --tmpdir --suffix .nu
    try {
        $result | save --force $tmpfile
        commandline edit -r $result
        # we can't do that, cheats are written in bash:
        # history insert $result
        # nu $tmpfile
    } catch { |e|
        use std log
        log error $"Command failed: ($e)"
    }
    rm $tmpfile
    ignore
    $env.NAVI_PATH = $navi_path_local
}

$env.config.keybindings = ($env.config.keybindings | append {
    name: navi
    modifier: control
    keycode: char_g
    mode: [emacs vi_normal vi_insert]
    event: {
        send: ExecuteHostCommand
        cmd: "_navi_widget"
    }
})

$env.config.keybindings = ($env.config.keybindings | append {
    name: navi
    modifier: control
    keycode: char_j
    mode: [emacs vi_normal vi_insert]
    event: {
        send: ExecuteHostCommand
        cmd: "_navi_widget_local_only"
    }
})
