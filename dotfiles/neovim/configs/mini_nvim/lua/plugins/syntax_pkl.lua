return {
    {
        "https://github.com/apple/pkl-neovim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        lazy = true,
        event = "BufReadPre *.pkl",
        ft = {
            "pkl",
            "*.pkl",
            "PklProject",
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        build = function()
            vim.cmd("TSInstall! pkl")
        end,
    },
}
