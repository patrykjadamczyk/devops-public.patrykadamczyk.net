#!/usr/bin/env pwsh
function Global:reset_ram() {
    sudo swapoff -a
    sudo bash -c "sync; echo 3 > /proc/sys/vm/drop_caches"
    Read-Host -Prompt "Press any key to continue and start swap back"
    sudo swapon -a
}
