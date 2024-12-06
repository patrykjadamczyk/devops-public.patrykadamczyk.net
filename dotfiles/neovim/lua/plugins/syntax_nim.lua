return {
    {
        "alaviss/nim.nvim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "nim",
            "*.nim",
            "*.nims",
            "nim.cfg",
            "*.nim.cfg",
            "*.nimble",
        },
    },
}
