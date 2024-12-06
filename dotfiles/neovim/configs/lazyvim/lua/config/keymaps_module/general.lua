--#region Additional Keybinds
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", {
    desc = "Save file",
})
--#endregion
--#region Terminal
vim.keymap.set(
    "t",
    "<C-x>",
    vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
    { desc = "Exit terminal mode" }
)
--#endregion
--#region Quickfix
vim.keymap.set("n", "<leader>qd", vim.diagnostic.setqflist, {
    noremap = true,
    silent = true,
    desc = "Add diagnostics to quickfix list",
})
vim.keymap.set("n", "<leader>q<Down>", "<cmd>cnext<cr>", {
    noremap = true,
    silent = true,
    desc = "Next on quickfix list",
})
vim.keymap.set("n", "<leader>q<Up>", "<cmd>cprevious<cr>", {
    noremap = true,
    silent = true,
    desc = "Previous on quickfix list",
})
vim.keymap.set("n", "<leader>qo", "<cmd>copen<cr>", {
    noremap = true,
    silent = true,
    desc = "Open quickfix list",
})
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<cr>", {
    noremap = true,
    silent = true,
    desc = "Close quickfix list",
})
vim.keymap.set("n", "<leader>qf", "<cmd>Telescope quickfix<cr>", {
    noremap = true,
    silent = true,
    desc = "Quickfix list in Telescope",
})
--#endregion
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Escape Escape exits terminal mode" })
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
