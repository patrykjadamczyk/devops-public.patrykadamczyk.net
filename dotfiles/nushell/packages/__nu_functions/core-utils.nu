#!/usr/bin/env nu

# Disk free
def --env --wrapped "df" [
    ...$rest
] {
    ^coreutils df ...$rest | parse-tool --df
}

# Run Core utils
alias cu = ^coreutils
