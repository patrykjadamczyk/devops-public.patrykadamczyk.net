return {
    -- Multiple cursors plugin for vim/neovim
    -- {
    --     "mg979/vim-visual-multi",
    --     priority = vim.g.patconfig_highest_base_priority - 270,
    --     branch = "master",
    --     --    cond =  function()
    --     --        return false
    --     --    end,
    --     init = function()
    --         vim.g.VM_default_mappings = 0
    --         vim.g.VM_maps = {
    --             ["Find Under"] = "<C-d>d",
    --         }
    --     end,
    -- },
    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*",
        opts = {},
        config = true,
        keys = {
            {
                "<A-j>",
                "<Cmd>MultipleCursorsAddDown<CR>",
                mode = { "n", "x" },
                desc = "Add cursor and move down",
            },
            {
                "<A-k>",
                "<Cmd>MultipleCursorsAddUp<CR>",
                mode = { "n", "x" },
                desc = "Add cursor and move up",
            },
            -- {
            --     "<C-Up>",
            --     "<Cmd>MultipleCursorsAddUp<CR>",
            --     mode = {"n", "i", "x"},
            --     desc = "Add cursor and move up"
            -- },
            -- {
            --     "<C-Down>",
            --     "<Cmd>MultipleCursorsAddDown<CR>",
            --     mode = {"n", "i", "x"},
            --     desc = "Add cursor and move down"
            -- },
            {
                "<C-LeftMouse>",
                "<Cmd>MultipleCursorsMouseAddDelete<CR>",
                mode = { "n", "i" },
                desc = "Add or remove cursor",
            },
            -- {
            --     "<Leader>a",
            --     "<Cmd>MultipleCursorsAddMatches<CR>",
            --     mode = {"n", "x"},
            --     desc = "Add cursors to cword"
            -- },
            -- {
            --     "<Leader>A",
            --     "<Cmd>MultipleCursorsAddMatchesV<CR>",
            --     mode = {"n", "x"},
            --     desc = "Add cursors to cword in previous area"
            -- },
            -- {
            --     "<Leader>d",
            --     "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
            --     mode = {"n", "x"},
            --     desc = "Add cursor and jump to next cword"
            -- },
            -- {
            --     "<Leader>D",
            --     "<Cmd>MultipleCursorsJumpNextMatch<CR>",
            --     mode = {"n", "x"},
            --     desc = "Jump to next cword"
            -- },
            {
                "<Leader>Ll",
                "<Cmd>MultipleCursorsLock<CR>",
                mode = { "n", "x" },
                desc = "Lock virtual cursors",
            },
        },
    },
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
