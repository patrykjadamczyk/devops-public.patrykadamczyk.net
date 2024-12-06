#!/usr/bin/env nu

# Remove all unused packages in cache
export def cleanup [] {
    ^nix-collect-garbage
}

# Remove all unused packages in cache, old generations and packages that are unused in currnt generation
export def hard-cleanup [] {
    ^nix-collect-garbage --delete-old
}
