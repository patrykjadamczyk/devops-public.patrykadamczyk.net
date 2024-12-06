#!/usr/bin/env nu
if ($_IsWindows) {
    return
}

let pathConfigSuffix = [
    "~/.cargo/bin"
    "~/go/bin"
    "~/.nix-profile/bin"
    "~/.fzf/bin"
    "/home/linuxbrew/.linuxbrew/bin"
    "/home/linuxbrew/.linuxbrew/sbin"
]
let pathConfigPrefix = [
    "~/.local/share/bob/nvim-bin"
    "~/.dotnet"
    "~/.version-fox/shims"
    "~/.cabal/bin"
    "~/.ghcup/bin"
    "~/.atuin/bin"
    "~/.config/nushell/path_scripts"
]

# std path add {linux: "foo", windows: "bar", darwin: "baz"}

use std "path add"

$env.PATH = ($env.PATH | split row (char esep))

$env.PATH = ($env.PATH
    | uniq
    | filter { $in != "/home/linuxbrew/.linuxbrew/bin" }
    | filter { $in != "/home/linuxbrew/.linuxbrew/sbin" }
    | filter { $in !~ ("~/.nix-profile" | path expand)}
    | filter { $in !~ "/nix/store"}
)

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

if (which opam | is-not-empty) {
    opam env
        | lines
        | where $it != is-empty
        | split column "=" name value
        | update value { $in | split column ";" path | get path.0 | str trim -c "'"}
        | reduce -f {} {|it acc| $acc | insert $it.name $it.value}
        | load-env
}

$env.PATH = ($env.PATH | uniq)

source ./Path.MacOS.nu
