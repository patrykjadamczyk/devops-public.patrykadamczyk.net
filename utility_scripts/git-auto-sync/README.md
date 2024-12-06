# Git Auto Sync Deamon Script
## Notes
- Please use HTTP + PAT Token on repositories for git sync
- Run this commands in pwsh process on `ZARZĄDZANIE NT\SYSTEM` account (Local System Account)
    - Run this command `git config --global --add safe.directory <PATH_TO_REPO>` for git to not complain about user
    permissions
    - Run commands: `git config --global user.email <USER>` `git config --global user.name <USER>`
    - WHY?
        - Because Service is running under Local System Account. Which doesn't have ssh key, doesn't have git
          configuration etc. 
