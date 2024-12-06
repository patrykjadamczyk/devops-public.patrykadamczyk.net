--#region Nvim-cmp / Autocomplete
vim.keymap.set("i", "<C-space>", "<cmd>lua require('cmp').complete()<cr>", {
    silent = true,
    desc = "Force autocomplete",
})
vim.keymap.set("i", "<C-c>", "<cmd>lua require('cmp').complete()<cr>", {
    silent = true,
    desc = "Force autocomplete",
})
--#endregion
