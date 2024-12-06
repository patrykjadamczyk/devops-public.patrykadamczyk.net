#!/usr/bin/env nu

source ./_vars.nu

# Status of Brew Casks Package Manager
def --env "pm status brewcask" [] {
    if ($_IsMacOS == false) {
        return false
    }
    return (which brew | is-not-empty)
}

# Install package using Brew Casks
def --env "pm install brewcask" [$package: string] {
    if ((pm status brewcask) == false) {
        return false
    }
    ^brew install --cask $package
    return true
}

# update package using Brew Casks
def --env "pm update brewcask" [$package: string] {
    if ((pm status brewcask) == false) {
        return false
    }
    ^brew upgrade --cask $package
    return true
}

# Uninstall package using Brew Casks
def --env "pm uninstall brewcask" [$package: string] {
    if ((pm status brewcask) == false) {
        return false
    }
    ^brew uninstall --cask $package
    return true
}

# Upgrade packages using Brew Casks
def --env "pm upgrade brewcask" [] {
    if ((pm status brewcask) == false) {
        return false
    }
    ^brew update --cask
    ^brew upgrade --cask
    return true
}