--#region Lazy
-- Open Lazy
PatVimKeyMapSet({
    "n",
    "<leader>LL",
    "<cmd>Lazy<cr>",
    {
        silent = true,
        desc = "Open lazy.nvim",
    },
})
--#endregion
--#region Mason
-- Open Mason
PatVimKeyMapSet({
    "n",
    "<leader>LM",
    "<cmd>Mason<cr>",
    {
        silent = true,
        desc = "Open mason.nvim",
    },
})
--#endregion
