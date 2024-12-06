--#region Format through LSP
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", {
    noremap = true,
    silent = true,
    desc = "Format buffer using LSP",
})
vim.keymap.set("n", "<leader>lg", "<cmd><Esc>gg=G<cr>", {
    noremap = true,
    silent = true,
    desc = "Reindent file",
})
--#endregion
--#region Inlay Hints
vim.keymap.set("n", "<leader>th", "<cmd>lua vim.lsp.inlay_hint.enable(true, {})<cr>", {
    noremap = true,
    silent = true,
    desc = "Toggle inlay hints",
})
--#endregion
--#region LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(_)
        vim.api.nvim_create_user_command("LspFormat", function()
            vim.lsp.buf.format()
        end, { desc = "Format buffer with language server" })

        -- LSP actions
        -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
        -- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
        vim.keymap.set("n", "gK", "<cmd>Lspsaga hover_doc<cr>", {
            desc = "Hover Documentation",
        })
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {
            desc = "Go to definition",
        })
        -- vim.keymap.set(
        --   'n',
        --   'gd',
        --   '<cmd>Lspsaga goto_definition<cr>',
        --   {
        --     desc = "Go to definition"
        --   }
        -- )
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {
            desc = "Go to declaration",
        })
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {
            desc = "Show implementations",
        })
        -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
        vim.keymap.set("n", "grt", "<cmd>Lspsaga goto_type_definition<cr>", {
            desc = "Go to type definition",
        })
        vim.keymap.set("n", "grpt", "<cmd>Lspsaga peek_type_definition<cr>", {
            desc = "Peek type definition",
        })
        -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
        vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<cr>", {
            desc = "Show References from LSP",
        })
        -- vim.keymap.set(
        --   'n',
        --   'gs',
        --   '<cmd>lua vim.lsp.buf.signature_help()<cr>',
        --   {
        --     desc = "Show signature help"
        --   }
        -- )
        -- vim.keymap.set('n', 'gs', '<cmd>Lspsaga signature_help<cr>')
        -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
        vim.keymap.set("n", "grn", "<cmd>Lspsaga rename<cr>", {
            desc = "Rename through LSP",
        })
        vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<cr>", {
            desc = "Rename through LSP",
        })
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", {
            desc = "Format code using LSP",
        })
        -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        -- vim.keymap.set('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
        vim.keymap.set("n", "gra", "<cmd>Lspsaga code_action<cr>", {
            desc = "Show code actions",
        })
        vim.keymap.set("x", "gra", "<cmd>Lspsaga range_code_action<cr>", {
            desc = "Show code actions on range",
        })
        vim.keymap.set("n", "<F4>", "<cmd>Lspsaga code_action<cr>", {
            desc = "Show code actions",
        })
        vim.keymap.set("x", "<F4>", "<cmd>Lspsaga range_code_action<cr>", {
            desc = "Show code actions on range",
        })

        -- Diagnostics
        -- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
        -- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
        -- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
        vim.keymap.set("n", "<C-w>d", "<cmd>Lspsaga show_line_diagnostics<cr>", {
            desc = "Show line diagnostics",
        })
        vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", {
            desc = "Show line diagnostics",
        })
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {
            desc = "Go to previous diagnostic",
        })
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", {
            desc = "Go to next diagnostic",
        })
        vim.keymap.set("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {
            desc = "Show signature help",
        })
    end,
})
--#endregion
