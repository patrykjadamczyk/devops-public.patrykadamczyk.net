# Oh My Zsh

## clipboard.ps1

### `Add-FileToClipboard <path>`

Add specified file to system clipboard

### `Copy-FileFromClipboard` / `Copy-FileFromClipboard <path>`

Copy file from clipboard to specified location or if not specified to current directory

### `Move-FileFromClipboard` / `Move-FileFromClipboard <path>`

Move file from clipboard to specified location or if not specified to current directory

### `Copy-CWDToClipboard`

Copy current working directory path to system clipboard

## direnv.ps1

### `Enter-DirEnv`

Start direnv configuration

Direnv configuration is in files:
- direnv.env (environment variables)
- direnv.ps1 (script)

## emoji_clock.ps1

### `Emoji-Clock`

Shows current time as emoji clock

## gitignore.ps1

### `Get-GitIgnore`

Gets content of gitignore from toptal API. You are selecting git ignore file interactively using FZF.

### `Add-GitIgnore`

Add interactively gitignore file template
