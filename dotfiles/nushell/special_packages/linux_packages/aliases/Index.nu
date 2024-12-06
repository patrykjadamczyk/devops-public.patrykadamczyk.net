#!/usr/bin/env nu

def --env reset_font_cache [] {
    ^fc-cache -f
}

def --env reset_ram_cache [] {
    ^sudo bash -c "sync; echo 3 > /proc/sys/vm/drop_caches"
}

def --env reset_ram [] {
    ^sudo swapoff -a
    ^sudo bash -c "sync; echo 3 > /proc/sys/vm/drop_caches"
    input "Press any key to continue and start swap back"
    ^sudo swapon -a
}

def --env fast_reset_ram [] {
    ^sudo swapoff -a
    ^sudo bash -c "sync; echo 3 > /proc/sys/vm/drop_caches"
    ^sudo swapon -a
}

def --env reset_swap [] {
    sudo swapoff -a
    input "Press any key to continue and start swap back"
    sudo swapon -a
}

def --env --wrapped steam [...$rest] {
    pwsh -c $'steam ($rest | str join " ")'
}
