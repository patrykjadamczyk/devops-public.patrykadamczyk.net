---- Add LSP keybinds using Omnisharp-Extended-LSP.nvim
if (vim.g.patconfig_csharp_server__omnisharp_ft_keymaps == 1) then
-- replaces vim.lsp.buf.definition()
vim.keymap.set(
    'n',
    'gd',
    require('omnisharp_extended').lsp_definition,
    {
        desc = 'Go to definition',
        noremap = true,
        buffer = true,
    }
)

-- replaces vim.lsp.buf.type_definition()
vim.keymap.set(
    'n',
    'grt',
    require('omnisharp_extended').lsp_type_definition,
    {
        desc = 'Go to type definition',
        noremap = true,
        buffer = true,
    }
)

-- replaces vim.lsp.buf.references()
vim.keymap.set(
    'n',
    'grr',
    require('omnisharp_extended').lsp_references,
    {
        desc = 'Show references',
        noremap = true,
        buffer = true,
    }
)

-- replaces vim.lsp.buf.implementation()
vim.keymap.set(
    'n',
    'gri',
    require('omnisharp_extended').lsp_implementation,
    {
        desc = 'Show implementations',
        noremap = true,
        buffer = true,
    }
)
end
