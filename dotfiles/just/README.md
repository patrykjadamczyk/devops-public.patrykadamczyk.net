# Justfiles

## Notes

### Global Tasks PWD

If you run `just -g <task>` in some directory the PWD will be:

- `git rev-parse --show-toplevel` aka git root directory path if it's inside git repository
- current directory path if it's not inside git repository

for testing:
```just
set shell := ["nu", "-c"]
pwd:
    try { git rev-parse --show-toplevel }
    pwd
```
