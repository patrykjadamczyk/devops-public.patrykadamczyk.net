return {
    {
        "supermaven-inc/supermaven-nvim",
        -- build = ":SupermavenUseFree", -- remove this line if you are using pro
        config = function()
            -- If you dont see link use logout then try again
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-S-j>",
                    -- clear_suggestion = "<C-e>",
                    -- accept_word = "<C-j>",
                },
            })
            local api = require("supermaven-nvim.api")
            -- api.restart() -- restarts supermaven-nvim if it is running, otherwise starts it
            -- api.use_free_version() -- switch to the free version
        end,
    },
}
