#!/usr/bin/env nu

source ./_vars.nu

# Status of GitHub Package Manager
def --env "pm status gh" [] {
    return ((which git | is-not-empty) and (which gh | is-not-empty))
}

# Install package using GitHub
def --env "pm install gh" [$package: string] {
    if ((pm status gh) == false) {
        return false
    }
    let path = if ($package | str starts-with "https") {
        $"~/go/src/(($package | url parse).host)(($package | url parse).path)"
            | str reverse
            | str replace "tig." ""
            | str reverse
    } else if ($package | str starts-with "git@github.com") {
         $"~/go/src/github.com/($package
            | str replace "git@github.com" ""
            | str replace ':' ""
            | str reverse
            | str replace "tig." ""
            | str reverse
        )"
    } else if ($package | str contains "@") {
        $"git://($package)"
            | str reverse
            | str replace ":" "/"
            | str reverse
            | url parse
            | $"~/go/src/($in.host)($in.path)"
            | str reverse
            | str replace "tig." ""
            | str reverse
    } else {
        $"~/go/src/github.com/($package)"
    }
    print $"Installing: ($package)"
    print $"Into: ($path)"
    input "Does this sound correct? (Enter yes, Ctrl-C no)"
    ^gh repo clone $package $path -- --recurse-submodules 
    return true
}

# Update package using GitHub
def --env "pm update gh" [$package: string] {
    if ((pm status gh) == false) {
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

# Uninstall package using GitHub
def --env "pm uninstall gh" [$package: string] {
    if ((pm status gh) == false) {
        return false
    }
    let path = $"~/go/src/($package)"
    if (($path | path exists) == false) {
        return false
    }
    rm -r $path
    return true
}