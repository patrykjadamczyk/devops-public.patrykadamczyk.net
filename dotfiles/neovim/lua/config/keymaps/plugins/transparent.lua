--#region Toggle Transparent
PatVimKeyMapSet({
    "n",
    "<leader>ttt",
    "<cmd>TransparentToggle<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Toggle transparent background",
    },
})
--#endregion
