#!/usr/bin/env nu

# Main Alacritty
alias main_alacritty = ^alacritty -T "MAIN ALACRITTY" -e nu
# Alacritty - NeoVim
alias anv = alacritty -T "NeoVim" -o "window.startup_mode=Maximized" -e nu -c nvim
# Alacrity - Sudo
let __nu = (which nu | get path)
alias asudo = sudo alacritty -T "Administrator Terminal" -e ...$__nu
# Alacritty - Check Internet Connection
alias ping-monitor = alacritty -T "Check Internet Connection" -o "window.startup_mode=Maximized" -e nu -c "gping google.com store.steampowered.com patrykadamczyk.net 9.9.9.9 8.8.8.8 8.8.4.4 1.1.1.1 172.20.0.1 192.168.8.1"
