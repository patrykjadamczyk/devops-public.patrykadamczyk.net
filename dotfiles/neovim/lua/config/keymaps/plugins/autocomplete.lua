--#region Nvim-cmp / Autocomplete
PatVimKeyMapSet({
    "i",
    "<C-space>",
    "<cmd>lua require('cmp').complete()<cr>",
    {
        silent = true,
        desc = "Force autocomplete",
    },
})
PatVimKeyMapSet({
    "i",
    "<C-c>",
    "<cmd>lua require('cmp').complete()<cr>",
    {
        silent = true,
        desc = "Force autocomplete",
    },
})
--#endregion
