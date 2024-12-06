#!/usr/bin/env nu

source ./_vars.nu

# Status of Nala Package Manager
def --env "pm status nala" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which nala | is-not-empty)
}

# Install package using Nala
def --env "pm install nala" [$package: string] {
    if ((pm status nala) == false) {
        return false
    }
    ^sudo nala install -y $package
    return true
}

# Update Database of Apt using Nala
def --env "pm update-db nala" [] {
    if ((pm status nala) == false) {
        return false
    }
    ^sudo nala update -y
    return true
}

# Update package using Nala
def --env "pm update nala" [$package: string] {
    if ((pm status nala) == false) {
        return false
    }
    ^sudo nala upgrade -y $package
    return true
}

# Uninstall package using Nala
def --env "pm uninstall nala" [$package: string] {
    if ((pm status nala) == false) {
        return false
    }
    ^sudo nala remove -y $package
    return true
}

# Upgrade packages using Nala
def --env "pm upgrade nala" [] {
    if ((pm status nala) == false) {
        return false
    }
    ^sudo nala upgrade -y
    ^sudo nala autoremove -y
    return true
}