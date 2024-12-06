#!/usr/bin/env nu

source ./_vars.nu

# Status of Flatpak Package Manager
def --env "main status flatpak" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which flatpak | is-not-empty)
}

# Install package using Flatpak
def --env "main install flatpak" [$package: string] {
    if ((main status flatpak) == false) {
        return false
    }
    ^flatpak install -y $package
    return true
}

# Update package using Flatpak
def --env "main update flatpak" [$package: string] {
    if ((main status flatpak) == false) {
        return false
    }
    ^flatpak update -y $package
    return true
}

# Uninstall package using Flatpak
def --env "main uninstall flatpak" [$package: string] {
    if ((main status flatpak) == false) {
        return false
    }
    ^flatpak uninstall -y $package
    return true
}

# Upgrade packages using Flatpak
def --env "main upgrade flatpak" [] {
    if ((main status flatpak) == false) {
        return false
    }
    ^flatpak update -y
    return true
}

# Cleanup unused packages using Flatpak
def --env "main clean flatpak" [] {
    if ((main status flatpak) == false) {
        return false
    }
    ^flatpak uninstall --unused
    return true
}

# Run package using Flatpak
def --env "main run flatpak" [$package: string] {
    if ((main status flatpak) == false) {
        return false
    }
    ^flatpak run $package
    return true
}
