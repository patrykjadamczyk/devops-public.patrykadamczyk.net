-- Close when last buffer is sidebar
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function(_)
        local buffers = vim.api.nvim_list_bufs()
        if #buffers == 1 then
            for _, v in ipairs(vim.api.nvim_list_bufs()) do
                if string.match(vim.fn.bufname(v), "^SidebarNvim_.*") then
                    vim.cmd("quit")
                    return
                end
            end
        end
    end,
})
