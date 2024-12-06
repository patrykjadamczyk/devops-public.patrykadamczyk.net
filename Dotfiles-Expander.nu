#!/usr/bin/env nu
# Base Variables
let $BasePath = $env.FILE_PWD | path expand
const $ConfigName = "expand.config.json"
let $ConfigFile = $BasePath | path join $ConfigName
let $BaseDotfiles = $BasePath | path join "dotfiles"

# OS
const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"

# Utility Functions
# EnsurePath = mkdir
def EnsureOs [$oses?: list] {
    if ($oses | is-empty) {
        return true
    }
    $oses
        | each {
            match ($in | into string | str downcase) {
                "windows" => {
                    $_IsWindows
                }
                "linux" => {
                    $_IsLinux
                }
                "macos" => {
                   $_IsMacOS
                }
                _ => {
                    print $"(ansi red)Unknown OS: ($in)(ansi reset)"
                    false
                }
            }
        }
        | any { $in }
}
def TemplatePath [$path: string] {
    mut $PowerShellConfigDir = "~" | path join ".config" "powershell"
    mut $ConfigDir = "~" | path join ".config"
    mut $RootConfigDir = "~" | path join ".config"
    mut $LocalConfigDir = "~" | path join ".config"
    mut $LocalLowConfigDir = "~" | path join ".config"
    mut $RoamingConfigDir = "~" | path join ".config"
    mut $AppSupportConfigDir = "~" | path join ".config"
    mut $XdgAppSupportConfigDir = "~" | path join ".config"

    if ($_IsWindows) {
        $PowerShellConfigDir = ("~" | path join "Documents" "PowerShell")
        $RootConfigDir = ($env.APPDATA | path join "..")
        $LocalConfigDir = $env.LOCALAPPDATA
        $LocalLowConfigDir = ($env.APPDATA | path join ".." "LocalLow")
        $RoamingConfigDir = $env.APPDATA
        $AppSupportConfigDir = $env.APPDATA
        $XdgAppSupportConfigDir = $env.APPDATA
    } else if ($env.XDG_CONFIG_HOME? | is-not-empty) {
        $PowerShellConfigDir = ($env.XDG_CONFIG_HOME | path join "powershell")
        $ConfigDir = $env.XDG_CONFIG_HOME
        $RootConfigDir = $env.XDG_CONFIG_HOME
        $LocalConfigDir = $env.XDG_CONFIG_HOME
        $LocalLowConfigDir = $env.XDG_CONFIG_HOME
        $RoamingConfigDir = $env.XDG_CONFIG_HOME
        $XdgAppSupportConfigDir = $env.XDG_CONFIG_HOME
    }
    if ($_IsMacOS) {
        $AppSupportConfigDir = ("~" | path join "Library" "Application Support")
        $XdgAppSupportConfigDir = ("~" | path join "Library" "Application Support")
    }
    let $XDG_DATA_HOME = if ($env.XDG_DATA_HOME? | is-not-empty) {
        $env.XDG_DATA_HOME
    } else if ($env.APPDATA? | is-not-empty) {
        $env.APPDATA
    } else {
        "~/.local/share"
    }
    let $XDG_CONFIG_HOME = if ($env.XDG_CONFIG_HOME? | is-not-empty) {
        $env.XDG_CONFIG_HOME
    } else if ($env.LOCALAPPDATA? | is-not-empty) {
        $env.LOCALAPPDATA
    } else {
        $LocalConfigDir
    }
    let $XDG_CACHE_HOME = if ($env.XDG_CACHE_HOME? | is-not-empty) {
        $env.XDG_CACHE_HOME
    } else if ($env.TEMP? | is-not-empty) {
        $env.TEMP
    } else {
        "~/.cache"
    }
    let $XDG_STATE_HOME = if ($env.XDG_STATE_HOME? | is-not-empty) {
        $env.XDG_STATE_HOME
    } else if ($env.LOCALAPPDATA? | is-not-empty) {
        $env.LOCALAPPDATA
    } else {
        $LocalConfigDir
    }

    mut $replacedPath = $path
        | str replace "%PowerShellConfigDir%" $PowerShellConfigDir
        | str replace "%ConfigDir%" $ConfigDir
        | str replace "%RootConfigDir%" $RootConfigDir
        | str replace "%LocalConfigDir%" $LocalConfigDir
        | str replace "%LocalLowConfigDir%" $LocalLowConfigDir
        | str replace "%RoamingConfigDir%" $RoamingConfigDir
        | str replace "%XDG_DATA_HOME%" $XDG_DATA_HOME
        | str replace "%XDG_CONFIG_HOME%" $XDG_CONFIG_HOME
        | str replace "%XDG_CACHE_HOME%" $XDG_CACHE_HOME
        | str replace "%XDG_STATE_HOME%" $XDG_STATE_HOME
        | str replace "%AppSupportConfigDir%" $AppSupportConfigDir
        | str replace "%XdgAppSupportConfigDir%" $XdgAppSupportConfigDir
    let $t1 = ($env
        | transpose
        | where { ($in.column1 | describe) == "string" }
        | each { |t2|
            [$"%env:($t2.column0)%" ($t2.column1)]
        }
    )
    for $envvar in $t1 {
        $replacedPath = ($replacedPath | str replace ($envvar.0) ($envvar.1))
    }
    return $replacedPath
}

