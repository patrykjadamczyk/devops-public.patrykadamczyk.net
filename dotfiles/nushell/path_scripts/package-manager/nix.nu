#!/usr/bin/env nu

source ./_vars.nu

# Status of Nix Package Manager
def --env "main status nix" [] {
    if (($_IsLinux or $_IsMacOS) == false) {
        return false
    }
    return ((which nix | is-not-empty) or (which nix-env | is-not-empty) or (which nix-channel | is-not-empty))
}

# Install package using Nix
def --env "main install nix" [$package: string] {
    if ((main status nix) == false) {
        return false
    }
    ^nix-env -iA $package
    return true
}

# Update Database of Nix
def --env "main update-db nix" [] {
    if ((main status nix) == false) {
        return false
    }
    ^nix-channel --update
    return true
}

# update package using Nix
def --env "main update nix" [$package: string] {
    if ((main status nix) == false) {
        return false
    }
    ^nix-env -uA $package
    return true
}

# Uninstall package using Nix
def --env "main uninstall nix" [$package: string] {
    if ((main status nix) == false) {
        return false
    }
    ^nix-env --uninstall $package
    return true
}
