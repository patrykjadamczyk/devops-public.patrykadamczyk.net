# Git

## git.ps1

### `Get-Git-CurrentBranch`

Get name of current branch

### `Get-Git-Repository-Path`

Get path to repository you are currently in

### `g`

#### `s`

Git Status with submodules

#### `l`

Git Log

#### `ll`

Git Log with graph

#### `tail <number>` / `tail`

Tail of git log
By default it's tail of 5.

#### `c <message>`

Git commit with specified message

#### `ca <message>`

Add all files and git commit with specified message

#### `camp <message>`

Add all files, git commit with specified message and push these changes

#### `cgc`

Commit interactively using gitmoji

#### `ccc`

Commit with interactively building message using conventional commits

#### `p`

Push changes

#### `m`

Merge changes

#### `m <branch>`

Merge specified branch into your current branch

#### `b`

git branch $args

#### `d`

git diff $args

#### `co`

git checkout $args

#### `co <branch>`

Checkout specified branch

#### `cb <branch>`

Checkout specified branch and if it doesn't exist create it

#### `cp`

git cherry-pick $args

#### `pl`

Pull changes

#### `ls`

List files in git

#### `chmod`

chmod through git

#### `compare <compare_target>`

Compare between current state (HEAD) and specified target

#### `datelog`

Log with dates

#### `discard`

Discard changes

#### `history`

Generate patch from log
Best used like `g history <commit>..HEAD` or comparing two branches or commits

#### `optimize`

Optimize git repository

#### `remote-delete <remote>`

Remove specified remote

#### `rebuild`

Create and push empty commit with message "trigger rebuild"

#### `rename <branch> <new_name>`

Change name of specified branch to new name

#### `rename <new_name>`

Change name of current branch to specified new name

#### `resolve-ours`

Resolve conflicts with local changes

#### `resolve-theirs`

Resolve conflicts with remote changes

#### `rollback <commit>`

Revert all commits from specified commit to current commit

#### `rollback <branch>`

Revert all commits from newest commit on specified branch to current commit on HEAD

#### `rollback HEAD~<number>`

Revert specified number of commits back (instead of specifying commit sha just specifying number of commits to revert)

#### `shallow-clone`

git clone --depth 1 $args

#### `upstream`

This checks out main branch.
Fetches upstream remote and merges upstream version of main branch.

#### `age`

Shows age of files

#### `loc`

Shows number of lines of code using tokei

#### `stats`

Shows stats of repository using onefetch

#### `ap`

Add parts of changes interactively

#### `au`

Stage all changes to files that are tracked. Untracked files are ignored.

#### `ba`

List all branches

#### `bl`

Show git blame

#### `bisect`

git bisect $args

#### `bisect-good`

Note that changes are working (Bisect)

#### `bisect-bad`

Note that changes are not working (Bisect)

#### `bisect-reset`

Go back to commit where you started bisecting.
You can provide commit to return to.

#### `bisect-start`

Start Bisecting

#### `bisect-start <bad_commit> <good_commit>`

Start Bisecting noting that specified commit is not working and specified commit is working.

#### `bisect-visualize`

Visualize current state of bisect using gitk

#### `bisect-log`

Show log of bisect.
You can save that log and replay if needed.
Using:

```pwsh
g bisect-log > bisect.txt
g bisect-reset
g bisect replay bisect.txt
```

#### `bisect-skip`

Skip testing current commit

#### `bisect-run <script> <args>`

Specify script that will tell if current source code is good or bad.
Script should return:

- 0 if it's good
- 125 if it cannot be tested (skip)
- 1-124 & 126-127 if it's bad
- 128-255 if bisect should be aborted

#### `c-am`

Amend commit

#### `cfg`

git config $args

#### `cfg-list`

List configuration of git

#### `co-main`

Checkout main branch

#### `co-master`

Checkout master branch

#### `co-dev`

Checkout dev branch

#### `co-develop`

Checkout develop branch

#### `cpa`

Abort cherry pick

#### `cpc`

Continue cherry pick process

#### `cs`

