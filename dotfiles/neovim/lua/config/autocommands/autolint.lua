vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWritePost",
    "InsertLeave",
}, {
    group = vim.api.nvim_create_augroup("PatAutoLint", { clear = true }),
    callback = function()
        require("lint").try_lint()
    end,
})
