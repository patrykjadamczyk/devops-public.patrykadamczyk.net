return {
    -- A neovim lua plugin to help easily manage multiple terminal windows
    {
        "akinsho/toggleterm.nvim",
        priority = vim.g.patconfig_highest_base_priority - 250,
        version = "*",
        opts = {},
    },
}
