return {
    "mbbill/undotree",
    priority = vim.g.patconfig_highest_base_priority - 530,
    lazy = false,
    keys = {
        {
            "<leader>uf",
            "<cmd>UndotreeToggle<CR>",
            silent = true,
            desc = "Open UndoTree",
            mode = { "n" },
        },
    },
}
