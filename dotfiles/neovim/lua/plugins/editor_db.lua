return {
    -- Database Editor
    {
        "tpope/vim-dadbod",
        priority = vim.g.patconfig_highest_base_priority - 300,
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        priority = vim.g.patconfig_highest_base_priority - 300,
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        priority = vim.g.patconfig_highest_base_priority - 300,
        dependencies = {
            "tpope/vim-dadbod",
        },
    },
}
