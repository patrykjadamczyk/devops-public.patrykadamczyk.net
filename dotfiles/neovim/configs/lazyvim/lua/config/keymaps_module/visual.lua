--#region Sort selection
vim.keymap.set("v", "<leader>ss", "<cmd>sort<cr>", {
    noremap = true,
    silent = true,
    desc = "Sort selection",
})
--#endregion
--#region Select current line
vim.keymap.set("n", "<leader>vv", "0v$", {
    noremap = true,
    silent = true,
    desc = "Select current line",
})
--#endregion
--#region Replace
-- Replace all occurences of selection
vim.keymap.set("v", "<leader>rs", '"hy:%s/<C-r>h//g<left><left>', { desc = "Replace all occurences of selection" })
-- Delete all lines with occurences of selection
vim.keymap.set("v", "<leader>rd", '"hy:%g/<C-r>h/d<cr>', { desc = "Delete all lines with occurences of selection" })
--#endregion
