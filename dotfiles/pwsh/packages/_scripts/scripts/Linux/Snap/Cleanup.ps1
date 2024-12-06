#!/usr/bin/env pwsh

$oldLang = $env:LANG

# Set the language to ensure consistent output
$env:LANG = "en_US.UTF-8"

# List all snap packages and filter out disabled ones
$disabledSnaps = snap list --all | Select-String "disabled"

# Loop through each disabled snap and remove it
foreach ($snap in $disabledSnaps) {
    # Extract the snap name and revision from the output
    $snapName = ($snap -split '\s+')[0]
    $revision = ($snap -split '\s+')[2]

    # Remove the snap revision
    Write-Host "Removing $snapName revision $revision"
    Read-Host "Click enter to continue..."
    snap remove "$snapName" --revision="$revision"
}

$env:LANG = $oldLang
