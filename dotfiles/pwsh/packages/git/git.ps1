#!/usr/bin/env pwsh
# Utility functions
<#
.SYNOPSIS
    Get current git branch.
#>
function Global:Get-Git-CurrentBranch {
    git symbolic-ref --quiet HEAD *> $null

    if ($LASTEXITCODE -eq 0) {
        return git rev-parse --abbrev-ref HEAD
    } else {
        return
    }
}

function Global:Get-Git-Repository-Path {
    return git rev-parse --show-toplevel
}

<#
.SYNOPSIS
    Check if current directory is a git repository
.NOTES
    Returns 1 if it's git repo based on .git folder or git rev-parse returning correct output
    Returns 0 if it's not git repo
    Returns 2 if git failed
#>
function Global:Test-Git-Repository {
    if (Test-Path (Join-Path (Get-Location) ".git")) {
        return 1
    }
    git rev-parse --show-toplevel *> $null
    $lec = $LASTEXITCODE
    if ($lec -eq 128) {
        return 0
    }
    if ($lec -ne 0) {
        return 2
    }
    return 1
}

function Global:Split-Git-Repository-Url (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$url
) {
    $splitUrl = $url | ConvertFrom-Text -NoProgress "^((?<protocol>(ssh|git|rsync|http|https|file)):\/\/)?(((?<username>\S*):)?(?<user_or_token>\S*)@)?(?<hostname>[^\/:]*)(:(?<port>\d*))?(\:?\/?(?<path>[^\s\?\&\#]*)(\.git)?)?\/?$"
    if (-not $splitUrl) {
        return $splitUrl
    }
    return @{
        "url" = $url;
        "protocol" = $splitUrl.protocol;
        "username" = [String]::IsNullOrWhiteSpace($splitUrl.username) ? $splitUrl.user_or_token : $splitUrl.username;
        "hostname" = $splitUrl.hostname;
        "port" = $splitUrl.port;
        "path" = $splitUrl.path;
    }
}

