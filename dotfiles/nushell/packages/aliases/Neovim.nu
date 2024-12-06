#!/usr/bin/env nu

# Update neovim plugins
alias "Update-NeoVimPlugins" = nvim --headless "+Lazy! sync" +qa
