#!/usr/bin/env nu

source ./_vars.nu

# Status of BUN Package Manager
def --env "pm status bun" [] {
    return (which bun | is-not-empty)
}

# Install package using BUN
def --env "pm install bun" [$package: string] {
    if ((pm status bun) == false) {
        return false
    }
    ^bun install -g $package
    return true
}

# Update package using BUN
def --env "pm update bun" [$package: string] {
    if ((pm status bun) == false) {
        return false
    }
    ^bun update -g $package
    return true
}

# Uninstall package using BUN
def --env "pm uninstall bun" [$package: string] {
    if ((pm status bun) == false) {
        return false
    }
    ^bun remove -g $package
    return true
}

# Upgrade packages using BUN
def --env "pm upgrade bun" [] {
    if ((pm status bun) == false) {
        return false
    }
    ^bun update -g
    return true
}

# Run package without installing it using BUN
def --env "pm run-remote bun" [$package: string] {
    if ((pm status bun) == false) {
        return false
    }
    ^bunx $package
    return true
}

# Update lockfile of BUN in dotfiles
def --env "pm update-lockfile bun" [] {
    if ((pm status bun) == false) {
        return false
    }
    let base_path = ($"($_PatLockfilesBasePath)bun" | path expand)
    let path = $"($base_path)/list.log"
    let pack_path = $"($base_path)/package.json"
    let lock_path = $"($base_path)/bun.lockb"
    mkdir $base_path
    print $"Updating lockfile at: ($path)"
    ^bun pm ls -g | save -f $path
    print $"Finding package.json and bun.lockb"
    let dir = ($"(^bun pm cache -g)/../global/" | path expand)
    print $"Updating package.json at: ($pack_path)"
    cp $"($dir)/package.json" $pack_path
    print $"Updating bun.lockb at: ($lock_path)"
    cp $"($dir)/bun.lockb" $lock_path
    print "Lockfile updated"
    return true
}