#!/usr/bin/env nu

# Remove all disabled snaps (old versions)
export def cleanup [] {
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
}
