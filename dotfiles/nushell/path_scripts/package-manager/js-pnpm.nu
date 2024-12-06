#!/usr/bin/env nu

source ./_vars.nu

# Status of PNPM Package Manager
def --env "main status pnpm" [] {
    return (which pnpm | is-not-empty)
}

# Install package using PNPM
def --env "main install pnpm" [$package: string] {
    if ((main status pnpm) == false) {
        return false
    }
    ^pnpm install -g $package
    return true
}

# Update package using PNPM
def --env "main update pnpm" [$package: string] {
    if ((main status pnpm) == false) {
        return false
    }
    ^pnpm update -g $package
    return true
}

# Uninstall package using PNPM
def --env "main uninstall pnpm" [$package: string] {
    if ((main status pnpm) == false) {
        return false
    }
    ^pnpm uninstall -g $package
    return true
}

# Upgrade packages using PNPM
def --env "main upgrade pnpm" [] {
    if ((main status pnpm) == false) {
        return false
    }
    ^pnpm update -g
    return true
}

# Run package without installing it using PNPM
def --env "main run-remote pnpm" [$package: string] {
    if ((main status pnpm) == false) {
        return false
    }
    ^pnpm dlx $package
    return true
}

# Update lockfile of PNPM in dotfiles
def --env "main update-lockfile pnpm" [] {
    if ((main status pnpm) == false) {
        return false
    }
    let base_path = ($"($_PatLockfilesBasePath)pnpm" | path expand)
    let path = $"($base_path)/list.json"
    let pack_path = $"($base_path)/package.json"
    let lock_path = $"($base_path)/pnpm-lock.yaml"
    mkdir $base_path
    print $"Updating lockfile at: ($path)"
    ^pnpm list -g --json | save -f ($path | path expand)
    print $"Finding package.json and pnpm-lock.yaml"
    let dir = ($"(^pnpm root -g)/../" | path expand)
    print $"Updating package.json at: ($pack_path)"
    cp $"($dir)/package.json" $pack_path
    print $"Updating pnpm-lock.yaml at: ($lock_path)"
    cp $"($dir)/pnpm-lock.yaml" $lock_path
    print "Lockfile updated"
    return true
}