-- Fix Netrw + Nvim-Tree not openning correctly urls
local url_open_group = vim.api.nvim_create_augroup("URLOpenGroup", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    group = url_open_group,
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local bufid = vim.api.nvim_get_current_buf()
        local protocols = {
            "^https://",
            "^http://",
            "^scp://",
            "^rcp://",
            "^ftp://",
        }
        local function reload_remote_file()
            vim.api.nvim_buf_call(bufid, function()
                print("Reloading remote file")
                vim.api.nvim_command("edit!")
            end)
        end
        for _, pattern in ipairs(protocols) do
            if string.match(bufname, pattern) ~= nil then
                vim.schedule(reload_remote_file)
            end
        end
    end,
})
