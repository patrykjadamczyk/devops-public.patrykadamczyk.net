#!/usr/bin/env nu

source ./_vars.nu

# Status of PacStall Package Manager
def --env "main status pacstall" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which pacstall | is-not-empty)
}

# Install package using PacStall
def --env "main install pacstall" [$package: string] {
    if ((main status pacstall) == false) {
        return false
    }
    ^pacstall -I $package
    return true
}

# Update package using PacStall
def --env "main update pacstall" [$package: string] {
    if ((main status pacstall) == false) {
        return false
    }
    ^pacstall -Up $package
    return true
}

# Uninstall package using PacStall
def --env "main uninstall pacstall" [$package: string] {
    if ((main status pacstall) == false) {
        return false
    }
    ^pacstall -R $package
    return true
}

# Upgrade packages using PacStall
def --env "main upgrade pacstall" [] {
    if ((main status pacstall) == false) {
        return false
    }
    ^pacstall -Up
    return true
}
