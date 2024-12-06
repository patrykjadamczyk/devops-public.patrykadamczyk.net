#!/usr/bin/env pwsh
Write-Host "Ensuring grcov is installed"

cargo install grcov

Write-Host "Setting up environment"

$oldRustFlags = $env:RUSTFLAGS + ""
$oldLLVM = $env:LLVM_PROFILE_FILE + ""

$env:RUSTFLAGS="-C instrument-coverage"
$env:LLVM_PROFILE_FILE="default.profraw"

Write-Host "Cleaning build data"

cargo clean

Write-Host "Specify additional arguments to build command (Ctrl+D to finish, escape to leave empty)"

$additionalArguments = (gum write --placeholder "Specify additional arguments to build command")

Write-Host "Executing: cargo build $additionalArguments"

Invoke-Expression "cargo build $additionalArguments".TrimEnd()

Write-Host "Executing: cargo test"

cargo test

Write-Host "Asking for binary"

$executable = Get-ChildItem -Path ./target/debug -Recurse
    | ForEach-Object { $_.FullName }
    | Invoke-Fzf -Prompt "Specify executable to check > "

Write-Host "Compiling coverage data"

grcov -t html -b $executable .

Write-Host "Cleaning up environment"

$env:RUSTFLAGS = $oldRustFlags
$env:LLVM_PROFILE_FILE = $oldLLVM
