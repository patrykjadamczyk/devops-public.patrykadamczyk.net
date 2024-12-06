# PowerShell Portable Install

## Portable Installation { id="Portable-Installation" }

```Bash
#!/usr/bin/env bash
#### Envs
export POWERSHELL_VERSION="7.2.1"
export POWERSHELL_DIR="./microsoft_powershell"
#### Script

# Download the powershell '.tar.gz' archive
curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v$POWERSHELL_VERSION/powershell-$POWERSHELL_VERSION-linux-x64.tar.gz

# Create the target folder where powershell will be placed
mkdir -p "$POWERSHELL_DIR"

# Expand powershell to the target folder
tar zxf /tmp/powershell.tar.gz -C "$POWERSHELL_DIR"

# Set execute permissions
chmod +x "$POWERSHELL_DIR/pwsh"
```

## Docker Testing

### test_container.ps1
```Console
docker-compose build test
docker-compose run --rm test
```

### Dockerfile
```Docker
# Base Image
FROM ubuntu:latest
RUN apt update
# Script Dependencies
RUN apt install -y curl wget tar
# PowerShell Dependencies
RUN apt install -y libicu-dev
# Copy Script
COPY ./install.sh /app/install.sh
# Change Permissions
RUN chmod +x /app/install.sh
```

### docker-compose.yml
```yaml
version: '3'

services:
    test:
        build: .
```

### install.sh
Same script as in the [Portable Installation](#Portable-Installation) section.