return {
    -- ===== LSP =====
    -- LSP Actions
    {
        "glepnir/lspsaga.nvim",
        priority = vim.g.patconfig_highest_base_priority - 110,
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                ui = {
                    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
                },
            })
        end,
    },
}
