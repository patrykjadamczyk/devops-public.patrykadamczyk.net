#!/usr/bin/env nu

source ./_vars.nu

# Status of dotfiles
def --env "main status dotfiles" [] {
    if (("~/go/src/devops.patrykadamczyk.net" | path expand | path exists) == false) {
        return false
    }
    if (which git | is-empty) {
        return false
    }
    return true
}

# Install dotfiles
def --env "main install dotfiles" [] {
    if ((main status dotfiles) == false) {
        return false
    }
    enter "~/go/src/devops.patrykadamczyk.net"
    ./Install.nu
    dexit
    return true
}

# Upgrade dotfiles
def --env "main upgrade dotfiles" [] {
    if ((main status dotfiles) == false) {
        return false
    }
    enter "~/go/src/devops.patrykadamczyk.net"
    git fetch
    git pull
    ./Install.nu
    dexit
    return true
}

# Update dotfiles
def --env "main update dotfiles" [] {
    return (main upgrade dotfiles)
}
