return {
    -- Hurl Syntax
    {
        "samueljoli/hurl.nvim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "hurl",
            "*.hurl",
        },
        config = function()
            require("hurl").setup({})
        end,
    },
}
