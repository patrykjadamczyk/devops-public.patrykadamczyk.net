--#region TroubleToggle
vim.keymap.set("n", "<leader>tDd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
    noremap = true,
    silent = true,
    desc = "Open Trouble window for current document diagnostics",
})
vim.keymap.set("n", "<leader>tDw", "<cmd>Trouble diagnostics toggle<cr>", {
    noremap = true,
    silent = true,
    desc = "Open Trouble window for workspace diagnostics",
})
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through TODOs using Telescope",
})
--#endregion
