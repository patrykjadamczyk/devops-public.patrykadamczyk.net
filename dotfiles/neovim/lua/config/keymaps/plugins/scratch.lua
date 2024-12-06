--#region Scratch
PatVimKeyMapSet({
    "n",
    "<leader>sc",
    "<cmd>lua require('scretch').new_named()<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Make new named scratch file",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>sf",
    "<cmd>lua require('scretch').search()<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through scratch files",
    },
})
--#endregion
