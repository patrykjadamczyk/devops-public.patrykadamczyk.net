return {
    -- ===== Git =====
    -- NeoGit
    {
        "NeogitOrg/neogit",
        lazy = true,
        cmd = "Neogit",
        priority = vim.g.patconfig_highest_base_priority - 170,
        cond = function()
            return false
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        config = true,
    },
}
