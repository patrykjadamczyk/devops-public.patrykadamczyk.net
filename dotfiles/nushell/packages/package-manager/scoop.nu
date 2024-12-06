#!/usr/bin/env nu

source ./_vars.nu

# Status of Scoop Package Manager
def --env "pm status scoop" [] {
    if ($_IsWindows == false) {
        return false
    }
    return (which scoop | is-not-empty)
}

# Install package using Scoop
def --env "pm install scoop" [$package: string] {
    if ((pm status scoop) == false) {
        return false
    }
    ^scoop install $package
    return true
}

# Update package using Scoop
def --env "pm update scoop" [$package: string] {
    if ((pm status scoop) == false) {
        return false
    }
    ^scoop update $package
    return true
}

# Uninstall package using Scoop
def --env "pm uninstall scoop" [$package: string] {
    if ((pm status scoop) == false) {
        return false
    }
    ^scoop uninstall $package
    return true
}

# Upgrade packages using Scoop
def --env "pm upgrade scoop" [] {
    if ((pm status scoop) == false) {
        return false
    }
    ^scoop upgrade --all
    return true
}