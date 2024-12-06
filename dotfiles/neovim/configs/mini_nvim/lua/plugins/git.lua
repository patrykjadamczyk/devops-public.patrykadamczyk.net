return {
    -- ===== Git =====
    -- LazyGit
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        priority = vim.g.patconfig_highest_base_priority - 170,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- config = true,
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
}
