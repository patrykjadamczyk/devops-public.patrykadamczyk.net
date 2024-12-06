#!/usr/bin/env nu

##### Variables

const _IsWindows = $nu.os-info.name == "windows" and $nu.os-info.family == "windows"
const _IsLinux = $nu.os-info.name == "linux" and $nu.os-info.family == "unix"
const _IsMacOS = $nu.os-info.name == "macos" and $nu.os-info.family == "unix"

let _IsWSL = $_IsLinux and ("/proc/version" | path exists) and (open "/proc/version" | into string | str contains "Microsoft")

const _PatLockfilesBasePath = "~/go/src/devops.patrykadamczyk.net/lockfiles/"

##### Flags
const _PatPackageManagerUpdateAllGlobalPackages = true
const _PatPackageManagerUpdateAllUpdatesLockfile = true
const _PatPackageManagerPreferNalaOverApt = true
const _PatPackageManagerRustThreads = 8
const _PatPackageManagerRustNightly = true
const _PatPackageManagerRustCache = false
const _PatPackageManagerRustSCache = true
const _PatPackageManagerRustBinstall = true
const _PatPackageManagerRustQuickinstall = true
const _PatPackageManagerRustCargoUpdate = true