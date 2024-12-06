#!/usr/bin/env nu

source ./_vars.nu

# Status of Brew Package Manager
def --env "main status brew" [] {
    if (($_IsLinux or $_IsMacOS) == false) {
        return false
    }
    return (which brew | is-not-empty)
}

# Install package using Brew
def --env "main install brew" [$package: string] {
    if ((main status brew) == false) {
        return false
    }
    ^brew install $package
    return true
}

# Update Database of Brew
def --env "main update-db brew" [] {
    if ((main status brew) == false) {
        return false
    }
    ^brew update
    return true
}

# Update package using Brew
def --env "main update brew" [$package: string] {
    if ((main status brew) == false) {
        return false
    }
    ^brew upgrade $package
    return true
}

# Uninstall package using Brew
def --env "main uninstall brew" [$package: string] {
    if ((main status brew) == false) {
        return false
    }
    ^brew uninstall $package
    return true
}

# Upgrade packages using Brew
def --env "main upgrade brew" [] {
    if ((main status brew) == false) {
        return false
    }
    ^brew update
    ^brew upgrade
    return true
}
