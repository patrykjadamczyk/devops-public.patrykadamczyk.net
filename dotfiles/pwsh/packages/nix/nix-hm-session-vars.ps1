#!/usr/bin/env pwsh
$HomeManagerSessionVarsPath = "~/.nix-profile/etc/profile.d/hm-session-vars.sh"
if (Test-Path $HomeManagerSessionVarsPath) {
    Get-Content -Path $HomeManagerSessionVarsPath | ForEach-Object {
        if ($_.StartsWith('export')) {
            # Deconstruction of export
            $varName = $_.Split('=')[0].Substring('export '.Length)
            $varValue = $_.Split('=')[1]
            # Ignore quotes on string values
            $varValue = $varValue.StartsWith('"') ? $varValue.TrimStart('"') : $varValue
            $varValue = $varValue.EndsWith('"') ? $varValue.TrimEnd('"') : $varValue
            # Setting environment variable
            Set-Item -Path Env:$varName -Value $varValue
        }
    }
}
