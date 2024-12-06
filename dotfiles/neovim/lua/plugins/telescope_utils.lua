return {
    -- ===== Telescope =====
    -- Disable/Enable LSP clients for buffers.
    {
        "adoyle-h/lsp-toggle.nvim",
        config = true,
        priority = vim.g.patconfig_highest_base_priority - 170,
    },
}
