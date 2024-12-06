#!/usr/bin/env pwsh
$__WTWD = Join-Path $PSScriptRoot "wtwd.ps1"
. $__WTWD
$__WLF = Join-Path $PSScriptRoot "wlf.ps1"
. $__WLF
$__Alacritty = Join-Path $PSScriptRoot "alacritty.ps1"
. $__Alacritty
$__UnixCompleters = Join-Path $PSScriptRoot "UnixCompleters.ps1"
. $__UnixCompleters
$__Variables = Join-Path $PSScriptRoot "Variables.ps1"
. $__Variables
