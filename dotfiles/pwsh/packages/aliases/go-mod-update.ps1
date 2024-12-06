#!/usr/bin/env pwsh
function Global:Update-GoPackage(
    [Parameter(Mandatory=$true, Position=0)]
    [String] $PackageName,
    [Parameter(Mandatory=$false, Position=1)]
    [String] $Branch
) {
    if ([string]::IsNullOrWhiteSpace($Branch)) {
        $Branch = "main"
    }
    go get -u "github.com/$PackageName@$(gh api "repos/$PackageName/branches/$Branch" --jq ".commit.sha")"
}
