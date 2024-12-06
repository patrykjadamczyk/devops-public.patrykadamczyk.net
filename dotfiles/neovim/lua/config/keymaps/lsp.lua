--#region Format through LSP
PatVimKeyMapSet({
    "n",
    "<leader>lf",
    "<cmd>lua vim.lsp.buf.format()<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Format buffer using LSP",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lg",
    "<cmd><Esc>gg=G<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Reindent file",
    },
})
--#endregion
--#region Inlay Hints
PatVimKeyMapSet({
    "n",
    "<leader>th",
    -- "<cmd>lua vim.lsp.inlay_hint.enable(true, {})<cr>",
    function()
        local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
        if type(ih) == "function" then
            ih(nil, nil)
        elseif type(ih) == "table" and ih.enable then
            local value = not ih.is_enabled({ bufnr = 0 })
            ih.enable(value, { bufnr = 0 })
        end
    end,
    {
        noremap = true,
        silent = true,
        desc = "Toggle inlay hints",
    },
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
        -- PatVimKeyMapSet({'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>'})
        -- PatVimKeyMapSet({'n', 'K', '<cmd>Lspsaga hover_doc<cr>'})
        PatVimKeyMapSet({
            "n",
            "gK",
            "<cmd>Lspsaga hover_doc<cr>",
            {
                desc = "Hover Documentation",
            },
        })
        PatVimKeyMapSet({
            "n",
            "gd",
            "<cmd>lua vim.lsp.buf.definition()<cr>",
            {
                desc = "Go to definition",
            },
        })
        -- PatVimKeyMapSet({
        --   'n',
        --   'gd',
        --   '<cmd>Lspsaga goto_definition<cr>',
        --   {
        --     desc = "Go to definition"
        --   }
        -- })
        PatVimKeyMapSet({
            "n",
            "gD",
            "<cmd>lua vim.lsp.buf.declaration()<cr>",
            {
                desc = "Go to declaration",
            },
        })
        PatVimKeyMapSet({
            "n",
            "gri",
            -- "<cmd>lua vim.lsp.buf.implementation()<cr>",
            "<cmd>Telescope lsp_implementations<cr>",
            {
                desc = "Show implementations",
            },
        })
        -- PatVimKeyMapSet({'n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>'})
        PatVimKeyMapSet({
            "n",
            "grt",
            "<cmd>Lspsaga goto_type_definition<cr>",
            {
                desc = "Go to type definition",
            },
        })
        PatVimKeyMapSet({
            "n",
            "grpt",
            "<cmd>Lspsaga peek_type_definition<cr>",
            {
                desc = "Peek type definition",
            },
        })
        -- PatVimKeyMapSet({'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>'})
        PatVimKeyMapSet({
            "n",
            "grr",
            "<cmd>Telescope lsp_references<cr>",
            {
                desc = "Show References from LSP",
            },
        })
        PatVimKeyMapSet({
            "n",
            "grS",
            "<cmd>lua vim.lsp.buf.signature_help()<cr>",
            {
                desc = "Show signature help",
            },
        })
        -- PatVimKeyMapSet({'n', 'gs', '<cmd>Lspsaga signature_help<cr>'})
        -- PatVimKeyMapSet({'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>'})
        PatVimKeyMapSet({
            "n",
            "grn",
            "<cmd>Lspsaga rename<cr>",
            {
                desc = "Rename through LSP",
            },
        })
        PatVimKeyMapSet({
            "n",
            "<F2>",
            "<cmd>Lspsaga rename<cr>",
            {
                desc = "Rename through LSP",
            },
        })
        PatVimKeyMapSet({
            { "n", "x" },
            "<F3>",
            "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
            {
                desc = "Format code using LSP",
            },
        })
        -- PatVimKeyMapSet({'n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>'})
        -- PatVimKeyMapSet({'x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>'})
        PatVimKeyMapSet({
            "n",
            "gra",
            "<cmd>Lspsaga code_action<cr>",
            {
                desc = "Show code actions",
            },
        })
        PatVimKeyMapSet({
            "x",
            "gra",
            "<cmd>Lspsaga range_code_action<cr>",
            {
                desc = "Show code actions on range",
            },
        })
        PatVimKeyMapSet({
            "n",
            "<F4>",
            "<cmd>Lspsaga code_action<cr>",
            {
                desc = "Show code actions",
            },
        })
        PatVimKeyMapSet({
            "x",
            "<F4>",
            "<cmd>Lspsaga range_code_action<cr>",
            {
                desc = "Show code actions on range",
            },
        })

        PatVimKeyMapSet({
            { "n", "v" },
            "<leader>lc",
            vim.lsp.codelens.run,
            {
                desc = "Run Codelens",
            },
        })
        PatVimKeyMapSet({
            "n",
            "<leader>lC",
            vim.lsp.codelens.refresh,
            {
                desc = "Refresh & Display Codelens",
            },
        })

        -- Diagnostics
        -- PatVimKeyMapSet({'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>'})
        -- PatVimKeyMapSet({'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>'})
        -- PatVimKeyMapSet({'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>'})
        PatVimKeyMapSet({
            "n",
            "<C-w>d",
            "<cmd>Lspsaga show_line_diagnostics<cr>",
            {
                desc = "Show line diagnostics",
            },
        })
        PatVimKeyMapSet({
            "n",
            "gl",
            "<cmd>Lspsaga show_line_diagnostics<cr>",
            {
                desc = "Show line diagnostics",
            },
        })
        PatVimKeyMapSet({
            "n",
            "[d",
            "<cmd>Lspsaga diagnostic_jump_prev<cr>",
            {
                desc = "Go to previous diagnostic",
            },
        })
        PatVimKeyMapSet({
            "n",
            "]d",
            "<cmd>Lspsaga diagnostic_jump_next<cr>",
            {
                desc = "Go to next diagnostic",
            },
        })
        PatVimKeyMapSet({
            "i",
            "<C-s>",
            "<cmd>lua vim.lsp.buf.signature_help()<cr>",
            {
                desc = "Show signature help",
            },
        })
    end,
})
--#endregion
