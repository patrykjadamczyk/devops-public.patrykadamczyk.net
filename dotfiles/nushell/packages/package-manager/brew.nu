#!/usr/bin/env nu

source ./_vars.nu

# Status of Brew Package Manager
def --env "pm status brew" [] {
    if (($_IsLinux or $_IsMacOS) == false) {
        return false
    }
    return (which brew | is-not-empty)
}

# Install package using Brew
def --env "pm install brew" [$package: string] {
    if ((pm status brew) == false) {
        return false
    }
    ^brew install $package
    return true
}

# Update Database of Brew
def --env "pm update-db brew" [] {
    if ((pm status brew) == false) {
        return false
    }
    ^brew update
    return true
}

# Update package using Brew
def --env "pm update brew" [$package: string] {
    if ((pm status brew) == false) {
        return false
    }
    ^brew upgrade $package
    return true
}

# Uninstall package using Brew
def --env "pm uninstall brew" [$package: string] {
    if ((pm status brew) == false) {
        return false
    }
    ^brew uninstall $package
    return true
}

# Upgrade packages using Brew
def --env "pm upgrade brew" [] {
    if ((pm status brew) == false) {
        return false
    }
    ^brew update
    ^brew upgrade
    return true
}