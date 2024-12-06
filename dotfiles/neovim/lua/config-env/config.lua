-- This file is for configuration variables.
-- These are defaults for config-env/init.lua or special variables that i experiment with for other reasons.

--- Highest priority for plugins
vim.g.patconfig_highest_base_priority = 3000

--- Shell
--- NuShell
vim.g.patconfig_nushell = 1
--- PowerShell
vim.g.patconfig_powershell = 0

--- Computer Preset
vim.g.patconfig_mainwindowspc = 0

--- C# Servers

-- CSharp_LS (LSP based on Roslyn) [razzmatazz/csharp-language-server]
-- NOTE: Tested on 21.11.2024 using csharp_ls 0.15.0 - This does not work at .NET 9 targetted projects.
vim.g.patconfig_csharp_server__csharp_ls = 0

-- Omnisharp (LSP based on Roslyn Workspaces, Was option in vscode-csharp extension before C# devkit) [OmniSharp/omnisharp-roslyn]
-- NOTE: Tested on 21.11.2024 using omnisharp-roslyn 1.39.12 - This does not work at .NET 9 targetted projects.

-- Omnisharp
vim.g.patconfig_csharp_server__omnisharp = 1
-- Omnisharp Mono (Omnisharp using Mono instead of dotnet directly)
vim.g.patconfig_csharp_server__omnisharp_mono = 0
-- Omnisharp Keymaps (gd etc uses special keymaps from omnisharp-extended-lsp.nvim)
vim.g.patconfig_csharp_server__omnisharp_ft_keymaps = 1

-- Roslyn (Official LSP based on Roslyn, part of vscode-csharp extension) [dotnet/roslyn]
-- NOTE: Tested on 21.11.2024 using roslyn 4.13.0-2.24569.2 - This does work at .NET 9 targetted projects but it does not look like supports decompilation.
vim.g.patconfig_csharp_server__roslyn = 0
