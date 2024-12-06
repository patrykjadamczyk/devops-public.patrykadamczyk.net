return {
    -- Haxe Syntax
    {
        "jdonaldson/vaxe",
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = {
            "haxe",
            "*.hx",
            "*.hxml",
        },
    },
}
