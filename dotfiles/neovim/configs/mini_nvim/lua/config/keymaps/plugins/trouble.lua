--#region TroubleToggle
PatVimKeyMapSet({
    "n",
    "<leader>ttd",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Open Trouble window for current document diagnostics",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>ttw",
    "<cmd>Trouble diagnostics toggle<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Open Trouble window for workspace diagnostics",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>ft",
    "<cmd>TodoTelescope<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through TODOs using Telescope",
    },
})
--#endregion
--#region TroubleToggle From lazyvim
PatVimKeyMapSet({
    "n",
    "<leader>tS",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Trouble Symbols",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>tS",
    "<cmd>Trouble lsp toggle focus=false<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Trouble LSP Refs/Defs/Impls",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>tq",
    "<cmd>Trouble qflist toggle<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Trouble Toggle Quickfix List",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>tl",
    "<cmd>Trouble loclist toggle<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Trouble Toggle Location List",
    },
})
PatVimKeyMapSet({
    "n",
    "[O",
    function()
        if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
        else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
                vim.notify(err, vim.log.levels.ERROR)
            end
        end
    end,
    {
        noremap = true,
        silent = true,
        desc = "Previous Trouble/Quickfix Item",
    },
})
PatVimKeyMapSet({
    "n",
    "]O",
    function()
        if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
        else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
                vim.notify(err, vim.log.levels.ERROR)
            end
        end
    end,
    {
        noremap = true,
        silent = true,
        desc = "Next Trouble/Quickfix Item",
    },
})
--#endregion
