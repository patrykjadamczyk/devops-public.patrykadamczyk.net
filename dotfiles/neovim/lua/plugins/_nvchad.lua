return {
    -- "nvim-lua/plenary.nvim",
    -- {
    --     "nvchad/ui",
    --     priority = vim.g.patconfig_highest_base_priority - 260,
    --     config = function()
    --         require "nvchad"
    --     end
    -- },
    {
        "nvchad/volt",
        priority = vim.g.patconfig_highest_base_priority - 260,
        lazy = true,
    },
    {
        "nvchad/menu",
        priority = vim.g.patconfig_highest_base_priority - 260,
        lazy = true,
        config = function() end,
    },
    {
        "nvchad/minty",
        priority = vim.g.patconfig_highest_base_priority - 260,
        cmd = { "Shades", "Huefy" },
        opts = { huefy = { border = false } },
    },
}
