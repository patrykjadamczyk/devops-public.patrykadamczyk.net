#!/usr/bin/env nu

# Use newest version of neovim (latest master)
def --env bob_use_dev [] {
    # let version = (http get https://api.github.com/repos/neovim/neovim/branches/master | get commit.sha)
    let version = (^gh api repos/neovim/neovim/commits/master --paginate=false --jq .sha)
    echo $"Downloading ($version) of neovim and building it"
    bob use $version
}
