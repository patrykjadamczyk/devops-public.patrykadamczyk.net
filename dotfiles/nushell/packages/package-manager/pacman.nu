#!/usr/bin/env nu

source ./_vars.nu

# Status of PacMan Package Manager
def --env "pm status pacman" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which pacman | is-not-empty)
}

# Install package using Pacman
def --env "pm install pacman" [$package: string] {
    if ((pm status pacman) == false) {
        return false
    }
    ^pacman -Syu $package
    return true
}

# Update Database of Pacman
def --env "pm update-db pacman" [] {
    if ((pm status pacman) == false) {
        return false
    }
    ^pacman -Syy
    return true
}

# Update package using Pacman
def --env "pm update pacman" [$package: string] {
    if ((pm status pacman) == false) {
        return false
    }
    ^pacman -Syu $package
    return true
}

# Uninstall package using Pacman
def --env "pm uninstall pacman" [$package: string] {
    if ((pm status pacman) == false) {
        return false
    }
    ^pacman -R $package
    return true
}

# Upgrade packages using Pacman
def --env "pm upgrade pacman" [] {
    if ((pm status pacman) == false) {
        return false
    }
    ^pacman -Syu
    return true
}