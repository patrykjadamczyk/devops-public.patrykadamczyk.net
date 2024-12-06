return {
    -- Codium Code Completion
    -- Changed in code: https://github.com/patrykjadamczyk/codeium.vim
    -- {
    --   'Exafunction/codeium.vim',
    --   priority = vim.g.patconfig_highest_base_priority - 20,
    --   cond = function()
    --     return false
    --   end,
    -- },
    {
        "Exafunction/codeium.nvim",
        lazy = false,
        cmd = "Codeium",
        build = ":Codeium Auth",
        priority = vim.g.patconfig_highest_base_priority - 20,
        opts = {
            enable_chat = true,
        },
    },
}
