#!/usr/bin/env nu

# For LSP
# source-env ~/.config/nushell/env.nu
# source ~/.config/nushell/config.nu

# Brew
pm install brew gleam
pm install brew haxe
pm install brew tea
pm install brew vfox
### https://github.com/tbillington/kondo
pm install brew kondo
pm install brew comby
pm install brew bat-extras
pm install brew typst
pm install brew television
pm install brew jaq

# Node
#### Package Managers
pm install npm npm
pm install npm yarn
pm install npm pnpm
pm install npm bun

#### Packages
if (pm status bun) {
    pm install bun carbonyl
    pm install bun editorconfig
    pm install bun jsonlint
    pm install bun mapscii
    pm install bun nodemon
    pm install bun neovim
} else if (pm status pnpm) {
    pm install pnpm carbonyl
    pm install pnpm editorconfig
    pm install pnpm jsonlint
    pm install pnpm mapscii
    pm install pnpm nodemon
    pm install pnpm neovim
} else {
    pm install npm carbonyl
    pm install npm editorconfig
    pm install npm jsonlint
    pm install npm mapscii
    pm install npm nodemon
    pm install npm neovim
}

# Nushell
pm install rust nu
pm install rust nu_plugin_gstat
pm install rust nu_plugin_periodic_table
pm install rust nu_plugin_net
pm install rust nu_plugin_polars
pm install rust nu_plugin_query
pm install rust nu_plugin_explore_ir
pm install rust nu_plugin_skim
pm install rust nu_plugin_highlight
pm install rust nu_plugin_clipboard

try {
    nu -c "plugin add ~/.cargo/bin/nu_plugin_gstat"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_periodic_table"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_net"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_polars"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_query"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_explore_ir"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_skim"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_highlight"
    nu -c "plugin add ~/.cargo/bin/nu_plugin_clipboard"
}

# Python

#### Pip
pm install pip pynvim
pm install pip neovim
pm install pip pip
pm install pip pipx
pm install pip virtualenv
pm install pip ipython
pm install pip icescream
pm install pip requests
pm install pip setuptools
pm install pip packaging
pm install pip rich
pm install pip pygments
pm install pip argcomplete
pm install pip pytz
pm install pip pytzdata
pm install pip requests

pm install pip pycparser
pm install pip certifi
pm install pip charset-normalizer
pm install pip python-dateutil
pm install pip idna
pm install pip lxml
pm install pip markupsafe
pm install pip pyparsing
pm install pip tabulate
pm install pip urllib3
pm install pip pprintpp
pm install pip pyyaml
pm install pip pyyaml-include
pm install pip numpy
pm install pip matplotlib

pm install pip tree-sitter
pm install pip tree-sitter-languages
pm install pip wheel

#### Pipx
pm install pipx jinja2
pm install pipx sphinx
pm install pipx yq
pm install pipx twine
pm install pipx harlequin
pm install pipx tiptop
pm install pipx ilua
pm install pipx jupyterlab
pipx inject jupyterlab ilua
pm install pipx rich-cli

# Ruby

#### Gem
gem install neovim

# Rust
## Optimization (installed directly)
cargo install --locked sccache
cargo install --locked cargo-binstall
cargo install --locked cargo-quickinstall
cargo install --locked cargo-update
## Tools (that can be installed by alias)
pm install rust lsd
pm install rust tree-sitter-cli
pm install rust create-tauri-app
pm install rust just
pm install rust navi
pm install rust coreutils
pm install rust hyperfine
pm install rust gitoxide
pm install rust onefetch
pm install rust hexyl
pm install rust numbat-cli
pm install rust pueue
### https://github.com/chmln/sd
pm install rust sd
### https://github.com/pvolok/mprocs
pm install rust mprocs
### https://github.com/Canop/bacon
pm install rust bacon
### https://github.com/PRQL/prql
pm install rust pqrlc
### FZF in rust https://github.com/lotabout/skim
pm install rust skim
### https://github.com/dalance/procs
pm install rust procs
### https://github.com/ClementTsang/bottom
pm install rust bottom
### https://github.com/Wilfred/difftastic
pm install rust difftastic
### https://github.com/BurntSushi/xsv
pm install rust xsv
### https://github.com/bytecodealliance/wasmtime
curl https://wasmtime.dev/install.sh -sSf | bash
### https://github.com/ducaale/xh
# pm install rust xh
#### if this does not work do:
#### curl -sfSL https://raw.githubusercontent.com/innobead/huber/master/hack/install.sh | bash
#### ln -s ~/.huber/bin/huber ~/.local/bin/huber
pm install rust huber
### https://github.com/ogham/dog -> https://github.com/Dj-Codeman/doge
### (orig is not maintained)
# pm install rust dog
pm install rust dns-doge
### https://github.com/wezm/rsdate
pm install rust rsdate
### https://github.com/theryangeary/choose
pm install rust choose
### https://github.com/pemistahl/grex | regex maker
pm install rust grex
### https://github.com/tealdeer-rs/tealdeer
pm install rust tealdeer
### Markdown viewer
pm install rust mdcat
### Compression helper
pm install rust ouch
### Spotify player
cargo install --git https://github.com/aome510/spotify-player.git spotify_player --features lyric-finder,image,sixel,notify,fzf --locked
### https://github.com/flamegraph-rs/flamegraph
#### Dependencies
bash -c "sudo apt install linux-tools-common linux-tools-generic linux-tools-`uname -r`"
#### App itself
pm install rust flamegraph
## Tools (that need special flags)
cargo +nightly install --git https://github.com/MordechaiHadad/bob.git
cargo +nightly install --git https://github.com/neovide/neovide.git
cargo +nightly install stylua --features lua52,lua53,lua54,luau
cargo +nightly install --git https://github.com/cloudhead/rx --tag v0.5.2
cargo +nightly install --git https://github.com/RustPython/RustPython rustpython --features ssl,jit

# Ubuntu
if (false) {
    sudo add-apt-repository ppa:bartbes/love-stable
    sudo apt update
    sudo apt install love
}

# Go
go install github.com/charmbracelet/vhs@latest
go install github.com/charmbracelet/freeze@latest
go install github.com/charmbracelet/skate@latest
go install github.com/charmbracelet/gum@latest
go install github.com/charmbracelet/glow@latest
go install github.com/charmbracelet/hotdiva2000/cmd/hotdiva2000@latest
go install github.com/tomwright/dasel/v2/cmd/dasel@master
go install github.com/mikefarah/yq/v4@latest
go install github.com/marwanhawari/stew@latest
go install github.com/dlvhdr/diffnav@latest
go install github.com/xwjdsh/manssh/cmd/manssh@latest
go install github.com/boyter/scc@master
go install github.com/hay-kot/scaffold@latest
go install github.com/charmbracelet/sequin@latest

go install github.com/air-verse/air@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# Other Apps
### https://github.com/flxzt/rnote
pm install winget flxzt.rnote
pm install flatpak com.github.flxzt.rnote
### hostctl
pm install scoop hostctl
# pm install brew guumaster/tap/hostctl | NIX
### Dependency of vhs
pm install winget tsl0922.ttyd
pm install brew ttyd

# Carapace
pm install brew carapace
# winget install -e --id rsteube.Carapace
# scoop bucket add extras
# scoop install extras/carapace-bin

# Yazi
ya pack -a Lil-Dank/lazygit
ya pack -a dedukun/bookmarks
ya pack -a imsi32/yatline
ya pack -a imsi32/yatline-catppuccin
ya pack -a lpanebr/yazi-plugins:yatline-symlink

# source ./Vfox.nu
source ./Mise.nu
