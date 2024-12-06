#!/usr/bin/env nu

# NOTE: Start of nu-scripts
use ./nu_scripts/modules/system/mod.nu
# Completion Scripts
# # NOTE: This scripts are kinda slow (200ms -> 400-500ms)
# # use ./nu_scripts/custom-completions/bat/bat-completions.nu *
# use ./nu_scripts/custom-completions/curl/curl-completions.nu *
# use ./nu_scripts/custom-completions/gh/gh-completions.nu *
# use ./nu_scripts/custom-completions/git/git-completions.nu *
# use ./nu_scripts/custom-completions/glow/glow-completions.nu *
# use ./nu_scripts/custom-completions/godoc/godoc-completions.nu *
# use ./nu_scripts/custom-completions/just/just-completions.nu *
# # use ./nu_scripts/custom-completions/less/less-completions.nu *
# # use ./nu_scripts/custom-completions/make/make-completions.nu *
# use ./nu_scripts/custom-completions/man/man-completions.nu *
# # use ./nu_scripts/custom-completions/nix/nix-completions.nu *
# # use ./nu_scripts/custom-completions/npm/npm-completions.nu *
# # use ./nu_scripts/custom-completions/pnpm/pnpm-completions.nu *
# use ./nu_scripts/custom-completions/rg/rg-completions.nu *
# use ./nu_scripts/custom-completions/tar/tar-completions.nu *
# Modules
use ./nu_scripts/modules/filesystem/expand.nu
# NOTE: End of nu-scripts


# NOTE: Start of giggio/nuscripts
# URL: https://github.com/giggio/nuscripts/tree/d85399cc1295516fa6126e8d68f409d7a554faf6
# NOTE: Changed
source ./giggio_nuscripts/scripts/navi.nu
# NOTE: End of nu-scripts

# NOTE: Start of nu completions
use ./pueue_completions.nu *
# NOTE: End of nu completions
