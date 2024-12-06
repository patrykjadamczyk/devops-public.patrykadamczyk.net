--#region Debugprint
vim.keymap.set(
    "n",
    "g?c",
    "<cmd>ToggleCommentDebugPrints<cr>",
    { noremap = true, desc = "Toggle comment debug prints" }
)
vim.keymap.set("n", "g?d", "<cmd>DeleteDebugPrints<cr>", { noremap = true, desc = "Remove all debug prints" })
--#endregion
