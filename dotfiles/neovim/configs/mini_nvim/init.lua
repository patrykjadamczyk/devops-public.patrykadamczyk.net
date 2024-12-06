-- Function to load all files in a directory
local function require_all(package_name)
    local dir = package_name:gsub("%.", "/")
    local files = {}

    -- Get the default configuration directory
    local config_dir = vim.fn.stdpath("config")

    -- Construct the full path for the provided directory
    local full_dir = config_dir .. "/lua/" .. dir

    -- Check if the directory exists
    if vim.fn.isdirectory(full_dir) == 1 then
        -- Iterate over the files in the directory
        for file in vim.fs.dir(full_dir) do
            if file ~= "." and file ~= ".." then
                local file_path = full_dir .. "/" .. file
                if vim.fn.isdirectory(file_path) == 0 then
                    local module_name = dir .. "." .. file:gsub("%.lua$", "")
                    table.insert(files, require(module_name))
                end
            end
        end
    end

    return files
end
-- Load Local Config
require("config-env.config")
require("config-env.init")
-- Load Basic Utilities for working with config
require("config.utils")
-- Load configuration of options
require_all("config.options")
-- Load Local Config
require("config-env.env")
-- Load Plugins
require("config.plugins.init")
-- My Special Utilities
-- Digraph Prompt through Telescope
require("config.utilities.digraph_prompt")
-- Custom Commands
require("config.utilities.commands")
-- Lua utilities
require("config.utilities.lua-utils")
-- Load Keymaps
-- Load configuration of options
require_all("config.options_post")
-- Load configuration of autocommands
require_all("config.autocommands")
-- Load configuration of keymaps
require_all("config.keymaps")
require_all("config.keymaps.plugins")
-- Load Syntax Highlighting Overrides
require("config.syntax")
-- Load Local Config
require("config-env.post")
-- Load Finish
require("config.finish")
