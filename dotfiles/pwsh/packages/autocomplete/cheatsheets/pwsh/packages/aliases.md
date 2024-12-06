# Aliases

## go-mod-update.ps1

### `Update-GoPackage <Package> (<Branch>)`

Update specified go package to the newest version of specified branch or if not specified the main branch.

## Neovim.ps1

### `Update-NeoVimPlugins`

Update neovim plugins using Lazy

## PingMonitor.ps1

### `Check-InternetConnection`

TUI graphical ping monitor with some targets added for my specific network

## Start.ps1

### `Start-NoHangProcess`

Start specified command without attaching to current process

## sttr.ps1

### `Start-StringUtility`

Run sttr utility

#### Commands

- `ascii85-decode`
- `ascii85-encode`
- `base32-decode`
- `base32-encode`
- `base64-decode`
- `base64-encode`
- `base64url-decode` - Decode your base64 text with URL Safe
- `base64url-encode` - Encode your text to Base64 with URL Safe
- `bcrypt` - Get the Bcrypt hash of your text
- `camel` - Transform your text to CamelCase
- `count-chars` - Find the length of your text (including spaces)
- `count-lines` - Count the number of lines in your text
- `count-words` - Count the number of words in your text
- `extract-emails` - Extract emails from given text
- `extract-ip` - Extract IPv4 and IPv6 from your text
- `hex-decode` - Convert Hexadecimal to String
- `hex-encode` - Encode your text Hex
- `hex-rgb` - Convert a #hex-color code to RGB
- `html-decode` - Unescape your HTML
- `html-encode` - Escape your HTML
- `interactive` - Use sttr in interactive mode
- `json` - Format your text as JSON ( json decode )
- `json-escape` - JSON Escape
- `json-msgpack` - Convert JSON to MSGPACK text
- `json-unescape` - JSON Unescape
- `json-yaml` - Convert JSON to YAML text
- `kebab` - Transform your text to kebab-case
- `lower` - Transform your text to lower case
- `markdown-html` - Convert Markdown to HTML
- `md5` - Get the MD5 checksum of your text
- `morse-encode` - Decode Morse Code to text
- `msgpack-json` - Convert MSGPACK to JSON text
- `remove-newlines` - Remove all new lines
- `remove-spaces` - Remove all spaces + new lines
- `reverse` - Reverse Text ( txeT esreveR )
- `reverse-lines` - Reverse Lines
- `rot13-encode` - Encode your text to ROT13
- `sha1` - Get the SHA1 checksum of your text
- `sha224` - Get the SHA224 checksum of your text
- `sha256` - Get the SHA256 checksum of your text
- `sha384` - Get the SHA384 checksum of your text
- `sha512` - Get the SHA512 checksum of your text
- `shuffle-lines` - Shuffle lines randomly
- `slug` - Transform your text to slug-case
- `snake` - Transform your text to snake_case
- `sort-lines` - Sort lines alphabetically
- `title` - Transform your text to Title Case
- `unique-lines` - Unique Lines
- `upper` - Transform your text to UPPER CASE
- `url-decode` - Decode URL entities
- `url-encode` - Encode URL entities
- `yaml-json` - Convert YAML to JSON text
- `zeropad` - Pad a number with zeros

## timezone.ps1

### `Get-Clock-ByTimezones <timezone>`

Get time for specified timezone

### `Get-Clock-ByTimezonesInteractively`

Get time for timezone specified through fzf

## wlf.ps1

### `wlf <file>` / `Watch-LogFile <file>`

Attach to specified file.
This command shows last 10 lines of specified file and attaches to it so when it's changes it shows added content.

## wtwd.ps1

### `wtwd`

Open Windows Terminal in current directory
