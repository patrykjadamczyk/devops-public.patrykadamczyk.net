--#region Neorg
PatVimKeyMapSet({
    "n",
    "<leader>nj",
    "<cmd>Neorg journal today<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Open today's neorg journal entry",
    },
})
--#endregion
