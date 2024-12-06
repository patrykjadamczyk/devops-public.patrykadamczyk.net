#!/usr/bin/env nu

source ./_vars.nu

# Status of Mas Package Manager
def --env "pm status mas" [] {
    if ($_IsMacOS == false) {
        return false
    }
    return (which mas | is-not-empty)
}

# Install package using Mas
def --env "pm install mas" [$package: string] {
    if ((pm status mas) == false) {
        return false
    }
    ^mas install $package
    return true
}

# update package using Mas
def --env "pm update mas" [$package: string] {
    if ((pm status mas) == false) {
        return false
    }
    ^mas upgrade $package
    return true
}

# Uninstall package using Mas
def --env "pm uninstall mas" [$package: string] {
    if ((pm status mas) == false) {
        return false
    }
    ^mas uninstall $package
    return true
}

# Upgrade packages using Mas
def --env "pm upgrade mas" [] {
    if ((pm status mas) == false) {
        return false
    }
    ^mas upgrade
    return true
}