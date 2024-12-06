#!/usr/bin/env nu

alias New-TemporaryFile = mktemp -t
alias New-TemporaryDirectory = mktemp -d
alias Set-LocationToTemporaryDirectory = cd (mktemp -d)
