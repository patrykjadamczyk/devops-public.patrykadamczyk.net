#!/usr/bin/env nu

# Open file in default application
# Works like gx in nvim/vim
def --env fopen (path: string) {
    if ($_IsMacOS) {
        return (^open $path)
    } else if ($_IsWindows) {
        if (which rundll32 | is-not-empty) {
            return (^rundll32 url.dll,FileProtocolHandler $path)
        }
    }
    if (which xdg-open | is-not-empty) {
        return (^xdg-open $path)
    }
    if (which wslview | is-not-empty) {
        return (^wslview $path)
    }
    if (which explorer.exe | is-not-empty) {
        return (^explorer.exe $path)
    }
    if (which lemonade | is-not-empty) {
        return (^lemonade $path)
    }
    return (error make {msg: 'fopen: no handler found (tried: wslview, explorer.exe, xdg-open, lemonade)' })
}

# Open file in default application
# Works like gx in nvim/vim
alias gx = fopen
