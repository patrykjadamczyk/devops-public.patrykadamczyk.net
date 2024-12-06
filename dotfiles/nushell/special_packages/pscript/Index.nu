#!/usr/bin/env nu

let current_script_dir = ("~/.config/nushell/special_packages/pscript" | path expand)
let modscript = $"($current_script_dir)/pscript.nu"

echo "" | save -f $modscript

let files = (ls ($"($current_script_dir)/**/*.nu" | into glob)
    | where name != $modscript
    | where name != $"($current_script_dir)/Index.nu"
    | get name
)

for $x in $files {
    echo $"export module ($x)\n" | save $modscript --append --raw
}

use ./pscript.nu
