return {
    -- Better folds
    {
        "kevinhwang91/nvim-ufo",
        priority = vim.g.patconfig_highest_base_priority - 310,
        dependencies = {
            "kevinhwang91/promise-async",
        },
    },
    -- Rainbow delimeters
    {
        "HiPhish/rainbow-delimiters.nvim",
        priority = vim.g.patconfig_highest_base_priority - 310,
        config = false,
    },
}
