#!/usr/bin/env nu

source ./_vars.nu

# Status of Snap Package Manager
def --env "main status snap" [] {
    if ($_IsLinux == false) {
        return false
    }
    if ($_IsWSL == true) {
        return false
    }
    return (which snap | is-not-empty)
}

# Install package using Snap
def --env "main install snap" [$package: string] {
    if ((main status snap) == false) {
        return false
    }
    ^snap install $package
    return true
}

# Update package using Snap
def --env "main update snap" [$package: string] {
    if ((main status snap) == false) {
        return false
    }
    ^snap refresh $package
    return true
}

# Uninstall package using Snap
def --env "main uninstall snap" [$package: string] {
    if ((main status snap) == false) {
        return false
    }
    ^snap remove $package
    return true
}

# Upgrade packages using Snap
def --env "main upgrade snap" [] {
    if ((main status snap) == false) {
        return false
    }
    ^snap refresh
    return true
}

# Cleanup unused packages using Snap
def --env "main clean snap" [] {
    if ((main status snap) == false) {
        return false
    }
    let $oldLang = $env.LANG

    # Set the language to ensure consistent output
    $env.LANG = "en_US.UTF-8"

    # List all snap packages and filter out disabled ones
    let $disabledSnaps = (snap list --all
            | lines
            | split column --regex '\s+' name version rev tracking publisher notes # Parsing rnap list
            | where name != "Name"
            | select name rev notes
            | where notes =~ "disabled"
            | select name rev)

    # Loop through each disabled snap and remove it
    for $snap in $disabledSnaps {
        # Remove the snap revision
        print $"Removing ($snap.name) revision ($snap.rev)"
            input "Click enter to continue..."
            snap remove $snap.name --revision $snap.rev
    }

    $env.LANG = $oldLang
    return true
}
