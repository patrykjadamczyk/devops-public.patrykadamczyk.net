--#region Visual Multi Cursor Mode
PatVimKeyMapSet({
    "n",
    "<C-d>b",
    "<Plug>(VM-Start-Regex-Search)",
    {
        silent = true,
        desc = "Search using Regex for adding next cursor",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-d>d",
    "<Plug>(VM-Find-Under)",
    {
        silent = true,
        desc = "Add new cursor to next occurence of word under cursor",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-S-Up>",
    "<Plug>(VM-Add-Cursor-Up)",
    {
        silent = true,
        desc = "Add cursor above current line",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-S-Down>",
    "<Plug>(VM-Add-Cursor-Down)",
    {
        silent = true,
        desc = "Add cursor below current line",
    },
})
--#endregion
