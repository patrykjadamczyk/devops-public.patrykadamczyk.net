# devops.patrykadamczyk.net - Public Version

This is a collection of my personal dotfiles.

> [!CAUTION]
> This repo is not meant to be used directly. I dont recommend installing these dotfiles directly.
> Make your own repo/folder and copy stuff that you like from my dotfiles.

## Goal of the project

Goal of this project is to provide a fast way to setup my personal environment according to my needs fast.

This project is meant to be entrypoint to setup my environment.

## Installation

```bash
git clone --recurse-submodules git@github.com:patrykjadamczyk/devops-public.patrykadamczyk.net.git ~/go/src/devops.patrykadamczyk.net
cd ~/go/src/devops.patrykadamczyk.net
# On system having PowerShell Core (aka PowerShell 7+)
# Note this can install Nix on unix system if needed where nushell version cant for now
./Install.ps1
# On system having Nushell
./Install.nu
```

## Documentation

### Possible Questions

#### Why is these repo so chaotic ?

Because I am me. I like testing a lot of stuff and changing stuff. And didnt clean this repo fully off stuff that is not needed anymore.

#### What "public version" mean in context of this repo?

This repo is prepared version of my personal dotfiles.

This repo does not have:

- My commit history
- My private keys or anything
- I specially reviewed it so it doesnt contain anything funny like access tokens or anything

This is meanly so i dont leak any "secrets". Though for most part my dotfiles dont contain any really secret "secrets".

In [PUBLIC_INFO.md](./PUBLIC_INFO.md) file you can find info of what i decided to remove comparing to my private repo.

### Tour of my dotfiles

#### Small history of where did i come from and where i am now in terms of tools.

##### Shells

I started from `bash`. My public bash config is in [alf-conf-public](https://github.com/patrykjadamczyk/alf-conf-public/). Only relevant part of mentioned repo is bash config itself (PowerShell is part of this repo).

I was using alf for simple aliases.

At the same time I was using from time to time Windows PowerShell (Cmd is not that good) when I was using Windows.

Later when PowerShell Core was released I moved to it because it was cross platform (specifically it was cross platform-ish because some cmdlets are Windows only, like Get-Disk (I still dont get this one)).

I used PowerShell a lot. But some time ago my PowerShell config started being extremely slow.
More specifically it started loading Profile file for 7+seconds. Which is very bad if you consider its loaded in every new session.

So after some time being annoyed by that slowness I decided to try fully move to Nushell.

Nushell is better at being cross platform (because every core command is cross platform). Its faster than PowerShell by a lot.
And still treat command output as objects.

Currently I use only Nushell really.

I tested some other shells at some point just testing water (thats why in my wezterm and "sm" you have hilbish, fish etc) but for now im sticking to nushell.

##### Terminals

Here I started with whatever was on my systems meaning mostly CMD, PowerShell, Gnome Terminal.

Then I switched to Alacritty but i hated that it doesnt have tabs at all. (No I cant use tmux. Tmux is not cross platform. Zellij fails this requirement too).

After some time I switched to WezTerm and here I am still.

I tested other terminals like Kitty, Rio, Warp, ITerm2 but all of them were not better than Wezterm for me.

Whenever Ghostty comes out I will try it too.

#### Places that contain coolest stuff in general

- `dotfiles/nushell` - My nushell configuration
- `dotfiles/nushell/path_scripts/pm` - My package manager script
- `dotfiles/nushell/path_scripts/global_env` - My global environment varieble manager script
- `dotfiles/pwsh` - My powreshell configuration
- `dotfiles/wezterm` - My wezterm configurationA
- `dotfiles/neovim` - My main neovim configuration
- `dotfiles/applications` / `nix` - Applications that I use or test - There is a lot of cool applications
- `Install.ps1` / `Install.nu` - Scripts that install my dotfiles
- `DotfilesExpander.ps1` / `DotfilesExpander.nu` - Script that expands my dotfiles
- `dotfiles/keyboard/linux-layout` - My slightly changed linux layout (I use Colemak DH currently)

