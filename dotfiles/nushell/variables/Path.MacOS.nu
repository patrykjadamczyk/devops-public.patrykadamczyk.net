#!/usr/bin/env nu
if ($_IsMacOS == false) {
    return
}

let pathConfigSuffix = [
    "/usr/local/bin"
    "/opt/local/bin"
]
let pathConfigPrefix = [
]

use std "path add"

# $env.PATH = ($env.PATH | split row (char esep))

for $path in $pathConfigSuffix {
    if ($path | path exists) {
        path add --append ($path | path expand)
    }
}

for $path in $pathConfigPrefix {
    if ($path | path exists) {
        path add ($path | path expand)
    }
}

$env.PATH = ($env.PATH | uniq)
