return {
    -- Latex
    {
        "lervag/vimtex",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "tex",
            "*.tex",
        },
        config = function()
            vim.g.tex_flavor = "latex"
        end,
    },
}
