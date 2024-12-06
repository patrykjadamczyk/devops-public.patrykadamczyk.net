#!/usr/bin/env nu

source ./_vars.nu

# Status of Apk Package Manager
def --env "main status apk" [] {
    if ($_IsLinux == false) {
        return false
    }
    return (which apk | is-not-empty)
}

# Install package using Apk
def --env "main install apk" [$package: string] {
    if ((main status apk) == false) {
        return false
    }
    ^apk add $package
    return true
}

# Update Database of Apk
def --env "main update-db apk" [] {
    if ((main status apk) == false) {
        return false
    }
    ^apk update
    return true
}

# Update package using Apk
def --env "main update apk" [$package: string] {
    if ((main status apk) == false) {
        return false
    }
    ^apk upgrade $package
    return true
}

# Uninstall package using Apk
def --env "main uninstall apk" [$package: string] {
    if ((main status apk) == false) {
        return false
    }
    ^apk del $package
    return true
}

# Upgrade packages using Apk
def --env "main upgrade apk" [] {
    if ((main status apk) == false) {
        return false
    }
    ^apk upgrade
    return true
}