Sign commit using gpg key

#### `f`

Fetch changes

#### `fa`

Fetch all changes and remove all remote tracking refs that doesn't exist anymore.

#### `push-force`

Force push to a branch

#### `push-forcelease`

Force push to a branch but only if it's on same state as you had

#### `brsup`

Setup current branch to track upstream

#### `pssup`

Push changes and set tracking on current branch

#### `poat`

Push all changes and tags

#### `pristine`

Discard all changes and remove all untracked files. (Clearn state of repo)

#### `rem-add <remote_name> <remote_url>`

Add specified remote and fetch it

#### `rem-del <remote_name>`

Remove specified remote

#### `rem-get <remote_name>`

Get url of specified remote

#### `rem-oget`

Get url of origin remote

#### `rem-rename <remote_name> <new_name>`

Rename specified remote to specified name

#### `rb`

Rebase

#### `rba`

Abort rebase

#### `rbc`

Continue rebase

#### `rbi`

Interactive rebase

#### `rbs`

Skip rebase

#### `rs`

git restore

#### `sub-init`

Initialize submodules

#### `sub-update`

Update submodules

#### `sub-remove`

Remove submodule

#### `sub-add`

Add submodule

#### `sub-sync`

Synchronize submodules

#### `sub-status`

Status of submodules

#### `st-save`

Save stash

#### `st-apply`

Apply stash

#### `st-list`

List all stashes

#### `st-show`

Show stash

#### `st-clear`

Clear stash

#### `st-drop`

Remove stash

#### `st-pop`

Apply and remove stash

#### `tg`

git tag $args

#### `tgs`

Make GPG signed tag

#### `wa <branch> <name>`

Add worktree with specified branch and specified name (name is used as path)

#### `wap <branch> <name>`

Add worktree with specified branch and specified name (name is used as path)
Use this instead of wa if your repo has submodules. (this will pull all submodules on adding worktree)

#### `wab <branch> <path> <base>`

Add worktree with specified branch made from specified base with worktree having specified name. Name is used as path.

#### `wl`

List worktree

#### `w-prune`

Clean worktree information

#### `wrm <name>`

Remove specified worktree

#### `wrepair`

Repair worktree information

#### `wmv <name> <new_name>`

Move specified worktree to new location with new name

#### `start-feature`

Checkout main, pull new changes from remote and start working on specified feature using feature branch

#### `start-feature-wt`

Checkout main, pull new changes from remote and start working on new feature using worktree and feature branch

#### `swbr-ui`

Switch branch using FZF

#### `open-url`

Try to open url to repository

#### `st-add <dir> <url_or_remote> <branch>`

Add specified folder as subtree that is using specified remote/url and specified branch.

#### `st-pull <dir> <url_or_remote> <branch>`

Pull changes from subtree that is in specified folder

#### `st-push <dir> <url_or_remote> <branch>`

Push changes from subtree that is in specified folder

#### `setup` / `setup -Message <message>`

Setup current folder as git repo with current content of it as initial commit (with option to customize message)

#### `show-tree`

Shows graph of log

#### `touch <files or file>`

Create specified files and track them with git

#### `local-commits`

Shows commits that are only locally. (Not on remote branch)
This should work in worktrees as well.
In normal repos you could run `g log "@{upstream}..@"` instead.

#### `lock <files or file>` / `unlock <files or file>`

Lock or unlock files from making changes to them.

#### `locked`

List all locked files

#### `root`

Get root path of current repository

#### `relative-root`

Get path relative to your current working directory and root path of current repository

#### `init-default-branch`

Get name of the branch that is setup to be default for new repositories

#### `default-branch`

Get name of the branch that is setup to be default in current repository

#### `delta` / `delta <branch> <filter>`

Check changes between specified branch (if not specified it uses default branch) and current branch.
You can additionally specify a filter that works in `git diff`.

#### `abort`

Try to abort current operation.
Operations that are supported are: `cherry-pick`, `merge`, `rebase`, `revert`.

#### `<other>`

Other commands are forwarded to git
