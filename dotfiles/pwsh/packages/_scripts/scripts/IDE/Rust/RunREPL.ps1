#!/usr/bin/env pwsh
Write-Host "Ensuring evcxr is installed"

cargo install evcxr evcxr_repl

Write-Host "Starting Rust REPL"

evcxr

