#!/usr/bin/env nu

source ./_vars.nu

# Status of WinGet Package Manager
def --env "pm status winget" [] {
    if ($_IsWindows == false) {
        return false
    }
    return (which winget | is-not-empty)
}

# Install package using WinGet
def --env "pm install winget" [$package: string] {
    if ((pm status winget) == false) {
        return false
    }
    ^winget install --accept-source-agreements --accept-package-agreements $package
    return true
}

# Update package using WinGet
def --env "pm update winget" [$package: string] {
    if ((pm status winget) == false) {
        return false
    }
    ^winget upgrade --accept-source-agreements --accept-package-agreements $package
    return true
}

# Uninstall package using WinGet
def --env "pm uninstall winget" [$package: string] {
    if ((pm status winget) == false) {
        return false
    }
    ^winget uninstall --accept-source-agreements $package
    return true
}

# Upgrade packages using WinGet
def --env "pm upgrade winget" [] {
    if ((pm status winget) == false) {
        return false
    }
    ^winget upgrade --all
    return true
}