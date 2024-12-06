#!/usr/bin/env nu

source ./_vars.nu

# Status of Scoop Package Manager
def --env "main status scoop" [] {
    if ($_IsWindows == false) {
        return false
    }
    return (which scoop | is-not-empty)
}

# Install package using Scoop
def --env "main install scoop" [$package: string] {
    if ((main status scoop) == false) {
        return false
    }
    ^scoop install $package
    return true
}

# Update package using Scoop
def --env "main update scoop" [$package: string] {
    if ((main status scoop) == false) {
        return false
    }
    ^scoop update $package
    return true
}

# Uninstall package using Scoop
def --env "main uninstall scoop" [$package: string] {
    if ((main status scoop) == false) {
        return false
    }
    ^scoop uninstall $package
    return true
}

# Upgrade packages using Scoop
def --env "main upgrade scoop" [] {
    if ((main status scoop) == false) {
        return false
    }
    ^scoop upgrade --all
    return true
}
