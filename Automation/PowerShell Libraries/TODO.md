- Add support for nala package manager frontend
- Add option to update packages
- Add option to remove packages
- Add support for pacstall package manager
- Add elevated privileges in some package managers (apt, yum etc)
- Add option to install packages in WSL using specified package managers
- Add wsl command wrapper and docker base image wrapper


- add migration that adds this configuration for git:
  ```bash
  git config --global pull.rebase false
  git config --global pull.ff true
  git config --global fetch.prune true
  ```
- Add Notifications for all systems
- Add cmdlets for manipulating with /etc/hosts