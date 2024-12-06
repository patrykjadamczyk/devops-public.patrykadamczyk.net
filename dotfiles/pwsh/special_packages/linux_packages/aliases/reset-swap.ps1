#!/usr/bin/env pwsh
function Global:reset_swap() {
    sudo swapoff -a
    Read-Host -Prompt "Press any key to continue and start swap back"
    sudo swapon -a
}
