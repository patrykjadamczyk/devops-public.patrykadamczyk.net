#!/usr/bin/env nu

source ./_vars.nu

# Status of Yum Package Manager
def --env "pm status yum" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which yum | is-not-empty)
}

# Install package using Yum
def --env "pm install yum" [$package: string] {
    if ((pm status yum) == false) {
        return false
    }
    ^yum install -y $package
    return true
}

# Update package using Yum
def --env "pm update yum" [$package: string] {
    if ((pm status yum) == false) {
        return false
    }
    ^yum upgrade -y $package
    return true
}

# Uninstall package using Yum
def --env "pm uninstall yum" [$package: string] {
    if ((pm status yum) == false) {
        return false
    }
    ^yum remove -y $package
    return true
}

# Upgrade packages using Yum
def --env "pm upgrade yum" [] {
    if ((pm status yum) == false) {
        return false
    }
    ^yum upgrade -y
    return true
}