set shell := ["nu", "-c"]
# NOTE: This tasks are run from root project directory not from CWD

default:
    just --list

install:
    nu ./Install.nu

expand:
    nu ./Dotfiles-Expander.nu

install-config:
    nu ./Dotfiles-Installer.nu

migrate:
    nu ./Migrate.nu

migrate-last:
    nu ./Migrate.nu --skip_until_last

migrate-dry:
    nu ./Migrate.nu --dryrun

update:
    git pull
    just install
    just migrate
