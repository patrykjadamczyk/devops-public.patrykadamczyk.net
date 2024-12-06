# CentOS PowerShell Install

## CentOS 7
```bash
#!/usr/bin/env bash
# Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo
# Install PowerShell
yum install -y powershell
# Start PowerShell
pwsh
```
## CentOS 8
```bash
#!/usr/bin/env bash/etc/yum.repos.d/microsoft.repo
###### Centos 8
# Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/rhel/8/prod.repo | tee /etc/yum.repos.d/microsoft.repo
# Install PowerShell
yum install -y powershell
# Start PowerShell
pwsh
```
## Notes
- CentOS 7 Docker Image
    - clear is not working