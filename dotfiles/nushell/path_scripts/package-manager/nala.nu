#!/usr/bin/env nu

source ./_vars.nu

# Status of Nala Package Manager
def --env "main status nala" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which nala | is-not-empty)
}

# Install package using Nala
def --env "main install nala" [$package: string] {
    if ((main status nala) == false) {
        return false
    }
    ^sudo nala install -y $package
    return true
}

# Update Database of Apt using Nala
def --env "main update-db nala" [] {
    if ((main status nala) == false) {
        return false
    }
    ^sudo nala update -y
    return true
}

# Update package using Nala
def --env "main update nala" [$package: string] {
    if ((main status nala) == false) {
        return false
    }
    ^sudo nala upgrade -y $package
    return true
}

# Uninstall package using Nala
def --env "main uninstall nala" [$package: string] {
    if ((main status nala) == false) {
        return false
    }
    ^sudo nala remove -y $package
    return true
}

# Upgrade packages using Nala
def --env "main upgrade nala" [] {
    if ((main status nala) == false) {
        return false
    }
    ^sudo nala upgrade -y
    ^sudo nala autoremove -y
    return true
}
