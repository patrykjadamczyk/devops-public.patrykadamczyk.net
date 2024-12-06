#!/usr/bin/env nu
if (which mise | is-empty) {
    return
}

# let mise_path = ($env.FILE_PWD | path join "hook.nu")
# ^mise activate nu | save $mise_path --force

use ./hook.nu
