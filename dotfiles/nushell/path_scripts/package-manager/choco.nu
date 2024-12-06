#!/usr/bin/env nu

source ./_vars.nu

# Status of Choco Package Manager
def --env "main status choco" [] {
    if ($_IsWindows == false) {
        return false
    }
    return (which choco | is-not-empty)
}

# Install package using Choco
def --env "main install choco" [$package: string] {
    if ((main status choco) == false) {
        return false
    }
    ^choco install -y $package
    return true
}

# Update package using Choco
def --env "main update choco" [$package: string] {
    if ((main status choco) == false) {
        return false
    }
    ^choco upgrade -y $package
    return true
}

# Uninstall package using Choco
def --env "main uninstall choco" [$package: string] {
    if ((main status choco) == false) {
        return false
    }
    ^choco uninstall -y $package
    return true
}

# Upgrade packages using Choco
def --env "main upgrade choco" [] {
    if ((main status choco) == false) {
        return false
    }
    ^choco upgrade -y all
    return true
}
