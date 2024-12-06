--#region LSP Saga Keymaps
vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga show_buf_diagnostics<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through diagnostics for current buffer using Telescope",
})
vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<cr>", {
    desc = "Go to definition",
})
vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<cr>", {
    noremap = true,
    silent = true,
    desc = "Peek definition using LSP Saga",
})
vim.keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", {
    noremap = true,
    silent = true,
    desc = "Show hover documentation using LSP Saga",
})
vim.keymap.set("n", "<leader>ls", "<cmd>Lspsaga finder tyd+ref+imp+def<cr>", {
    noremap = true,
    silent = true,
    desc = "Show finder using LSP Saga",
})
--#endregion
--#region LSP Saga Terminal
vim.keymap.set("n", "<A-t>", "<cmd>Lspsaga term_toggle<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle terminal from LSP Saga",
})
--#endregion
