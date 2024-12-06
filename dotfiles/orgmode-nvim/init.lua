-- Load Basic Utilities for working with config
require("config.utils")
-- Load Python 3 Finder
require("config.python_finder")
-- Load Global Config
require("config.global_config")
-- Load Basic Vim Settings
vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/vim.vim')
-- Load Local Config
require("config.env")
-- Load Plugins
require("config.plugins.init")
-- My Special Utilities
-- Digraph Prompt through Telescope
require("config.utilities.digraph_prompt")
-- Custom Commands
require("config.utilities.commands")
-- Load Keymaps
vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/keymaps.vim')
require("config.keymaps")
-- Load Command Palette Preset
require("config.special_configs.command_palette")
-- Load Syntax Highlighting Overrides
require("config.syntax")
-- Load Local Config
require("config.postenv")
-- Load Config
vim.cmd('source ' .. vim.g.nvimrc .. '/lua/config/config.vim')
require("config.config")
-- Load Finish
require("config.finish")
