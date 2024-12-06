--#region WhichKey
PatVimKeyMapSet({
    "n",
    "<leader><leader>??",
    "<cmd>WhichKey<cr>",
    { noremap = true, desc = "Show WhichKey - All" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?n",
    '<cmd>WhichKey "" n<cr>',
    { noremap = true, desc = "Show WhichKey - Normal Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?i",
    '<cmd>WhichKey "" i<cr>',
    { noremap = true, desc = "Show WhichKey - Insert Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?v",
    '<cmd>WhichKey "" v<cr>',
    { noremap = true, desc = "Show WhichKey - Visual / Select Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?s",
    '<cmd>WhichKey "" s<cr>',
    { noremap = true, desc = "Show WhichKey - Select Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?x",
    '<cmd>WhichKey "" x<cr>',
    { noremap = true, desc = "Show WhichKey - Visual Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?o",
    '<cmd>WhichKey "" o<cr>',
    { noremap = true, desc = "Show WhichKey - Operator Pending Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?R",
    '<cmd>WhichKey "" R<cr>',
    { noremap = true, desc = "Show WhichKey - Replace Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?c",
    '<cmd>WhichKey "" c<cr>',
    { noremap = true, desc = "Show WhichKey - Command Mode" },
})
PatVimKeyMapSet({
    "n",
    "<leader><leader>?t",
    '<cmd>WhichKey "" t<cr>',
    { noremap = true, desc = "Show WhichKey - Terminal Mode" },
})
--#endregion
