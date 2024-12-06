#!/usr/bin/env nu

source ./_vars.nu

# Status of Apt Package Manager
def --env "pm status apt" [] {
    if ($_IsLinux == false) {
        return false
    }
    return ((which apt | is-not-empty) or (which apt-get | is-not-empty))
}

# Install package using Apt
def --env "pm install apt" [$package: string] {
    if ((pm status apt) == false) {
        return false
    }
    if (which apt | is-not-empty) {
        ^apt install -y $package
    } else {
        ^apt-get install -y $package
    }
    return true
}

# Update Database of Apt
def --env "pm update-db apt" [] {
    if ((pm status apt) == false) {
        return false
    }
    if (which apt | is-not-empty) {
        ^apt update -y
    } else {
        ^apt-get update -y
    }
    return true
}

# Update package using Apt
def --env "pm update apt" [$package: string] {
    if ((pm status apt) == false) {
        return false
    }
    if (which apt | is-not-empty) {
        ^apt upgrade -y $package
    } else {
        ^apt-get upgrade -y $package
    }
    return true
}

# Uninstall package using Apt
def --env "pm uninstall apt" [$package: string] {
    if ((pm status apt) == false) {
        return false
    }
    if (which apt | is-not-empty) {
        ^apt remove -y $package
    } else {
        ^apt-get remove -y $package
    }
    return true
}

# Upgrade packages using Apt
def --env "pm upgrade apt" [] {
    if ((pm status apt) == false) {
        return false
    }
    if (which apt | is-not-empty) {
        ^apt upgrade -y
        ^apt autoremove -y
    } else {
        ^apt-get upgrade -y
        ^apt-get autoremove -y
    }
    return true
}