# Aliases
#g: git
function Global:g {
    $possible_alf_subalias, $pas_args = $args;

    switch ($possible_alf_subalias)
    {
        "s" {
            git status $pas_args
            if (Test-Path (Join-Path (Get-Git-Repository-Path) ".gitmodules")) {
                Write-Host "Submodule status: "
                git submodule status $pas_args
            }
        }
        "l" {
            git log --all --graph --date=relative --pretty=format:'%h %Cgreen%ad%Creset %Cblue%an%Creset%n        %s%n       %C(auto)%d%Creset' $pas_args
        }
        "ll" {
            git log --graph --oneline --decorate --all $pas_args
        }
        "tail" {
            $1, $rest = $pas_args;
            if ([string]::IsNullOrWhiteSpace($1)) {
                $1 = "-5"
            } else {
                $1 = "-{0}" -f $1
            }
            git log $1 --all --date=relative --pretty=format:'%h %Cgreen%ad%Creset %x09%Cblue%s%Creset' $pas_args
        }
        "c" {
            git commit -m $pas_args
        }
        "ca" {
            git add --all
            if ($? -ne 0)
            {
                git commit -am $pas_args
            }
        }
        "camp" {
            git commit -am $pas_args
            git push
        }
        "cgc" {
            gitmoji -c $pas_args
        }
        "ccc" {
            $type = @("build", "ci", "docs", "feat", "fix", "perf", "refactor", "style", "test", "chore", "revert");
            $typeDescription = @(
                "build: Changes that affect the build system or external dependencies",
                "ci: Changes to our CI configuration files and scripts",
                "docs: Documentation only changes",
                "feat: A new feature",
                "fix: A bug fix",
                "perf: A code change that improves performance",
                "refactor: A code change that neither fixes a bug nor adds a feature",
                "style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)",
                "test: Adding missing tests or correcting existing tests",
                "chore: Related to maintenance tasks, build processes, or other non-user-facing changes",
                "revert: Reverts a previous commit"
            );
            $choice = ($typeDescription | Invoke-Fzf)
            $choiceId = $typeDescription.IndexOf($choice)
            $commitType = $type[$choiceId]
            $commitScope = Read-Host -Prompt "Commit scope? [default: no scope] "
            $commitBreaking = Read-Host -Prompt "Commit breaking changes if yes specify what is breaking change? [default: no breaking changes] "
            $commitBreakingSuffix = $commitBreaking -ne "" ? "!" : ""
            $commitBreakingFooter = $commitBreaking -ne "" ? "BREAKING CHANGE: $commitBreaking" : ""
            $commitTitle = Read-Host -Prompt "Commit title? "
            $commitBody = @()
            while ($true) {
                $line = Read-Host -Prompt "Commit body? [enter to finish] "
                if ($line -eq "") {
                    break
                }
                $commitBody += $line
            }
            $commitBody = $commitBody -join "`n"
            # Building commit message
            $commitBuilder = "$commitType"
            if ($commitScope -ne "") {
                $commitBuilder += "($commitScope)"
                $commitBuilder += "$commitBreakingSuffix"
                $commitBuilder += ":"
            } else {
                $commitBuilder += "$commitBreakingSuffix"
                $commitBuilder += ":"
            }
            $commitBuilder += " "
            $commitBuilder += "$commitTitle"
            if ($commitBody -ne "") {
                $commitBuilder += "`n"
                $commitBuilder += $commitBody
            }
            if ($commitBreaking -ne "") {
                $commitBuilder += "`n"
                $commitBuilder += $commitBreakingFooter
            }
            # Do you want to commit that ?
            Write-Host -ForegroundColor Blue "Generated Git Message"
            Write-Host -ForegroundColor Green $commitBuilder
            $tC = (Read-Host -Prompt "Commit? [y/n]").ToLower()
            if ($tC -eq "y" -or $tC -eq "yes") {
                git commit -m "$commitBuilder" $pas_args
            }
        }
        "p" {
            git push $pas_args
        }
        "m" {
            git merge $pas_args
        }
        "b" {
            git branch $pas_args
        }
        "d" {
            git diff $pas_args
        }
        "co" {
            git checkout $pas_args
        }
        "cb" {
            git checkout -b $pas_args
        }
        "cb-empty" {
            git checkout --orphan $pas_args
        }
        "co-back" {
            git checkout -
        }
        "cp" {
            git cherry-pick $pas_args
        }
        "pl" {
            git pull $pas_args
        }
        "ls" {
            git ls-tree --full-name --name-only -r HEAD $pas_args
        }
        "chmod" {
            git update-index --chmod $pas_args
        }
        "compare" {
            $1, $rest = $pas_args;
            git diff --stat --color $1..HEAD
        }
        "datelog" {
            git log --pretty=format:'%h %ad%x09%an%x09%s' --date=short $pas_args
        }
        "discard" {
            git checkout -- .
            git clean -fd $pas_args
        }
        "history" {
            git log -p $pas_args
        }
        "optimize" {
            git repack -ad

            if ($? -ne 0)
            {
                Start-Sleep -Seconds 5
                git gc $pas_args
            }
        }
        "remote-delete" {
            git push origin --delete $pas_args
        }
        "rebuild" {
            git commit --allow-empty -m "trigger rebuild"
            git push $pas_args
        }
        "rename" {
            git branch -m $pas_args
        }
        "resolve-ours" {
            git checkout --ours .
            git add -u
            git commit -m 'resolve conflicts with --ours' $pas_args
        }
        "resolve-theirs" {
            git checkout --theirs .
            git add -u
            git commit -m 'resolve conflicts with --theirs' $pas_args
        }
        "rollback" {
            $1, $rest = $pas_args;
            git revert --no-commit $1..HEAD
        }
        "shallow-clone" {
            git clone --depth 1 $pas_args
        }
        "upstream" {
            git checkout main
            if ($? -ne 0)
            {
                git fetch upstream
                if ($? -ne 0)
                {
                    git merge upstream/main $pas_args
                }
            }
        }
        "age" {
            # for d in ./*/; do echo -e "\n\e[34m$d\e[0m" ; git -C $d log -1 --all --date=relative --pretty=format:'%Cgreen%ad%Creset %x09%s%n' ; done;

            return Get-ChildItem -Directory ./ |
                ForEach-Object {
                    $name = $_.Name;
                    Write-Host -ForegroundColor Blue "./$name"
                    git -C $_.FullName log -1 --all --date=relative --pretty=format:'%Cgreen%ad%Creset %x09%s%n'
                }
        }
        "loc" {
            tokei $pas_args
        }
        "stats" {
            onefetch $pas_args
        }
        "ap" {
            git add --patch $pas_args
        }
        "au" {
            git add --update $pas_args
        }
        "ba" {
            git branch -a $pas_args
        }
        "bl" {
            git blame -b -w $pas_args
        }
        "bisect" {
            git bisect $pas_args
        }
        "bisect-good" {
            git bisect good $pas_args
        }
        "bisect-bad" {
            git bisect bad $pas_args
        }
        "bisect-reset" {
            git bisect reset $pas_args
        }
        "bisect-start" {
            git bisect start $pas_args
        }
        "bisect-visualize" {
            git bisect visualize $pas_args
        }
        "bisect-log" {
            git bisect log $pas_args
        }
        "bisect-skip" {
            git bisect skip $pas_args
        }
        "bisect-run" {
            git bisect run $pas_args
        }
        "c-am" {
            git commit --amend $pas_args
        }
        "cfg" {
            git config $pas_args
        }
        "cfg-list" {
            git config --list $pas_args
        }
        "co-d" {
            git checkout (g default-branch)
        }
        "co-main" {
            git checkout main $pas_args
        }
        "co-master" {
            git checkout master $pas_args
        }
        "co-dev" {
            git checkout dev $pas_args
        }
        "co-develop" {
            git checkout develop $pas_args
        }
        "cpa" {
            git cherry-pick --abort $pas_args
        }
        "cpc" {
            git cherry-pick --continue $pas_args
        }
        "cs" {
            git commit -S $pas_args
        }
        "f" {
            git fetch $pas_args
        }
        "fa" {
            git fetch --all --prune $pas_args
        }
        "push-force" {
            $CurrentBranch = Get-Git-CurrentBranch
            git push --force origin $CurrentBranch $pas_args
        }
        "push-forcelease" {
            $CurrentBranch = Get-Git-CurrentBranch
            git push --force-with-lease origin $CurrentBranch $pas_args
        }
        "brsup" {
            $CurrentBranch = Get-Git-CurrentBranch
            git branch --set-upstream-to=origin/$CurrentBranch $pas_args
        }
        "pssup" {
            $CurrentBranch = Get-Git-CurrentBranch
            git push --set-upstream origin $CurrentBranch
        }
        "poat" {
            git push origin --all
            git push origin --tags
        }
        "pristine" {
            git reset --hard
            git clean -dfx
        }
        "rem-add" {
            git remote add -f $pas_args
        }
        "rem-del" {
            git remote rm $pas_args
        }
        "rem-get" {
            git remote get-url $pas_args
        }
        "rem-oget" {
            git remote get-url origin $pas_args
        }
        "rem-rename" {
            git remote rename $pas_args
        }
        "rb" {
            git rebase $pas_args
        }
        "rba" {
            git rebase --abort $pas_args
        }
        "rbc" {
            git rebase --continue $pas_args
        }
        "rbi" {
            git rebase -i $pas_args
        }
        "rbs" {
            git rebase --skip $pas_args
        }
        "rs" {
            git restore $pas_args
        }
        "sub-init" {
            git submodule init $pas_args
        }
        "sub-update" {
            git submodule update $pas_args
        }
        "sub-remove" {
            git submodule deinit $pas_args
        }
        "sub-add" {
            git submodule add $pas_args
        }
        "sub-sync" {
            git submodule sync $pas_args
        }
        "sub-status" {
            git submodule status $pas_args
        }
        "st-save" {
            git stash save $pas_args
        }
        "st-apply" {
            git stash apply $pas_args
        }
        "st-list" {
            git stash list $pas_args
        }
        "st-show" {
            git stash show $pas_args
        }
        "st-clear" {
            git stash clear $pas_args
        }
        "st-drop" {
            git stash drop $pas_args
        }
        "st-pop" {
            git stash pop $pas_args
        }
        "tg" {
            git tag $pas_args
        }
        "tgs" {
            git tag -s $pas_args
        }
        "wa" {
            git worktree add $pas_args
        }
        "wap" {
            $branch, $path, $rest = $pas_args
            git worktree add $pas_args
            Set-Location $path
            git submodule init
            git pull --recurse-submodules
            Set-Location ..
        }
        "wab" {
            # Add worktree in $path based on $base but made onto new branch $branch
            $branch, $path, $base, $rest = $pas_args
            git worktree add -b $branch $path $base $rest
        }
        "wl" {
            git worktree list $pas_args
        }
        "w-prune" {
            git worktree prune $pas_args
        }
        "wrm" {
            git worktree remove $pas_args
        }
        "wrepair" {
            git worktree repair $pas_args
        }
        "wmv" {
            git worktree move $pas_args
        }
        "start-feature" {
            $feature_name, $rest = $pas_args
            git checkout (g default-branch)
            git pull origin (g default-branch)
            git checkout -b feat/$feature_name
        }
        "start-feature-wt" {
            $feature_name, $rest = $pas_args
            $repo_path = Get-Git-Repository-Path
            # Go to root folder of current worktree
            Set-Location $repo_path
            # Go to bare repo folder
            Set-Location ..
            if ((Get-Location).ToString().EndsWith("feat")) {
                Set-Location ..
            }
            # Go to main branch folder
            Set-Location main
            # Update main
            git checkout main
            git fetch
            git pull origin main
            # Go to bare repo folder
            Set-Location ..
            # Make feature branch folder
            # This path variable is workaround for cases like "feat/trello/999999/test" to become "feat/trello_999999_test" instead to be less nested and have working for this specific alias
            $feature_name_path = $feature_name.ToString().Replace("/", "_")
            git worktree add -b feat/$feature_name feat/$feature_name_path main $rest
        }
        "swbr-ui" {
            $branch_to_switch = git branch -al --format="%(refname:short)" | Invoke-Fzf
            git checkout $branch_to_switch $pas_args
        }
        "open-url" {
            $url = (git remote get-url origin)
            if ($url.Contains("bitbucket.org")) {
                $repo = $url.Split("bitbucket.org")
                $repo = $repo[1]
                $repo = $repo -replace '\.git$'
                Start-Process "https://bitbucket.org$repo"
            } elseif ($url.Contains("github.com")) {
                $repo = $url.Split("github.com")
                $repo = $repo[1]
                $repo = $repo -replace '\.git$'
                Start-Process "https://github.com$repo"
            } elseif ($url.Contains("gitlab.com")) {
                $repo = $url.Split("gitlab.com")
                $repo = $repo[1]
                $repo = $repo -replace '\.git$'
                Start-Process "https://gitlab.com$repo"
            } elseif ($url.Contains("patryk-rpi4.local:2221")) {
                $repo = $url.Split("patryk-rpi4.local:2221")
                $repo = $repo[1]
                $repo = $repo -replace '\.git$'
                Start-Process "http://patryk-rpi4.local:8080$repo"
            } elseif ($url.Contains("patryk-rpi4.local:8080")) {
                $repo = $url.Split("patryk-rpi4.local:8080")
                $repo = $repo[1]
                $repo = $repo -replace '\.git$'
                Start-Process "http://patryk-rpi4.local:8080$repo"
            } elseif ($url.Contains("http")) {
                $repo = $url -replace '\.git$'
                Write-Host "Trying to open repo by http/https directly"
                Start-Process $repo
            } else {
                Write-Host "Unsupported repository"
            }
        }
        "st-add" {
            $directory, $url_or_remote, $branch, $rest = $pas_args
            git subtree add --prefix $directory $url_or_remote $branch $rest
        }
        "st-pull" {
            $directory, $url_or_remote, $branch, $rest = $pas_args
            git subtree pull --prefix $directory $url_or_remote $branch $rest
        }
        "st-push" {
            $directory, $url_or_remote, $branch, $rest = $pas_args
            git subtree push --prefix $directory $url_or_remote $branch $rest
        }
        "setup" {
            $rs = Test-Git-Repository
            if ($rs -eq 2) {
                Write-Error "Git failed to check if it's git repository or not"
                return
            }
            if ($rs -eq 1) {
                Write-Error "It's already a git repository. Aborting..."
                return
            }
            function tmp___git_setup(
                [Parameter(Mandatory = $false, Position = 0)]
                [string]$Message,
                [Parameter(Mandatory = $false, Position = $null)]
                [string]$RemoteUrl
            ) {
                if ([String]::IsNullOrWhiteSpace($Message)) {
                    $Message = "Initial commit"
                }
                git init
                git add -A
                git commit --allow-empty -m "$Message"
                git branch -M main
                git config --local git-extras.default-branch main
                if (-not ([String]::IsNullOrWhiteSpace($Message))) {
                    git remote add origin $RemoteUrl
                    git push -u origin main
                }
            }
            if ($pas_args -is [array]) {
                tmp___git_setup @pas_args
            } else {
                tmp___git_setup $pas_args
            }
        }
        "show-tree" {
            git log --all --graph --decorate --oneline --simplify-by-decoration
        }
        "touch" {
            foreach ($filename in $pas_args) {
                New-Item $filename
                git add "$filename"
            }
        }
        "local-commits" {
            $currentBranch = Get-Git-CurrentBranch
            if ([String]::IsNullOrEmpty($currentBranch)) {
                Write-Error "Git could not get current branch"
                return
            }
            $remoteRef = git ls-remote origin $currentBranch | ConvertFrom-Text "(?<SHA>\S*)\s*(?<ref>\S*)"
            $remoteSHA = $remoteRef.SHA
            $remoteSHA = "$remoteSHA".Trim()
            git log "$remoteSHA..HEAD"
        }
        "lock" {
            foreach ($filename in $pas_args) {
                git update-index --skip-worktree "$filename"
            }
        }
        "unlock" {
            foreach ($filename in $pas_args) {
                git update-index --no-skip-worktree "$filename"
            }
        }
        "locked" {
            git ls-files -v | Select-String '^S' | ForEach-Object { $_.Line -replace 'S ' }
        }
        "root" {
            git rev-parse --show-toplevel
        }
        "relative-root" {
            $p = git rev-parse --show-prefix
            if ([String]::IsNullOrWhiteSpace($p)) {
                return "."
            }
            return "$p".TrimEnd()
        }
        "init-default-branch" {
            git config --get init.defaultBranch
        }
        "default-branch" {
            $remoteHeadBranch = (git remote show origin 2> $null)
            if ($LASTEXITCODE -eq 0) {
                return $remoteHeadBranch
                    | Select-String "HEAD branch: (?<branch>.*)"
                    | ForEach-Object { "$_".Trim() -replace "HEAD branch: " }
            }
            $defaultBranchOfGitRepo = (git config --get git-extras.default-branch)
            if (-not ([String]::IsNullOrWhiteSpace($defaultBranchOfGitRepo))) {
                return $defaultBranchOfGitRepo
            }
            return git config --get init.defaultBranch
        }
        "delta" {
            $branch, $filter, $rArgs = $pas_args
            if ([String]::IsNullOrWhiteSpace($branch)) {
                $branch = (g default-branch)
            }
            if ([String]::IsNullOrWhiteSpace($filter)) {
                $filter = "ACM"
            }

            git diff --name-only --diff-filter="$filter" "$branch" $rArgs
        }
        "abort" {
            $gitdir = git rev-parse --git-dir
            $opfound = ""
            $fcnt = ""
            $operations = @("cherry-pick", "merge", "rebase", "revert")

            foreach ($i in $operations) {
                $f = $i.ToUpper().Replace("-", "_")
                if (Test-Path -Path "$gitdir/$f`_HEAD") {
                    $fcnt = "1" + $fcnt
                    $opfound = $i
                }
            }

            if ($fcnt -ne "1") {
                Write-Host "I don't know what to abort" -ForegroundColor Red
                exit 1
            }

            git "${opfound}" --abort
        }
        "get" {
            function tmp___git_get(
                [Parameter(Mandatory = $true, Position = 0)]
                [string]$RemoteUrl,
                [Parameter(Mandatory = $false, Position = 1)]
                [switch]$FullInit,
                [Parameter(Position=2,ValueFromRemainingArguments)]
                [string[]]$AdditionalArguments
            ) {
                $splitUrl = Split-Git-Repository-Url $RemoteUrl
                if ($null -eq $splitUrl) {
                    Write-Error "Could not split git repository url into its parts"
                    return $null
                }
                $hostPart = $splitUrl.hostname
                $pathPart = $splitUrl.path
                if ([String]::IsNullOrWhiteSpace($hostPart) -or [String]::IsNullOrWhiteSpace($pathPart)) {
                    Write-Error "Splitted repo url doesn't have correct host or path or both"
                    return $null
                }
                $basePath = Resolve-Path "~/go/src"
                if (-not (Test-Path $basePath)) {
                    Write-Error "~/go/src not found. Please create it or setup your system first for that"
                    return $null
                }
                $pathPart = "$pathPart".Trim()
                $pathPart = $pathPart -replace "(?s)(.*)(\b\.git\b)","`$1"
                $clonePath = Join-Path $basePath $hostPart $pathPart

                Write-Host "Running: git clone $url $clonePath $(Write-Output @AdditionalArguments)"
                $lec = -1
                if ($FullInit) {
                    git clone --recurse-submodules --remote-submodules -j8 $remoteUrl $clonePath @AdditionalArguments
                    $lec = $LASTEXITCODE
                } else {
                    git clone $remoteUrl $clonePath @AdditionalArguments
                    $lec = $LASTEXITCODE
                }
                if ($lec -eq 0) {
                    Write-Host "Moving to cloned repository"
                    Set-Location $clonePath
                    if ($FullInit) {
                        Write-Host "Changing to submodules to track branches"
                        g submodule-sync-branch
                    }
                }
            }
            if ($pas_args -is [array]) {
                tmp___git_get @pas_args
            } else {
                tmp___git_get $pas_args
            }
        }
        "submodule-sync-branch" {
            git submodule foreach '
             submodule=$(git --work-tree $toplevel rev-parse --show-prefix)
             submodule=${submodule::-1}
             branch=$(git -C $toplevel config -f .gitmodules submodule.$submodule.branch)
             git checkout $branch
            '
        }
        "run-hook" {
            $hook_name, $rArgs = $pas_args
            git hook run $hook_name $rArgs
        }
        "obliterate-file" {
            $file, $rArgs = $pas_args
            git filter-branch -f --index-filter "git rm -r --cached ""$file"" --ignore-unmatch" --prune-empty --tag-name-filter cat -- --all $rArgs
        }
        "obliterate-file-range" {
            $file, $range, $rArgs = $pas_args
            git filter-branch -f --index-filter "git rm -r --cached ""$file"" --ignore-unmatch" --prune-empty --tag-name-filter cat -- $range $rArgs
        }
        "sync" {
            git fetch
            git pull --recurse-submodules
            if ($LASTEXITCODE -ne 0) {
                Write-Error "Git pull failed"
                return
            }
            git push
        }
        "is-worktree" {
            $gitDir = "$(git rev-parse --git-dir)".Trim()
            $gitCommonDir = "$(git rev-parse --git-common-dir)".Trim()
            if ($gitDir -eq $gitCommonDir) {
                return $false
            }
            return $true
        }
        "info" {
            Write-Host -ForegroundColor Green "## Remote URLs:"
            Write-Host ""
            git -P remote -v
            Write-Host ""

            Write-Host -ForegroundColor Green "## Remote Branches:"
            Write-Host ""
            if ((g is-worktree) -eq $false) {
                git -P branch -r
            } else {
                Write-Host -ForegroundColor Red "You are inside worktree. Remote branches doesn't work in worktrees."
            }
            Write-Host ""

            Write-Host -ForegroundColor Green "## Local Branches:"
            Write-Host ""
            git -P branch
            Write-Host ""

            if (Test-Path (Join-Path (Get-Git-Repository-Path) ".gitmodules")) {
                Write-Host -ForegroundColor Green "## Submodules:"
                Write-Host ""
                git -P submodule status
                Write-Host ""
            }

            Write-Host -ForegroundColor Green "## Most Recent Commits:"
            Write-Host ""
            git -P log --max-count=1 --pretty=short
            Write-Host ""
        }
        "info-config" {
            g info

            Write-Host -ForegroundColor Green "## Configuration .git/config:"
            Write-Host ""
            git -P config --list
            Write-Host ""
        }
        "save" {
            git stash push --include-untracked
        }
        "update-to-default" {
            git checkout (g default-branch)
            if ($LASTEXITCODE -ne 0) {
                Write-Error "git checkout failed"
                return
            }
            git fetch
            if ($LASTEXITCODE -ne 0) {
                Write-Error "git fetch failed"
                return
            }
            git pull
            if ($LASTEXITCODE -ne 0) {
                Write-Error "git pull failed"
                return
            }
            git checkout -
            if ($LASTEXITCODE -ne 0) {
                Write-Error "git checkout - failed"
                return
            }
            git merge (g default-branch)
            if ($LASTEXITCODE -ne 0) {
                Write-Error "git merge failed"
                return
            }
        }
        "np" {
            git -P $pas_args
        }
        "see-file" {
            $branch, $file, $rArgs = $pas_args
            git show "$branch`:$file" $rArgs
        }
        "a" {
            git add $pas_args
        }
        "cheatsheet" {
            $cheatsheetFile = Resolve-Path (Join-Path $PSScriptRoot ".." "autocomplete\cheatsheets\pwsh\packages\git.md")
            return glow $cheatsheetFile
        }
        Default {
            git $args
        }
    }
}


