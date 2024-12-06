--#region Sort selection
PatVimKeyMapSet({
    "v",
    "<leader>ss",
    "<cmd>sort<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Sort selection",
    },
})
--#endregion
--#region Select current line
PatVimKeyMapSet({
    "n",
    "<leader>vv",
    "0v$",
    {
        noremap = true,
        silent = true,
        desc = "Select current line",
    },
})
--#endregion
--#region Replace
-- Replace in selection
PatVimKeyMapSet({
    "v",
    "<leader>rz",
    ":s///g<left><left><left>",
    { desc = "Replace in selection" },
})
-- Replace all occurences of selection
PatVimKeyMapSet({
    "v",
    "<leader>rs",
    '"hy:%s/<C-r>h//g<left><left>',
    { desc = "Replace all occurences of selection" },
})
-- Delete all lines with occurences of selection
PatVimKeyMapSet({
    "v",
    "<leader>rd",
    '"hy:%g/<C-r>h/d<cr>',
    { desc = "Delete all lines with occurences of selection" },
})
-- Non linear g<C-a>
PatVimKeyMapSet({
    "n",
    "<leader>rn",
    [[:let idx=0 | g/^.*1/ let idx += 1 | s/1[0-9]*/\= idx/]],
    { desc = "Non linear g<C-a>" },
})
PatVimKeyMapSet({
    "v",
    "<leader>rn",
    -- What this does: Go to command mode, remove `'<,'>` from command line, make variable
    -- execute g on range and substitute all numbers from variable
    [[:<BS><BS><BS><BS><BS>let idx=0 | '<,'>g/^.*1/ let idx += 1 | s/1[0-9]*/\= idx/]],
    { desc = "Non linear g<C-a>" },
})
--#endregion
