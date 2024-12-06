#!/usr/bin/env nu

source ./_vars.nu

# Status of XXX Package Manager
def --env "pm status xxx" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which xxx | is-not-empty)
}

# Install package using XXX
def --env "pm install xxx" [$package: string] {
    if ((pm status xxx) == false) {
        return false
    }
    ^xxx install -y $package
    return true
}

# Update Database of XXX
def --env "pm update-db xxx" [] {
    if ((pm status xxx) == false) {
        return false
    }
    ^xxx update -y
    return true
}

# Update package using XXX
def --env "pm update xxx" [$package: string] {
    if ((pm status xxx) == false) {
        return false
    }
    ^xxx upgrade -y $package
    return true
}

# Uninstall package using XXX
def --env "pm uninstall xxx" [$package: string] {
    if ((pm status xxx) == false) {
        return false
    }
    ^xxx remove -y $package
    return true
}

# Upgrade packages using XXX
def --env "pm upgrade xxx" [] {
    if ((pm status xxx) == false) {
        return false
    }
    ^xxx upgrade -y
    return true
}

# Run package using XXX
def --env "pm run xxx" [$package: string] {
    if ((pm status xxx) == false) {
        return false
    }
    ^xxx run $package
    return true
}

# Run package without installing it using XXX
def --env "pm run-remote xxx" [$package: string] {
    if ((pm status xxx) == false) {
        return false
    }
    ^xxx npx $package
    return true
}

# Update lockfile of XXX in dotfiles
def --env "pm update-lockfile xxx" [] {
    if ((pm status xxx) == false) {
        return false
    }
    const path = $"($_PatLockfilesBasePath)xxx.json"
    mkdir ($_PatLockfilesBasePath | path expand)
    print $"Updating lockfile at: ($path)"
    ^xxx list -g --json | save -f ($path | path expand)
    print "Lockfile updated"
    return true
}