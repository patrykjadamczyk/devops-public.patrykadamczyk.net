---@diagnostic disable-next-line: lowercase-global
function has(item)
    return vim.fn.has(item) == 1
end
vim.g.is_win = (has("win32") or has("win64")) and true or false
vim.g.is_linux = (has("unix") and (not has("macunix"))) and true or false
vim.g.is_mac = has("macunix") and true or false
vim.g.nvimrc = vim.fn.stdpath("config")
_G.PatAuGrOptions = vim.api.nvim_create_augroup("PatOptions", { clear = true })

-- Vim Keymap Set
-- @param opts table mode, key, command, options
function PatVimKeyMapSet(opts)
    if #opts ~= 4 then
        vim.notify("PatVimKeyMapSet: opts must be a table with 4 elements", vim.log.levels.ERROR)
    end
    vim.keymap.set(opts[1], opts[2], opts[3], opts[4])
end

-- Make function taking in table of arguments
-- @param func function to be called
-- @return function that takes in table of arguments for func
function PatMakeTableFunction(func)
    return function(opts)
        return func(unpack(opts))
    end
end
