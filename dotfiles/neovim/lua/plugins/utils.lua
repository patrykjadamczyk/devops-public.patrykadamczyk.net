return {
    -- ===== Vim =====
    -- This is a simple plugin that helps to end certain structures automatically
    {
        "tpope/vim-endwise",
        priority = vim.g.patconfig_highest_base_priority - 530,
    },
    -- Convenience file operations for neovim, written in lua.
    {
        "chrisgrieser/nvim-genghis",
        priority = vim.g.patconfig_highest_base_priority - 530,
        dependencies = "stevearc/dressing.nvim",
    },
    -- enable repeating supported plugin maps with "."
    {
        "tpope/vim-repeat",
        priority = vim.g.patconfig_highest_base_priority - 530,
    },
    -- Better Comments (having option to use tresitter and stuff)
    -- - Commands:
    -- - - `gcc` - Toggles the current line using linewise comment
    -- - - `gbc` - Toggles the current line using blockwise comment
    -- - - `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
    -- - - `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
    -- - - `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
    -- - - `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
    -- - - VISUAL mode
    -- - - `gc` - Toggles the region using linewise comment
    -- - - `gb` - Toggles the region using blockwise comment
    {
        "numToStr/Comment.nvim",
        priority = vim.g.patconfig_highest_base_priority - 530,
        config = function()
            local config = {
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            }
            require("Comment").setup(config)
        end,
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
    -- ===== Other =====
    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        priority = vim.g.patconfig_highest_base_priority - 530,
        config = function()
            require("harpoon"):setup()
        end,
    },
    -- Sudo
    {
        "lambdalisue/suda.vim",
        priority = vim.g.patconfig_highest_base_priority - 530,
    },
    -- Wezterm Stuff
    {
        "willothy/wezterm.nvim",
        priority = vim.g.patconfig_highest_base_priority - 530,
        config = true,
    },
    -- Better Quickfix (editable qf)
    {
        "itchyny/vim-qfedit",
        priority = vim.g.patconfig_highest_base_priority - 530,
    },
}
