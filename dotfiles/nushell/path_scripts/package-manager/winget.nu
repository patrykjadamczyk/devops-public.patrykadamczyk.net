#!/usr/bin/env nu

source ./_vars.nu

# Status of WinGet Package Manager
def --env "main status winget" [] {
    if ($_IsWindows == false) {
        return false
    }
    return (which winget | is-not-empty)
}

# Install package using WinGet
def --env "main install winget" [$package: string] {
    if ((main status winget) == false) {
        return false
    }
    ^winget install --accept-source-agreements --accept-package-agreements $package
    return true
}

# Update package using WinGet
def --env "main update winget" [$package: string] {
    if ((main status winget) == false) {
        return false
    }
    ^winget upgrade --accept-source-agreements --accept-package-agreements $package
    return true
}

# Uninstall package using WinGet
def --env "main uninstall winget" [$package: string] {
    if ((main status winget) == false) {
        return false
    }
    ^winget uninstall --accept-source-agreements $package
    return true
}

# Upgrade packages using WinGet
def --env "main upgrade winget" [] {
    if ((main status winget) == false) {
        return false
    }
    ^winget upgrade --all
    return true
}
