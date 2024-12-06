vim.cmd([[setlocal colorcolumn=78]])
-- Nullify the keymap made by noice which does not work correctly
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "K",
    function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("K", true, false, true), "n", true)
    end,
    { silent = true, noremap = true, buffer = bufnr }
)
