vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        -- Turn Inlay Hints On by Default
        for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/inlayHint" })) do
            if client.server_capabilities.inlayHintProvider then
                -- vim.lsp.inlay_hint.enable(args.buf, true)
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                break
            end
        end

        -- Turn Document Highlight on
        -- local group = vim.api.nvim_create_augroup(string.format("LspDocHightlight:%s", args.buf), { clear = true })
        -- for _, client in ipairs(vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/documentHighlight" })) do
        --     if client.server_capabilities.documentHighlightProvider then
        --         vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        --             buffer = args.buf,
        --             group = group,
        --             callback = vim.lsp.buf.document_highlight,
        --         })
        --         vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        --             buffer = args.buf,
        --             group = group,
        --             callback = vim.lsp.buf.clear_references,
        --         })
        --         break
        --     end
        -- end
    end,
})
