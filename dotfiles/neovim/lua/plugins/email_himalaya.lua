return {
    {
        -- "https://git.sr.ht/~soywod/himalaya-vim",
        "patrykjadamczyk/himalaya-vim",
        lazy = true,
        cmd = "Himalaya",
        version = false,
        config = true,
        priority = vim.g.patconfig_highest_base_priority - 540,
    },
}
