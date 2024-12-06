#!/usr/bin/env pwsh
function Global:bob_use_dev () {
    # $version = $(nush "http get https://api.github.com/repos/neovim/neovim/branches/master | get commit.sha")
    $version = $(gh api repos/neovim/neovim/commits/master --paginate=false --jq .sha)
    Write-Host "Downloading $version of neovim and building it"
    bob use $version
}
