#!/usr/bin/env pwsh
function Global:reset_font_cache() {
    fc-cache -f
}
