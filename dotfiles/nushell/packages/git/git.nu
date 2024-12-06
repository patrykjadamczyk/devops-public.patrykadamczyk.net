#!/usr/bin/env nu

use std

# Get current git branch
def --env "Get-Git-CurrentBranch" [] {
    ^git symbolic-ref --short HEAD | save --append (std null-device)

    if ($env.LAST_EXIT_CODE == 0) {
        return (^git rev-parse --abbrev-ref HEAD)
    } else {
        return null
    }
}

def --env "Get-Git-Repository-Path" [] {
    return (^git rev-parse --show-toplevel)
}

# Check if current directory is a git repository
# Returns:
# - Returns 1 if it's git repo based on .git folder or git rev-parse returning correct output
# - Returns 0 if it's not git repo
# - Returns 2 if git failed
def --env "Test-Git-Repository" [] {
    if (pwd | path join ".git" | path exists) {
        return 1
    }
    ^git rev-parse --show-toplevel | save --append (std null-device)
    match $env.LAST_EXIT_CODE {
        128 => {
            return 0
        },
        0 => {
            return 1
        },
        _ => {
            return 2
        }
    }
}

# TODO: git aliases
# NOTE: g is nushell's functions so probably try to find other name
