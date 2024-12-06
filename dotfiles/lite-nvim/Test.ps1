#!/usr/bin/env pwsh
$tmp = $env:NVIM_APPNAME
$env:NVIM_APPNAME = 'nvim2'
nvim
$env:NVIM_APPNAME = $tmp