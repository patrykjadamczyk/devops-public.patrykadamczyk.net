#!/usr/bin/env nu

source ./_vars.nu

# Status of Choco Package Manager
def --env "pm status choco" [] {
    if ($_IsWindows == false) {
        return false
    }
    return (which choco | is-not-empty)
}

# Install package using Choco
def --env "pm install choco" [$package: string] {
    if ((pm status choco) == false) {
        return false
    }
    ^choco install -y $package
    return true
}

# Update package using Choco
def --env "pm update choco" [$package: string] {
    if ((pm status choco) == false) {
        return false
    }
    ^choco upgrade -y $package
    return true
}

# Uninstall package using Choco
def --env "pm uninstall choco" [$package: string] {
    if ((pm status choco) == false) {
        return false
    }
    ^choco uninstall -y $package
    return true
}

# Upgrade packages using Choco
def --env "pm upgrade choco" [] {
    if ((pm status choco) == false) {
        return false
    }
    ^choco upgrade -y all
    return true
}