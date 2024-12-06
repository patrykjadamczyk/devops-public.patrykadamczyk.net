return {
    -- Schemastore
    {
        "b0o/schemastore.nvim",
        priority = vim.g.patconfig_highest_base_priority - 290,
    },
    -- markdown preview plugin for (neo)vim
    {
        "iamcco/markdown-preview.nvim",
        priority = vim.g.patconfig_highest_base_priority - 290,
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    -- Ascii doc preview plugin for neovim
    {
        "tigion/nvim-asciidoc-preview",
        cmd = { "AsciiDocPreview" },
        ft = { "asciidoc" },
        build = "cd server && npm install",
        config = true,
        opts = {
            server = {
                -- Determines how the AsciiDoc file is converted to HTML for the preview.
                -- `js`  - asciidoctor.js (no local installation needed)
                -- `cmd` - asciidoctor command (local installation needed)
                -- converter = 'js',
                converter = "cmd",

                -- Determines the local port of the preview website.
                -- Must be between 10000 and 65535.
                port = 11235,
            },
            preview = {
                -- Determines the scroll position of the preview website.
                -- `current` - Keep current scroll position
                -- `start`   - Start of the website
                -- `sync`    - (experimental) Same (similar) position as in Neovim
                --             => inaccurate, because very content dependent
                -- position = 'current',
                position = "sync",
            },
        },
    },
}