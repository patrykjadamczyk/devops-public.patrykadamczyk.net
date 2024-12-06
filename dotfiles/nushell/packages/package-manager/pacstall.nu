#!/usr/bin/env nu

source ./_vars.nu

# Status of PacStall Package Manager
def --env "pm status pacstall" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which pacstall | is-not-empty)
}

# Install package using PacStall
def --env "pm install pacstall" [$package: string] {
    if ((pm status pacstall) == false) {
        return false
    }
    ^pacstall -I $package
    return true
}

# Update package using PacStall
def --env "pm update pacstall" [$package: string] {
    if ((pm status pacstall) == false) {
        return false
    }
    ^pacstall -Up $package
    return true
}

# Uninstall package using PacStall
def --env "pm uninstall pacstall" [$package: string] {
    if ((pm status pacstall) == false) {
        return false
    }
    ^pacstall -R $package
    return true
}

# Upgrade packages using PacStall
def --env "pm upgrade pacstall" [] {
    if ((pm status pacstall) == false) {
        return false
    }
    ^pacstall -Up
    return true
}