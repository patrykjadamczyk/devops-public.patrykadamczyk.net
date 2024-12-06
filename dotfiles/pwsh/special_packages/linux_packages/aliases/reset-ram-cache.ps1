#!/usr/bin/env pwsh
function Global:reset_ram_cache() {
    sudo bash -c "sync; echo 3 > /proc/sys/vm/drop_caches"
}
