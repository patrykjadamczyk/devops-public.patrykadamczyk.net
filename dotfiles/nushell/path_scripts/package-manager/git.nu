#!/usr/bin/env nu

source ./_vars.nu

# Status of Git Package Manager
def --env "main status git" [] {
    return (which git | is-not-empty)
}

# Install package using Git
def --env "main install git" [$package: string] {
    if ((main status git) == false) {
        return false
    }
    let url = ($package | url parse)
    let path = ($"~/go/src/($url.host)($url.path)" | str reverse | str replace "tig." "" | str reverse)
    print $"Installing: ($package)"
    print $"Into: ($path)"
    input "Does this sound correct? (Enter yes, Ctrl-C no)"
    ^git clone --recurse-submodules $package $path
    return true
}

# Update package using Git
def --env "main update git" [$package: string] {
    if ((main status git) == false) {
        return false
    }
    let path = $"~/go/src/($package)"
    if (($path | path exists) == false) {
        return false
    }
    enter $path
    ^git fetch
    ^git pull --recurse-submodules
    dexit
    return true
}

# Uninstall package using Git
def --env "main uninstall git" [$package: string] {
    if ((main status git) == false) {
        return false
    }
    let path = $"~/go/src/($package)"
    if (($path | path exists) == false) {
        return false
    }
    rm -r $path
    return true
}