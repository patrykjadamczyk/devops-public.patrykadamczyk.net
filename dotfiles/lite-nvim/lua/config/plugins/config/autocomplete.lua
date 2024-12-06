-- vim.g.codeium_no_map_tab = 1
-- vim.g.codeium_disable_bindings = 1
-- DO NOT USE C-i because it's equivalent to mapping <Tab> key for some reason
-- vim.keymap.set('i', '<A-y>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
-- vim.keymap.set('i', '<C-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
-- vim.keymap.set('i', '<c-e>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

local cmp = require('cmp')
local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b><up>'] = cmp.mapping.scroll_docs(-4),
    ['<C-b><down>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- try to disable this
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        return fallback()
      end,
      s = function(fallback)
        return fallback()
      end,
      c = function(fallback)
        return fallback()
      end,
     }),
  }),
  sources = cmp.config.sources({
    { name = 'neorg' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'nvim_lua' },
    {
        name = 'spell',
        option = {
            keep_all_entries = false,
            enable_in_context = function()
                return true
            end,
        },
    },
    { name = 'fonts', option = { space_filter = "-" } },
    { name = 'omni' },
    { name = 'buffer' },
    { name = 'async_path' },
  }),
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        -- Codeium = '[Codeium]',
        neorg = '[Neorg]',
        nvim_lsp = '[LSP]',
        vsnip = '[Snip]',
        nvim_lua = '[Lua]',
        fonts = '[Fonts]',
        spell = '[Spell]',
        buffer = '[Buffer]',
        async_path = '[Path]',
        cmdline = '[Command]',
        ['vim-dadbod-completion'] = '[DB]',
        omni = "[Omni]",
        latex_symbols = "[Latex]",
      })[entry.source.name]
      if entry.source.name == "codeium" then
        vim_item.kind = "ﮧ  Suggestion"
        vim_item.menu = "[Codeium]"
      end
      return vim_item
    end
  },
  experimental = {
    ghost_text = true,
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  -- mapping = cmp.mapping.preset.cmdline(),
  mapping = cmp.mapping.preset.insert({
    ['<Down>'] = {
      i = cmp.mapping.select_next_item(),
      c = cmp.mapping.select_next_item(),
    },
    ['<Up>'] = {
      i = cmp.mapping.select_prev_item(),
      c = cmp.mapping.select_prev_item(),
    },
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = {
      i = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ select = true }),
    },
  }),
  sources = cmp.config.sources({
    { name = 'async_path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Fix problems with vsnip in neorg
cmp.setup.filetype('norg', {
  sources = cmp.config.sources({
    { name = 'neorg' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    {
        name = 'spell',
        option = {
            keep_all_entries = false,
            enable_in_context = function()
                return true
            end,
        },
    },
    { name = "fonts", option = { space_filter = "-" } },
    { name = 'buffer' },
    { name = 'async_path' },
  }),
})
-- Fix problems with codeium in latex
cmp.setup.filetype('tex', {
  sources = cmp.config.sources({
    { name = 'neorg' },
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'nvim_lua' },
    {
        name = 'spell',
        option = {
            keep_all_entries = false,
            enable_in_context = function()
                return true
            end,
        },
    },
    { name = 'fonts', option = { space_filter = "-" } },
    { name = 'omni' },
    { name = 'buffer' },
    { name = 'async_path' },
  }),
})

-- Dadbod
vim.cmd([[
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]])

-- Set up lspconfig.

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

require('lspconfig')['lua_ls'].setup({})

local servers = {
  'lua_ls',
  "jsonls",
  "vimls",
  "csharp_ls",
  "yamlls",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

