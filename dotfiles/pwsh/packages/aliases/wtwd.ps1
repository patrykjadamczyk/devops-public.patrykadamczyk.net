#!/usr/bin/env pwsh
# Run Windows Terminal in current directory. Default Windows Terminal don't care about working directory.
function Global:wtwd {
    wt -d $PWD
}
