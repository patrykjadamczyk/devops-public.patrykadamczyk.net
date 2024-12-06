#!/usr/bin/env nu

source ./_vars.nu

# Status of Nix Home Manager Package Manager
def --env "pm status homemanager" [] {
    return (which home-manager | is-not-empty)
}

# Upgrade packages using Nix Home Manager
def --env "pm upgrade homemanager" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # Force home-manager to work properly (first errors out about news files for some reason)
    ^home-manager switch --impure
    ^home-manager switch --impure
    return true
}

# Upgrade packages using Nix Home Manager
def --env "pm clean-upgrade homemanager" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # GC of nix
    ^nix-collect-garbage
    # Force home-manager to work properly (first errors out about news files for some reason)
    ^home-manager switch --impure
    ^home-manager switch --impure
    return true
}

# Upgrade packages using Nix Home Manager
def --env "pm deepclean-upgrade homemanager" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # GC of nix
    ^nix-collect-garbage --delete-old
    # Force home-manager to work properly (first errors out about news files for some reason)
    ^home-manager switch --impure
    ^home-manager switch --impure
    return true
}

# Upgrade packages using Nix Home Manager
def --env "pm clean homemanager" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # GC of nix
    ^nix-collect-garbage
    return true
}

# Upgrade packages using Nix Home Manager
def --env "pm deepclean homemanager" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # GC of nix
    ^nix-collect-garbage --delete-old
    return true
}

# Update fast ring using Nix Home Manager
def --env "pm update homemanager" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    enter ~/.config/home-manager
    ^nix flake update
    dexit
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # Force home-manager to work properly (first errors out about news files for some reason)
    ^home-manager switch --impure
    ^home-manager switch --impure
    return true
}

# Update fast ring using Nix Home Manager
def --env "pm update homemanager fast-ring" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    enter ~/.config/home-manager
    ^nix flake update
    dexit
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # Force home-manager to work properly (first errors out about news files for some reason)
    ^home-manager switch --impure
    ^home-manager switch --impure
    return true
}

# Update slow ring using Nix Home Manager
def --env "pm update homemanager slow-ring" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    enter ~/.config/home-manager
    open ~/.config/home-manager/flake.nix
        | lines
        | each {
            if ($in | str trim | str starts-with "nixpkgs_slow_ring.url =") {
                $in
                    | split row "\""
                    | each {
                        if ($in | str starts-with "github:nixos/nixpkgs/") {
                            $"github:nixos/nixpkgs/(
                                ^gh api $"repos/nixos/nixpkgs/branches/master" --jq ".commit.sha"
                            )"
                        } else {
                            $in
                        }
                    }
                    | str join "\""
            } else {
                $in
            }
        }
        | save -f ./flake.nix
    ^nix flake update
    dexit
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # Force home-manager to work properly (first errors out about news files for some reason)
    ^home-manager switch --impure
    ^home-manager switch --impure
    return true
}

# Update slowest ring using Nix Home Manager
def --env "pm update homemanager slowest-ring" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    enter ~/.config/home-manager
    open ~/.config/home-manager/flake.nix
        | lines
        | each {
            if ($in | str trim | str starts-with "nixpkgs_slowest_ring.url =") {
                $in
                    | split row "\""
                    | each {
                        if ($in | str starts-with "github:nixos/nixpkgs/") {
                            $"github:nixos/nixpkgs/(
                                ^gh api $"repos/nixos/nixpkgs/branches/master" --jq ".commit.sha"
                            )"
                        } else {
                            $in
                        }
                    }
                    | str join "\""
            } else {
                $in
            }
        }
        | save -f ./flake.nix
    ^nix flake update
    dexit
    $env.NIXPKGS_ALLOW_UNFREE = 1
    # Force home-manager to work properly (first errors out about news files for some reason)
    ^home-manager switch --impure
    ^home-manager switch --impure
    return true
}

# Run package without installing it using Nix Home Manager
def --env "pm run-remote homemanager" [$package: string] {
    if ((pm status homemanager) == false) {
        return false
    }
    ^nix-shell -p $package
    return true
}

# Read news using Nix Home Manager
def --env "pm news homemanager" [] {
    if ((pm status homemanager) == false) {
        return false
    }
    $env.NIXPKGS_ALLOW_UNFREE = 1
    ^home-manager news
    return true
}
