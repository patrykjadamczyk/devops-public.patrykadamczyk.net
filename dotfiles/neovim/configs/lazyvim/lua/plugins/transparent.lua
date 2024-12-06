return {
    -- ===== UI Utils =====
    -- Transparent background on demand
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
                -- "NvimTreeNormal", -- NvimTree
            },
        },
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "night",
            -- transparent = true,
            transparent = vim.g.transparent_enabled,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
}
