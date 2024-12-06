return {
    -- ===== Vim =====
    -- This is a simple plugin that helps to end certain structures automatically
    {
        "tpope/vim-endwise",
        priority = vim.g.patconfig_highest_base_priority - 530,
    },
    -- enable repeating supported plugin maps with "."
    {
        "tpope/vim-repeat",
        priority = vim.g.patconfig_highest_base_priority - 530,
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
    -- Better Quickfix (editable qf)
    {
        "itchyny/vim-qfedit",
        priority = vim.g.patconfig_highest_base_priority - 530,
    },
}
