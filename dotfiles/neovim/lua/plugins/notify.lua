return {
    -- ===== Notification =====
    -- A fancy, configurable, notification manager for NeoVim
    -- - Commands:
    -- - - :Notifications - Log of all notifications
    {
        "rcarriga/nvim-notify",
        priority = vim.g.patconfig_highest_base_priority - 80,
        config = function()
            -- ===================== Vim Notify ======================
            -- Setup Vim Notify
            require("notify").setup({
                background_colour = "#000000",
                top_down = false,
            })
            -- vim.notify = require("notify")
        end,
    },
}
