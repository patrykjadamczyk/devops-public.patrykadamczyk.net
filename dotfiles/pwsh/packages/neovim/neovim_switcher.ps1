#!/usr/bin/env pwsh
# Change Current Neovim Config
function Global:Select-Neovim (
    [Parameter(Mandatory=$false, Position=0)]
    [string] $Config = ""
) {
    if (($Config -eq "default") -or ($Config -eq "neovim")) {
        $env:NVIM_APPNAME=""
        Write-Host "Changed to default config"
        return ""
    }
    if ($Config -eq "") {
        $NeoVimDistros = @(
            "lunarvim",
            "minimal-nvim",
            "neovim",
            "lite-nvim",
            "clean",
            "lazyvim",
            "nvchad",
            "astronvim",
            "cosmicnvim",
            "mini.nvim",
            "orgmode-nvim"
        )
        $NeoVimDescriptions = @(
            "LunarVim",
            "Minimal Neovim",
            "Neovim Default Config",
            "Neovim Lite Config",
            "Clean Neovim",
            "LazyVim",
            "NvChad",
            "AstroNvim",
            "CosmicNvim",
            "mini.nvim",
            "Neovim Lite Orgmode Config"
        )
        $choice = ($NeoVimDescriptions | Invoke-Fzf)
        $choiceId = $NeoVimDescriptions.IndexOf($choice)
        $Config = $NeoVimDistros[$choiceId]
    }
    if ($Config -eq "lunarvim") {
        $XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
        $LUNARVIM_RUNTIME_DIR = $LUNARVIM_RUNTIME_DIR ?? "$XDG_DATA_HOME\lunarvim"
        $LUNARVIM_BASE_DIR = $LUNARVIM_BASE_DIR ?? "$LUNARVIM_RUNTIME_DIR\lvim"
        $env:LUNARVIM_PS1 = "$LUNARVIM_BASE_DIR\utils\bin\lvim.ps1"
        Write-Host "Started LunarVim"
        pwsh $env:LUNARVIM_PS1
        return ""
    } elseif ($Config -eq "clean") {
        return nvim --clean
    } elseif ($Config -eq "neovim") {
        $env:NVIM_APPNAME=""
        return ""
    } else {
        $env:NVIM_APPNAME=$Config
        Write-Host "Changed to $Config config"
        return ""
    }
}
