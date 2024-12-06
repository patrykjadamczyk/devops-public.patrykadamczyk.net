#!/usr/bin/env nu

source ./_vars.nu

# Status of GO Package Manager
def --env "pm status go" [] {
    return (which go | is-not-empty)
}

# Install package using GO
def --env "pm install go" [$package: string] {
    if ((pm status go) == false) {
        return false
    }
    ^go install $package
    return true
}

# Update package using GO
def --env "pm update go" [$package: string] {
    if ((pm status go) == false) {
        return false
    }
    ^go install $package
    return true
}

# Update package using GO using commit hash instead of default handling (tags)
def --env "pm force-update go" [$package: string] {
    if ((pm status go) == false) {
        return false
    }
    if (which gh | is-empty) {
        return false
    }
    let PackageName = $package | split row "@" | first
    mut BranchName = $package | split row "@" | last
    if ($BranchName == $PackageName) {
        $BranchName = "main"
    }
    let $branchSha = (gh api $"repos/($PackageName)/branches/($BranchName)" --jq ".commit.sha")
    ^go install $"github.com/($PackageName)@($branchSha)"
    return true
}

# Update lockfile of GO in dotfiles
def --env "pm update-lockfile go" [] {
    if ((pm status go) == false) {
        return false
    }
    const path = $"($_PatLockfilesBasePath)go.json"
    mkdir ($_PatLockfilesBasePath | path expand)
    print $"Updating lockfile at: ($path)"
    enter ~/go/src
    let dirs = (glob --depth 2 **/)
    mut result = []
    for repo in $dirs {
        if ($repo | is-empty) {
            continue
        }
        if (($repo | path exists) == false) {
            continue
        }
        if (($repo | path type) != "dir") {
            continue
        }
        enter $repo
        mut HEAD = ""
        try {
            $HEAD = (^git rev-parse HEAD | complete).stdout
        }
        let res = [[$repo $HEAD]]
        dexit
        $result = $result | append $res
    }
    dexit
    $result | filter { $in.1 != "" } | to json | save -f $path
    print "Lockfile updated"
    return true
}