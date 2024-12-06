-- Function to load all files in a directory
function _G.require_all(package_name)
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
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
