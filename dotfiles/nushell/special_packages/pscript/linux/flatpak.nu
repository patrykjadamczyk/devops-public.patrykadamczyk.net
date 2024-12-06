#!/usr/bin/env nu

# Remove all unused packages in cache
export def cleanup [] {
    ^flatpak uninstall --unused
}
