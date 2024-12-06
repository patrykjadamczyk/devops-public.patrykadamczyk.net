#!/usr/bin/env nu

# $env._IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
# $env._IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
# $env._IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"

const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"
const _os = if ($_IsWindows) {
    "Windows"
} else if ($_IsLinux) {
    "Linux"
} else if ($_IsMacOS) {
    "MacOS"
} else {
    "Other"
}
const _os_l = if ($_IsWindows) {
    "windows"
} else if ($_IsLinux) {
    "linux"
} else if ($_IsMacOS) {
    "macOS"
} else {
    "other"
}
