#!/usr/bin/env nu
return
# Base Variables
let $BasePath = $env.FILE_PWD | path expand
let $BaseDotfiles = $BasePath | path join "dotfiles"

print $"(ansi green)Welcome to Dotfile Installer v0.2 Nushell(ansi reset)"
print $"(ansi green)---------------------------------(ansi reset)"

print $"(ansi green)Finding installer scripts(ansi reset)"
let $ScriptsPath = $"($BaseDotfiles)/**/Install.nu"
let $InstallerScripts = glob $ScriptsPath

$InstallerScripts
    | enumerate
    | each {
        let $percent = ($in.index / ($InstallerScripts | length)) * 100
        print $"(ansi green)Installing... ($percent)% \(($in.index | first)/($InstallerScripts | length)\)(ansi reset)"
        print $"(ansi green)Installer Script: ($in.item)(ansi reset)"
        ^nu $"($in.item | first)"
        "" # Return
    }


const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"
const os = if ($_IsWindows) {
    "windows"
} else if ($_IsLinux) {
    "linux"
} else if ($_IsMacOS) {
    "macos"
} else {
    "other"
}

print $"(ansi green)Finding os specific installer scripts(ansi reset)"
let $ScriptsPath = $"($BaseDotfiles)/**/Install.($os).nu"
let $InstallerScripts = glob $ScriptsPath

$InstallerScripts
    | enumerate
    | each {
        let $percent = ($in.index.0 / ($InstallerScripts | length)) * 100
        print $"(ansi green)Installing... ($percent)% \(($in.index | first)/($InstallerScripts | length)\)(ansi reset)"
        print $"(ansi green)Installer Script: ($in.item)(ansi reset)"
        ^nu $"($in.item | first)"
        "" # return
    }
