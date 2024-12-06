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
        PatVimKeyMapSet({
            'n',
            'grt',
            '<cmd>lua vim.lsp.buf.type_definition()<cr>',
            {
                desc = "Go to type definition",
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
        PatVimKeyMapSet({
            'n',
            '<F2>',
            '<cmd>lua vim.lsp.buf.rename()<cr>',
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
        PatVimKeyMapSet({
            'n',
            '<F4>',
            '<cmd>lua vim.lsp.buf.code_action()<cr>',
            {
                desc = "Show code actions",
            },
        })
        PatVimKeyMapSet({
            'x',
            '<F4>',
            '<cmd>lua vim.lsp.buf.range_code_action()<cr>',
            {
                desc = "Show code actions",
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
        PatVimKeyMapSet({
            'n',
            'gl',
            '<cmd>lua vim.diagnostic.open_float()<cr>',
            {
                desc = "Show line diagnostics",
            },
        })
        PatVimKeyMapSet({
            "n",
            "<C-w>d",
            '<cmd>lua vim.diagnostic.open_float()<cr>',
            {
                desc = "Show line diagnostics",
            },
        })
        PatVimKeyMapSet({
            'n',
            '[d',
            '<cmd>lua vim.diagnostic.goto_prev()<cr>',
            {
                desc = "Go to previous diagnostic",
            },
        })
        PatVimKeyMapSet({
            'n',
            ']d',
            '<cmd>lua vim.diagnostic.goto_next()<cr>',
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
