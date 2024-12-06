#!/usr/bin/env nu

source ./_vars.nu

# Status of dotfiles
def --env "pm status dotfiles" [] {
    if (("~/go/src/devops.patrykadamczyk.net" | path expand | path exists) == false) {
        return false
    }
    if (which git | is-empty) {
        return false
    }
    return true
}

# Install dotfiles
def --env "pm install dotfiles" [] {
    if ((pm status dotfiles) == false) {
        return false
    }
    enter "~/go/src/devops.patrykadamczyk.net"
    ./Install.nu
    dexit
    return true
}

# Upgrade dotfiles
def --env "pm upgrade dotfiles" [] {
    if ((pm status dotfiles) == false) {
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
def --env "pm update dotfiles" [] {
    return (pm upgrade dotfiles)
}