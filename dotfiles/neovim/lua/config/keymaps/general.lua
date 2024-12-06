--#region Additional Keybinds
PatVimKeyMapSet({
    "n",
    "<C-s>",
    "<cmd>w<cr>",
    {
        desc = "Save file",
    },
})
--#endregion
--#region Terminal
PatVimKeyMapSet({
    "t",
    "<C-x>",
    vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
    { desc = "Exit terminal mode" },
})
--#endregion
--#region List chars
vim.g.pat_list_chars_num = 0
PatVimKeyMapSet({
    "n",
    "<Leader>cl",
    function()
        if vim.g.pat_list_chars_num == 0 then
            vim.opt.listchars = "tab:»·,trail:·,nbsp:·,space:·,precedes:←,extends:→,eol:↲"
            vim.g.pat_list_chars_num = 1
        else
            vim.opt.listchars = "tab:»·,trail:·,nbsp:·,space:·,precedes:←,extends:→"
            vim.g.pat_list_chars_num = 0
        end
    end,
    { silent = true, expr = true, desc = "List chars cycle" },
})
--#endregion
--#region Quickfix
PatVimKeyMapSet({
    "n",
    "<leader>qd",
    vim.diagnostic.setqflist,
    {
        noremap = true,
        silent = true,
        desc = "Add diagnostics to quickfix list",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>q<Down>",
    "<cmd>cnext<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Next on quickfix list",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>q<Up>",
    "<cmd>cprevious<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Previous on quickfix list",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>qo",
    "<cmd>copen<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Open quickfix list",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>qc",
    "<cmd>cclose<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Close quickfix list",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>qf",
    "<cmd>Telescope quickfix<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Quickfix list in Telescope",
    },
})
--#endregion
PatVimKeyMapSet({
    "t",
    "<esc><esc>",
    "<c-\\><c-n>",
    { desc = "Escape Escape exits terminal mode" },
})
--#region Delete
vim.api.nvim_set_keymap("n", "<leader>dd", '"_d', {
    noremap = true,
    silent = true,
    desc = "Delete without overriding clipboard",
})
vim.api.nvim_set_keymap("v", "<leader>dd", ':<C-U>normal! gv"_d<CR>', {
    noremap = true,
    silent = true,
    desc = "Delete without overriding clipboard",
})
vim.api.nvim_set_keymap("o", "<leader>dd", ':<C-U>normal! gv"_d<CR>', {
    noremap = true,
    silent = true,
    desc = "Delete without overriding clipboard",
})
vim.api.nvim_set_keymap("n", "<leader>dD", '"_d', {
    noremap = true,
    silent = true,
    desc = "Delete without overriding clipboard",
})
vim.api.nvim_set_keymap("v", "<leader>dD", ':<C-U>normal! gv"_d<CR>', {
    noremap = true,
    silent = true,
    desc = "Delete without overriding clipboard",
})
vim.api.nvim_set_keymap("o", "<leader>dD", ':<C-U>normal! gv"_d<CR>', {
    noremap = true,
    silent = true,
    desc = "Delete without overriding clipboard",
})
--#endregion
--#region Special
-- PatVimKeyMapSet({
--     { 'n', 'v', 'x', 's', 'c' },
--     '<Caps>',
--     '<Esc>',
--     { noremap = true }
-- })
-- PatVimKeyMapSet({
--     'i',
--     '<Caps>',
--     '<C-o>',
--     { noremap = true }
-- })
--#endregion
