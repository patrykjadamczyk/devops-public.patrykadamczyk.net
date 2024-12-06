return {
    {
        "kmonad/kmonad-vim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "kmonad",
            "kbd",
            "*.kbd",
        },
    },
}
