#!/usr/bin/env nu
def --env "Update-GoPackage" [$PackageName: string, $BranchName?: string] {
    mut $branch = $BranchName
    if ($BranchName | is-empty) {
        $branch = "main"
    }
    let $branchSha = (gh api $"repos/($PackageName)/branches/($branch)" --jq ".commit.sha")
    go get -u $"github.com/($PackageName)@($branchSha)"
}
