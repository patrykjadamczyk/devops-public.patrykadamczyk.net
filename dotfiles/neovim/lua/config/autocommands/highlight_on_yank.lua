-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        -- vim.highlight.on_yank({ timeout = 500 })
        vim.hl.on_yank({ timeout = 500 })
    end,
})
