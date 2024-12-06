#!/usr/bin/env nu
let $partitions = (jc lsblk
    | from json
    | where type == "part"
    | each { $in.name }
    | str join (char nl)
)
let $chosen = ($partitions
    | fzf --prompt="Select partition to fix: "
)
if ($chosen | is-empty) {
    exit 1
    return 1
}
let $device = $"/dev/($chosen)"

# a - auto fix
# v - verbose
sudo fsck -av $device
