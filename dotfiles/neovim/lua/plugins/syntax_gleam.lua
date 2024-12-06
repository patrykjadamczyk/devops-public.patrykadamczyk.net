return {
    {
        "gleam-lang/gleam.vim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "gleam",
            "*.gleam",
        },
        cond = function()
            -- Treesitter ?
            return false
        end,
    },
}
