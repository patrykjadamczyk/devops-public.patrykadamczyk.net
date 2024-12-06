#!/usr/bin/env nu

source ./_vars.nu

# Status of YARN Package Manager
def --env "main status yarn" [] {
    return (which yarn | is-not-empty)
}

# Install package using YARN
def --env "main install yarn" [$package: string] {
    if ((main status yarn) == false) {
        return false
    }
    ^yarn global add $package
    return true
}

# Update package using YARN
def --env "main update yarn" [$package: string] {
    if ((main status yarn) == false) {
        return false
    }
    ^yarn global upgrade $package
    return true
}

# Uninstall package using YARN
def --env "main uninstall yarn" [$package: string] {
    if ((main status yarn) == false) {
        return false
    }
    ^yarn global remove $package
    return true
}

# Upgrade packages using YARN
def --env "main upgrade yarn" [] {
    if ((main status yarn) == false) {
        return false
    }
    ^yarn global upgrade
    return true
}

# Run package without installing it using YARN
def --env "main run-remote yarn" [$package: string] {
    if ((main status yarn) == false) {
        return false
    }
    ^yarn dlx $package
    return true
}

# Update lockfile of YARN in dotfiles
def --env "main update-lockfile yarn" [] {
    if ((main status yarn) == false) {
        return false
    }
    let base_path = ($"($_PatLockfilesBasePath)yarn" | path expand)
    let path = $"($base_path)/list.json"
    let pack_path = $"($base_path)/package.json"
    let lock_path = $"($base_path)/yarn.lock"
    mkdir $base_path
    print $"Updating lockfile at: ($path)"
    ^yarn global list --json --no-progress | save -f ($path | path expand)
    print $"Finding package.json and yarn.lock"
    # Format should be like that {"type":"log","data":"/home/patryk/.config/yarn/global"}
    let dir = (^yarn global dir --json --no-progress | from json).data
    print $"Updating package.json at: ($pack_path)"
    cp $"($dir)/package.json" $pack_path
    print $"Updating yarn.lock at: ($lock_path)"
    cp $"($dir)/yarn.lock" $lock_path
    print "Lockfile updated"
    return true
}
