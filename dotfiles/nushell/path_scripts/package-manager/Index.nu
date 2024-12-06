#!/usr/bin/env nu

use std/dirs shells-aliases *

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
def --env "main upgrade" [] {
    print "Trying to update all packages in winget"
    main upgrade winget
    print "Trying to update all packages in choco"
    main upgrade choco
    print "Trying to update all packages in scoop"
    main upgrade scoop
    if ((main status nala) and ($_PatPackageManagerPreferNalaOverApt)) {
        print "Trying to update all packages in nala"
        main upgrade nala
    } else {
        print "Trying to update all packages in apt"
        main upgrade apt
    }
    print "Trying to update all packages in yum"
    main upgrade yum
    print "Trying to update all packages in dnf"
    main upgrade dnf
    print "Trying to update all packages in pacman"
    main upgrade pacman
    print "Trying to update all packages in pacstall"
    main upgrade pacstall
    print "Trying to update all packages in apk"
    main upgrade apk
    print "Trying to update all packages in flatpak"
    main upgrade flatpak
    print "Trying to update all packages in snap"
    main upgrade snap
    print "Trying to update all packages in brew"
    main upgrade brew
    print "Trying to update all packages in brewcask"
    main upgrade brewcask
    print "Trying to update all packages in mas"
    main upgrade mas

    if ($_PatPackageManagerUpdateAllGlobalPackages) {
        print "Trying to update all packages in npm"
        main upgrade npm
        print "Trying to update all packages in pnpm"
        main upgrade pnpm
        print "Trying to update all packages in yarn"
        main upgrade yarn
        print "Trying to update all packages in bun"
        main upgrade bun
        print "Trying to update all packages in pipx"
        main upgrade pipx
        print "Trying to update all packages in rust"
        main upgrade rust
    }

    if ($_PatPackageManagerUpdateAllUpdatesLockfile) {
        main update-lockfile
    }
    return true
}

##### Update all global lockfiles

# Upgrade packages
def --env "main update-lockfile" [] {
    print "Trying to update lockfile of npm"
    main update-lockfile npm
    print "Trying to update lockfile of pnpm"
    main update-lockfile pnpm
    print "Trying to update lockfile of yarn"
    main update-lockfile yarn
    print "Trying to update lockfile of bun"
    main update-lockfile bun
    print "Trying to update lockfile of pip"
    main update-lockfile pip
    print "Trying to update lockfile of pipx"
    main update-lockfile pipx
    print "Trying to update lockfile of go"
    main update-lockfile go
    print "Trying to update lockfile of rust"
    main update-lockfile rust
    return true
}

##### Update all global lockfiles

# Clean unused packages
def --env "main clean" [] {
    print "Trying to clean unused packages in flatpak"
    main clean flatpak
    print "Trying to clean unused packages in snap"
    main clean snap
    print "Trying to clean unused packages in homemanager"
    main clean homemanager
    return true
}

# Deep clean unused packages
def --env "main deepclean" [] {
    main clean
    print "Trying to deepclean unused packages in homemanager"
    main deepclean homemanager
    return true
}
