--#region WhichKey
vim.keymap.set("n", "<leader><leader>??", "<cmd>WhichKey<cr>", { noremap = true, desc = "Show WhichKey - All" })
vim.keymap.set(
    "n",
    "<leader><leader>?n",
    '<cmd>WhichKey "" n<cr>',
    { noremap = true, desc = "Show WhichKey - Normal Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?i",
    '<cmd>WhichKey "" i<cr>',
    { noremap = true, desc = "Show WhichKey - Insert Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?v",
    '<cmd>WhichKey "" v<cr>',
    { noremap = true, desc = "Show WhichKey - Visual / Select Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?s",
    '<cmd>WhichKey "" s<cr>',
    { noremap = true, desc = "Show WhichKey - Select Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?x",
    '<cmd>WhichKey "" x<cr>',
    { noremap = true, desc = "Show WhichKey - Visual Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?o",
    '<cmd>WhichKey "" o<cr>',
    { noremap = true, desc = "Show WhichKey - Operator Pending Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?R",
    '<cmd>WhichKey "" R<cr>',
    { noremap = true, desc = "Show WhichKey - Replace Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?c",
    '<cmd>WhichKey "" c<cr>',
    { noremap = true, desc = "Show WhichKey - Command Mode" }
)
vim.keymap.set(
    "n",
    "<leader><leader>?t",
    '<cmd>WhichKey "" t<cr>',
    { noremap = true, desc = "Show WhichKey - Terminal Mode" }
)
--#endregion
