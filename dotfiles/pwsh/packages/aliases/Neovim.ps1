#!/usr/bin/env pwsh
function Global:Update-NeoVimPlugins {
    nvim --headless "+Lazy! sync" +qa
}