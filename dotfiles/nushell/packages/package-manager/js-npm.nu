#!/usr/bin/env nu

source ./_vars.nu

# Status of NPM Package Manager
def --env "pm status npm" [] {
    return (which npm | is-not-empty)
}

# Install package using NPM
def --env "pm install npm" [$package: string] {
    if ((pm status npm) == false) {
        return false
    }
    ^npm install -g $package
    return true
}

# Update package using NPM
def --env "pm update npm" [$package: string] {
    if ((pm status npm) == false) {
        return false
    }
    ^npm update -g $package
    return true
}

# Uninstall package using NPM
def --env "pm uninstall npm" [$package: string] {
    if ((pm status npm) == false) {
        return false
    }
    ^npm uninstall -g $package
    return true
}

# Upgrade packages using NPM
def --env "pm upgrade npm" [] {
    if ((pm status npm) == false) {
        return false
    }
    ^npm update -g
    return true
}

# Run package without installing it using NPM
def --env "pm run-remote npm" [$package: string] {
    if ((pm status npm) == false) {
        return false
    }
    ^npx $package
    return true
}

# Update lockfile of NPM in dotfiles
def --env "pm update-lockfile npm" [] {
    if ((pm status npm) == false) {
        return false
    }
    const path = $"($_PatLockfilesBasePath)npm.json"
    mkdir ($_PatLockfilesBasePath | path expand)
    print $"Updating lockfile at: ($path)"
    ^npm list -g --json | save -f ($path | path expand)
    print "Lockfile updated"
    return true
}