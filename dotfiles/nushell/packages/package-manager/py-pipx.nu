#!/usr/bin/env nu

source ./_vars.nu

# Status of PIPX Package Manager
def --env "pm status pipx" [] {
    return (which pipx | is-not-empty)
}

# Install package using PIPX
def --env "pm install pipx" [$package: string] {
    if ((pm status pipx) == false) {
        return false
    }
    ^pipx install $package
    return true
}

# Update package using PIPX
def --env "pm update pipx" [$package: string] {
    if ((pm status pipx) == false) {
        return false
    }
    ^pipx upgrade $package
    return true
}

# Uninstall package using PIPX
def --env "pm uninstall pipx" [$package: string] {
    if ((pm status pipx) == false) {
        return false
    }
    ^pipx uninstall $package
    return true
}

# Upgrade packages using PIPX
def --env "pm upgrade pipx" [] {
    if ((pm status pipx) == false) {
        return false
    }
    ^pipx upgrade-all
    return true
}

# Update lockfile of PIPX in dotfiles
def --env "pm update-lockfile pipx" [] {
    if ((pm status pipx) == false) {
        return false
    }
    const path = ($"($_PatLockfilesBasePath)pipx.json" | path expand)
    mkdir ($_PatLockfilesBasePath | path expand)
    print $"Updating lockfile at: ($path)"
    ^pipx list --json | save -f $path
    print "Lockfile updated"
    return true
}