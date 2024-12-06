#!/usr/bin/env nu

$env.DOTNET_ROOT = "~/.version-fox/cache/dotnet/current"
$env.DOTNET_ROOT = ($env.DOTNET_ROOT | path expand)
