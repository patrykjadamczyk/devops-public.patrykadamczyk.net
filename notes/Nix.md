# Nix

files from nix/home-manager should be in `~/.config/home-manager`

Aktywacja home managera:

```bash
nix-shell -p home-manager
home-manager switch
```

## Nix + Node

Global packages to work in node have to be made

```bash
npm config set prefix "$(/home/linuxbrew/.linuxbrew/bin/npm config get prefix)"
```
