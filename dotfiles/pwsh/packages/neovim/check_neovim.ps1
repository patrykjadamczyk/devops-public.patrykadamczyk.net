#!/usr/bin/env pwsh
function Global:Test-StatusOfNeovimDev {
    # Find latest on master
    $latest_commit = gh api "repos/neovim/neovim/branches/master" --jq ".commit.sha"
    # Find status of this commit
    $latest_status = gh api "repos/neovim/neovim/actions/workflows/test.yml/runs" --jq ".workflow_runs.[0]"
    $latest_status_obj = $latest_status | ConvertFrom-Json
    # Get Commit Sha from status
    $latest_status_commit = $latest_status_obj.head_sha
    # Return error if not status for correct commit
    if (-not ($latest_status_commit -eq $latest_commit)) {
        return @{
            status_commit = $latest_status_commit
            master_commit = $latest_commit
            error = "Error: Commit SHA of status is not matched with latest commit of master"
        }
    }
    # Get Conclusion of Workflow
    $latest_status_conclusion = $latest_status_obj.conclusion
    # Get Status of Workflow
    $latest_status_status = $latest_status_obj.status
    # Return object
    return @{
        commit_sha = $latest_status_commit
        conclusion = $latest_status_conclusion
        status = $latest_status_status
    }
}

function Global:Test-StatusOfNeovimNightly {
    # Find commit of nightly
    $nightly_commit = gh api "repos/neovim/neovim/releases/tags/nightly" --jq ".target_commitish"
    # Find status of the commit
    $latest_status = gh api "repos/neovim/neovim/actions/workflows/test.yml/runs" --jq ".workflow_runs"
    $latest_status_obj = $latest_status | ConvertFrom-Json
    # Find Status
    $found_status = $null
    foreach ($status in $latest_status_obj) {
        if (-not ($status.head_sha -eq $nightly_commit)) {
            continue
        }
        $found_status = $status
        break
    }
    # Check Status
    if ($null -eq $status) {
        return @{
            error = "Status not found for current nightly commit"
        }
    }
    # Return status
    return @{
        commit_sha = $found_status.head_sha
        conclusion = $found_status.conclusion
        status = $found_status.status
    }
}
