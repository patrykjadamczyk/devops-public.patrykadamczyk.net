#!/usr/bin/env nu
const RealProfileDir = $nu.default-config-dir
const RealProfile = $nu.config-path

if ($_IsWindows) {
    let APPDATA = ($env.APPDATA | path join "..")
    let LocalAppData = $env.LOCALAPPDATA
    let RoamingAppData = $env.APPDATA
    let LocalLowAppData = ($APPDATA | path join "LocalLow")
}

let HostsFile = "/" | path join "etc" "hosts";
if ($_IsWindows) {
    let HostsFile = $env.WINDIR | path join "System32" "drivers" "etc" "hosts";
}

try {
    if ($env.ZELLIJ != null) {
        if ($env.LD_LIBRARY_PATH != null) {
            $env.LD_LIBRARY_PATH = ""
        }
    }
}

try {
    let ZEIT_DB = "~" | path join "go" "src" "devops.patrykadamczyk.net" "dotfiles" "zeit" "zeit.db" | path expand
    if ($ZEIT_DB | path exists) {
        $env.ZEIT_DB = ($ZEIT_DB)
    }
}
