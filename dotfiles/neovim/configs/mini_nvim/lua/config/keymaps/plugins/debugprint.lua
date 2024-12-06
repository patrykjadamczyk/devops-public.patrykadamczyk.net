--#region Debugprint
PatVimKeyMapSet({
    "n",
    "g?c",
    "<cmd>ToggleCommentDebugPrints<cr>",
    { noremap = true, desc = "Toggle comment debug prints" },
})
PatVimKeyMapSet({
    "n",
    "g?d",
    "<cmd>DeleteDebugPrints<cr>",
    { noremap = true, desc = "Remove all debug prints" },
})
--#endregion
