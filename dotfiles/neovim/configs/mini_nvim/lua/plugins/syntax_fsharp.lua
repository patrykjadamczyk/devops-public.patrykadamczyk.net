return {
    -- F# Syntax
    {
        "adelarsq/neofsharp.vim",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "fsharp",
            "*.fs",
            "*.fsx",
            "*.fsi",
            "*.fsscript",
            "*.fsl",
            "*.fsy",
            "*.fsproj",
        },
    },
}
