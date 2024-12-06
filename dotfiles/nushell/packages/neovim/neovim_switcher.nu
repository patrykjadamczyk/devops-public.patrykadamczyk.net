#!/usr/bin/env nu

def --env Select-Neovim [
    $Config?: string
] {
    mut conf = $Config
    if ($conf | is-empty) {
        let NeoVimDistros = [
            "lunarvim"
            "minimal-nvim"
            "neovim"
            "lite-nvim"
            "clean"
            "lazyvim"
            "nvchad"
            "astronvim"
            "cosmicnvim"
            "mini.nvim"
            "orgmode-nvim"
        ]
        let NeoVimDescriptions = [
            "LunarVim"
            "Minimal Neovim"
            "Neovim Default Config"
            "Neovim Lite Config"
            "Clean Neovim"
            "LazyVim"
            "NvChad"
            "AstroNvim"
            "CosmicNvim"
            "mini.nvim"
            "Neovim Lite Orgmode Config"
        ]
        let choice = ($NeoVimDescriptions | str join "\n" | fzf)
        $conf = (
            $NeoVimDescriptions
                | zip $NeoVimDistros
                | where { ($in | first) == $choice }
                | first
                | last
        )
    }

    match $conf {
        "default" | "neovim" => {
            $env.NVIM_APPNAME = ""
            print "Changed to default config"
        },
        "lunarvim" => {
            $env.XDG_DATA_HOME = if ($env.XDG_DATA_HOME | is-not-empty) { $env.XDG_DATA_HOME } else { $env.APPDATA }
            $env.LUNARVIM_RUNTIME_DIR = if ($env.LUNARVIM_RUNTIME_DIR | is-not-empty) { $env.LUNARVIM_RUNTIME_DIR } else { $'($env.XDG_DATA_HOME)\lunarvim' }
            $env.LUNARVIM_BASE_DIR = if ($env.LUNARVIM_BASE_DIR | is-not-empty) { $env.LUNARVIM_BASE_DIR } else { $'($env.LUNARVIM_RUNTIME_DIR)\lvim' }
            $env.LUNARVIM_PS1 = $'($env.LUNARVIM_BASE_DIR)\utils\bin\lvim.ps1'
            print "Started LunarVim"
            pwsh $env.LUNARVIM_PS1
        },
        "clean" => {
            nvim --clean
        },
        _ => {
            $env.NVIM_APPNAME = $conf
            print $"Changed to ($conf) config"
        }
    }
}
