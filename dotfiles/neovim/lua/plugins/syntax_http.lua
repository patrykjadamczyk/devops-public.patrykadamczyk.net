return {
    -- HTTP Syntax
    {
        "mistweaverco/kulala.nvim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "http",
            "*.http",
            "graphql",
            "*.graphql",
        },
        keys = {
            { "<leader>R", "", desc = "+Rest" },
            { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
            { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
            { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
            { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
            { "<leader>Re", "<cmd>lua require('kulala').set_selected_env()<cr>", desc = "Set environment" },
        },
        opts = {},
    },
}
