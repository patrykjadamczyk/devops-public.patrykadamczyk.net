#!/usr/bin/env nu

source ./_vars.nu

# Status of Dnf Package Manager
def --env "pm status dnf" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which dnf | is-not-empty)
}

# Install package using Dnf
def --env "pm install dnf" [$package: string] {
    if ((pm status dnf) == false) {
        return false
    }
    ^dnf install -y $package
    return true
}

# Update package using Dnf
def --env "pm update dnf" [$package: string] {
    if ((pm status dnf) == false) {
        return false
    }
    ^dnf upgrade -y $package
    return true
}

# Uninstall package using Dnf
def --env "pm uninstall dnf" [$package: string] {
    if ((pm status dnf) == false) {
        return false
    }
    ^dnf remove -y $package
    return true
}

# Upgrade packages using Dnf
def --env "pm upgrade dnf" [] {
    if ((pm status dnf) == false) {
        return false
    }
    ^dnf upgrade -y
    return true
}