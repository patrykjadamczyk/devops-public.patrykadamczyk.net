#!/usr/bin/env nu
if (which zoxide | is-empty) {
    return
}

source ./hook.nu