# Welcome Message
print $"(ansi green)Welcome to Dotfile Expander v0.2 Nushell(ansi reset)"
print $"(ansi green)--------------------------------(ansi reset)"

# Config Read
print $"(ansi green)Reading config file: ($ConfigFile)(ansi reset)"
let $ConfigObject = open $ConfigFile
let $ExpanderSections = $ConfigObject.sections

for $ExpanderSection in $ExpanderSections {
    print $"(ansi green)Starting expanding ($ExpanderSection.title)(ansi reset)"
    if ((EnsureOs $ExpanderSection.os?) == false) {
        print $"(ansi blue)Skipping section: ($ExpanderSection.title) because it's not for this operating system(ansi reset)"
        print $"(ansi blue)OS needed for this section: ($ExpanderSection.os)(ansi reset)"
        continue
    }

    for $ExpanderItem in $ExpanderSection.items {
        let $ExpanderItemType = $ExpanderItem.type
        let $ExpanderItemLocation = (TemplatePath $ExpanderItem.location | path expand -n)
        let $ExpanderItemFrom = ($BaseDotfiles | path join (if ($ExpanderItem.file? | is-not-empty) { $ExpanderItem.file } else { $ExpanderItem.directory }) | path expand -n)

        if ((EnsureOs $ExpanderItem.os?) == false) {
            print $"(ansi blue)Skipping item: ($ExpanderItemFrom) -> ($ExpanderItemLocation) because it's not for this operating system(ansi reset)"
            print $"(ansi blue)OS needed for this section: ($ExpanderItem.os)(ansi reset)"
            continue
        }
        if ($ExpanderItemLocation | path exists) {
            print $"(ansi blue)Skipping item: ($ExpanderItemFrom) -> ($ExpanderItemLocation) because it already exists(ansi reset)"
            continue
        }
        match ($ExpanderItemType) {
            "file" => {
                print $"(ansi yellow)Expanding file: ($ExpanderItemFrom) to ($ExpanderItemLocation)"
                try {
                    mkdir ($ExpanderItemLocation | path dirname)
                    cp -f $ExpanderItemFrom $ExpanderItemLocation
                }
            }
            "symlink" => {
                print $"(ansi yellow)Expanding symlink: ($ExpanderItemFrom) to ($ExpanderItemLocation)(ansi reset)"
                try {
                    mkdir ($ExpanderItemLocation | path dirname)
                    # Use coreutils from uutils
                    # TODO: Change this to native nushell ln when it will land there (maybe at some point it will)
                    coreutils ln -s -T $ExpanderItemFrom $ExpanderItemLocation
                }
            }
            "directory" => {
                print $"(ansi yellow)Expanding directory: ($ExpanderItemFrom) to ($ExpanderItemLocation)(ansi reset)"
                try {
                    mkdir ($ExpanderItemLocation | path dirname)
                    cp -r -f $ExpanderItemFrom $ExpanderItemLocation
                }
            }
            "directory-symlink" => {
                print $"(ansi yellow)Expanding directory-symlink: ($ExpanderItemFrom) to ($ExpanderItemLocation)(ansi reset)"
                try {
                    mkdir ($ExpanderItemLocation | path dirname)
                    # Use coreutils from uutils
                    # TODO: Change this to native nushell ln when it will land there (maybe at some point it will)
                    coreutils ln -s -T $ExpanderItemFrom $ExpanderItemLocation
                }
            }
            _ => {
                print $"(ansi red)Unknown item type: ($ExpanderItemType)(ansi reset)"
            }
        }
    }
}
