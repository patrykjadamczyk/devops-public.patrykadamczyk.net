return {
    -- Neovim Spider - better w
    {
        "chrisgrieser/nvim-spider",
        priority = vim.g.patconfig_highest_base_priority - 270,
        config = true,
        lazy = true,
        keys = {
            {
                "e",
                "<cmd>lua require('spider').motion('e')<CR>",
                mode = { "n", "o", "x" },
            },
            {
                "w",
                "<cmd>lua require('spider').motion('w')<CR>",
                mode = { "n", "o", "x" },
            },
            {
                "b",
                "<cmd>lua require('spider').motion('b')<CR>",
                mode = { "n", "o", "x" },
            },
            -- {
            --   "cw",
            --   "c<cmd>lua require('spider').motion('e')<CR>",
            --   mode = { "n", "o", "x" },
            -- },
            -- {
            --   "dw",
            --   "d<cmd>lua require('spider').motion('e')<CR>",
            --   mode = { "n", "o", "x" },
            -- },
        },
    },
    -- Peek when entering :line_nr
    {
        "nacro90/numb.nvim",
        priority = vim.g.patconfig_highest_base_priority - 270,
        config = function()
            require("numb").setup({
                show_numbers = true,
                show_cursorline = true,
                hide_relativenumbers = false,
            })
        end,
    },
    -- Highlight arguments' definitions and usages, using Treesitter
    {
        "m-demare/hlargs.nvim",
        priority = vim.g.patconfig_highest_base_priority - 270,
        config = function()
            require("hlargs").setup({})
        end,
    },
}
