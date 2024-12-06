#!/usr/bin/env pwsh
nodemon --exec "pkl eval ./config.pkl -o config.toml" -e "pkl PklProject json"
