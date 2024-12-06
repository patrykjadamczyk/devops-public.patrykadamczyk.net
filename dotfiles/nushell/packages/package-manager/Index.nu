#!/usr/bin/env nu

# Windows
source ./winget.nu
source ./choco.nu
source ./scoop.nu
# Linux
## Distribution
source ./apt.nu
source ./yum.nu
source ./dnf.nu
source ./pacman.nu
source ./apk.nu
## Alternatives
source ./nala.nu
## Cross Distribution
source ./pacstall.nu
source ./flatpak.nu
source ./snap.nu
# Linux & Mac OS X
source ./brew.nu
source ./nix.nu
source ./nix-homemanager.nu
# Mac OS X
source ./brewcask.nu
source ./mas.nu
# Special
source ./devops.nu
source ./git.nu
source ./gh.nu
# Language specific package managers - global packages
## JavaScript
source ./js-npm.nu
source ./js-pnpm.nu
source ./js-yarn.nu
source ./js-bun.nu
## Python
source ./py-pip3.nu
source ./py-pipx.nu
## Go
source ./go.nu
## Rust
source ./rust.nu

##### Update all system packages

# Upgrade packages
def --env "pm upgrade" [] {
    print "Trying to update all packages in winget"
    pm upgrade winget
    print "Trying to update all packages in choco"
    pm upgrade choco
    print "Trying to update all packages in scoop"
    pm upgrade scoop
    if ((pm status nala) and ($_PatPackageManagerPreferNalaOverApt)) {
        print "Trying to update all packages in nala"
        pm upgrade nala
    } else {
        print "Trying to update all packages in apt"
        pm upgrade apt
    }
    print "Trying to update all packages in yum"
    pm upgrade yum
    print "Trying to update all packages in dnf"
    pm upgrade dnf
    print "Trying to update all packages in pacman"
    pm upgrade pacman
    print "Trying to update all packages in pacstall"
    pm upgrade pacstall
    print "Trying to update all packages in apk"
    pm upgrade apk
    print "Trying to update all packages in flatpak"
    pm upgrade flatpak
    print "Trying to update all packages in snap"
    pm upgrade snap
    print "Trying to update all packages in brew"
    pm upgrade brew
    print "Trying to update all packages in brewcask"
    pm upgrade brewcask
    print "Trying to update all packages in mas"
    pm upgrade mas

    if ($_PatPackageManagerUpdateAllGlobalPackages) {
        print "Trying to update all packages in npm"
        pm upgrade npm
        print "Trying to update all packages in pnpm"
        pm upgrade pnpm
        print "Trying to update all packages in yarn"
        pm upgrade yarn
        print "Trying to update all packages in bun"
        pm upgrade bun
        print "Trying to update all packages in pipx"
        pm upgrade pipx
        print "Trying to update all packages in rust"
        pm upgrade rust
    }

    if ($_PatPackageManagerUpdateAllUpdatesLockfile) {
        pm update-lockfile
    }
    return true
}

##### Update all global lockfiles

# Upgrade packages
def --env "pm update-lockfile" [] {
    print "Trying to update lockfile of npm"
    pm update-lockfile npm
    print "Trying to update lockfile of pnpm"
    pm update-lockfile pnpm
    print "Trying to update lockfile of yarn"
    pm update-lockfile yarn
    print "Trying to update lockfile of bun"
    pm update-lockfile bun
    print "Trying to update lockfile of pip"
    pm update-lockfile pip
    print "Trying to update lockfile of pipx"
    pm update-lockfile pipx
    print "Trying to update lockfile of go"
    pm update-lockfile go
    print "Trying to update lockfile of rust"
    pm update-lockfile rust
    return true
}

##### Update all global lockfiles

# Clean unused packages
def --env "pm clean" [] {
    print "Trying to clean unused packages in flatpak"
    pm clean flatpak
    print "Trying to clean unused packages in snap"
    pm clean snap
    print "Trying to clean unused packages in homemanager"
    pm clean homemanager
    return true
}

# Deep clean unused packages
def --env "pm deepclean" [] {
    pm clean
    print "Trying to deepclean unused packages in homemanager"
    pm deepclean homemanager
    return true
}