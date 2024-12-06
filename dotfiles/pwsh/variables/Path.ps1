#!/usr/bin/env pwsh
if ($_IsWindows) {
    return
}

$pathConfigSuffix = @(
    "~/.cargo/bin",
    "~/.local/share/bob/nvim-bin",
    "~/go/bin",
    "~/.nix-profile/bin"
);
$pathConfigPrefix = @(
    "~/.dotnet"
    # "~/.nix-profile/bin"
);

foreach ($path in $pathConfigSuffix) {
    if (Test-Path $path) {
        $path = Resolve-Path $path;
        $env:PATH += ":$path";
    }
}

foreach ($path in $pathConfigPrefix) {
    if (Test-Path $path) {
        $path = Resolve-Path $path;
        $env:PATH = "$path`:$env:PATH";
    }
}
