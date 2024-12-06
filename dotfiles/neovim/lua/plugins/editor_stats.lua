return {
    -- Code::Stats Plugin
    -- {
    --     "https://gitlab.com/code-stats/code-stats-vim.git",
    --     priority = vim.g.patconfig_highest_base_priority - 320,
    --     cond = function()
    --         return false
    --         -- return vim.fn.has("nvim-0.11") == 0
    --     end,
    --     -- This plugin can't be lazy loaded because everything explodes in noice
    --     -- event = "VeryLazy",
    --     --vim.g.codestats_api_key
    -- },
    {
        'YannickFricke/codestats.nvim',
        priority = vim.g.patconfig_highest_base_priority - 320,
        config = function()
            require('codestats-nvim').setup({
                token = vim.g.codestats_api_key,
            })
        end,
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    }
}
