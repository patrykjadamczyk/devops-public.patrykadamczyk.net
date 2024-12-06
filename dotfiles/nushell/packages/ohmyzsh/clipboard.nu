#!/usr/bin/env nu

# Get Clipboard
def --env Get-Clipboard [] {
    return (^pwsh -NoProfile -Command "Get-Clipboard")
}

# Set Clipboard
alias "Set-Clipboard" = mod clip

# Add specified file path to clipboard
def --env Add-FileToClipboard [$path: string] {
    $path | path expand | Set-Clipboard
    print $"(ansi green)Added ($path) to clipboard(ansi reset)"
}

# Copy file from clipboard to specified location
def --env Copy-FileFromClipboard [$path: string = "./"] {
    let clipboardContent = Get-Clipboard
    if ($clipboardContent | is-empty) {
        print $"(ansi red)Clipboard is empty(ansi reset)"
        return
    }
    cp $clipboardContent $path
}

# Move file from clipboard to specified location
def --env Move-FileFromClipboard [$path: string = "./"] {
    let clipboardContent = Get-Clipboard
    if ($clipboardContent | is-empty) {
        print $"(ansi red)Clipboard is empty(ansi reset)"
        return
    }
    mv $clipboardContent $path
}

# Copy current working directory to clipboard
def --env Copy-CWDToClipboard [] {
    pwd | Set-Clipboard
}
