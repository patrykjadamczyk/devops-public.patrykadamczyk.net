#!/usr/bin/env pwsh

#### Configure vfox
# Add plugins
vfox add bun clang cmake deno dotnet  golang nodejs php python zig
# Install versions
vfox install bun@latest
vfox install clang@latest
vfox install cmake@latest
vfox install deno@latest
# TODO: Errors
vfox install dotnet@latest
# TODO: Errors
vfox install dotnet@6
# TODO: Errors
vfox install dotnet@7
# TODO: Errors
vfox install dotnet@8
# TODO: Errors
vfox install dotnet@9
vfox install golang@latest
vfox install nodejs@latest
# TODO: Errors
vfox install nodejs@lts
# TODO: Errors
vfox install php@latest
# TODO: Errors
vfox install php@5.6
# TODO: Errors
vfox install php@7.4
vfox install python@latest
vfox install zig@latest
# Set versions globally
vfox use --global bun@latest
vfox use --global clang@latest
vfox use --global cmake@latest
vfox use --global deno@latest
vfox use --global dotnet@latest
vfox use --global golang@latest
vfox use --global nodejs@latest
vfox use --global php@latest
vfox use --global python@latest
vfox use --global zig@latest
