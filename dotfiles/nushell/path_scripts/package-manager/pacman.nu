#!/usr/bin/env nu

source ./_vars.nu

# Status of PacMan Package Manager
def --env "main status pacman" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which pacman | is-not-empty)
}

# Install package using Pacman
def --env "main install pacman" [$package: string] {
    if ((main status pacman) == false) {
        return false
    }
    ^pacman -Syu $package
    return true
}

# Update Database of Pacman
def --env "main update-db pacman" [] {
    if ((main status pacman) == false) {
        return false
    }
    ^pacman -Syy
    return true
}

# Update package using Pacman
def --env "main update pacman" [$package: string] {
    if ((main status pacman) == false) {
        return false
    }
    ^pacman -Syu $package
    return true
}

# Uninstall package using Pacman
def --env "main uninstall pacman" [$package: string] {
    if ((main status pacman) == false) {
        return false
    }
    ^pacman -R $package
    return true
}

# Upgrade packages using Pacman
def --env "main upgrade pacman" [] {
    if ((main status pacman) == false) {
        return false
    }
    ^pacman -Syu
    return true
}
