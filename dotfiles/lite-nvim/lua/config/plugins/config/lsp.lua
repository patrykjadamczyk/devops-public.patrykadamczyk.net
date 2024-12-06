-- ========================= LSP =========================
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
require("fidget").setup({
  window = {
    blend = 0,
  },
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  lsp_capabilities
)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "jsonls",
    "vimls",
    "csharp_ls",
    "yamlls",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "cucumber_language_server",
    "diagnosticls",
    "docker_compose_language_service",
    "dockerls",
    "gopls",
    "html",
    "intelephense",
    "jedi_language_server",
    "marksman",
    "powershell_es",
    "sqlls",
    "tsserver",
  },
  automatic_installation = true,
})
lspconfig.lua_ls.setup({
  capabilities = lsp_defaults.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        -- Disable third-party library check
        checkThirdParty = false,
      },
      hint = {
        enable = true,
        arrayIndex = "Enable",
        paramName = "All",
        paramType = true,
      },
    },
  },
})
lspconfig.tsserver.setup({
  capabilities = lsp_defaults.capabilities,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
    }
  }
})
lspconfig.jsonls.setup({
  capabilities = lsp_defaults.capabilities,
  settings = {
    json = {
      validate = { enable = true },
    },
    yaml = {
      keyOrdering = false,
    },
  },
})
lspconfig.yamlls.setup({
  capabilities = lsp_defaults.capabilities,
  settings = {
    yaml = {
      keyOrdering = false,
    },
  },
})
lspconfig.gopls.setup({
  capabilities = lsp_defaults.capabilities,
  on_attach = function (client, _)
    if client.name == "gopls" then
      if not client.server_capabilities.semanticTokensProvider then
        local semantic = client.config.capabilities.textDocument.semanticTokens
        client.server_capabilities.semanticTokensProvider = {
          full = true,
          legend = {
            tokenTypes = semantic.tokenTypes,
            tokenModifiers = semantic.tokenModifiers,
          },
          range = true,
        }
      end
    end
  end,
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        ["ST1001"] = false,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = {
        "-.git",
        "-.vscode",
        "-.idea",
        "-.vscode-test",
        "-node_modules",
      },
      semanticTokens = true,
      allExperiments = true,
    },
  },
})
lspconfig.eslint.setup({
  capabilities = lsp_defaults.capabilities,
  settings = {
    workingDirectory = {
      mode = "auto",
    },
  },
})

local lsp_configs = require('lspconfig/configs')
if not lsp_configs.golangcilsp then
  lsp_configs.golangcilsp = {
    default_config = {
      cmd = {'golangci-lint-langserver'},
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
      },
    },
  }
end

lspconfig.golangci_lint_ls.setup({
  capabilities = lsp_defaults.capabilities,
  filetypes = {'go','gomod'}
})

lspconfig.fsautocomplete.setup({
  cmd = {
    "fsautocomplete",
    "--adaptive-lsp-server-enabled"
  },
  capabilities = lsp_defaults.capabilities,
})

local configured_manually = {
  "lua_ls",
  "tsserver",
  "jsonls",
  "yamlls",
  "gopls",
  "eslint",
  "golangcilsp",
  "fsautocomplete",
}
local ignored = { "perlnavigator" }
for _, server_name in ipairs(require('mason-lspconfig').get_installed_servers()) do
  -- Ignore all manually configured servers to not override their configuration and ignore specific servers because of problems
  if not vim.tbl_contains(configured_manually, server_name) and not vim.tbl_contains(ignored, server_name) then
    require('lspconfig')[server_name].setup({
      capabilities = lsp_defaults.capabilities,
    })
  end
end

require('ufo').setup({
  -- Based on astronvim
  provider_selector = function(_, filetype, buftype)
    -- if filetype == "yaml" then
    --   -- My addition: This is because code below doesn't check for foldingRange capability at all on server
    --   return {"treesitter", "indent"}
    -- end
    local function handleFallbackException(bufnr, err, providerName)
      if type(err) == "string" and err:match "UfoFallbackException" then
        return require("ufo").getFolds(bufnr, providerName)
      else
        return require("promise").reject(err)
      end
    end

    return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
      or function(bufnr)
        return require("ufo")
          .getFolds(bufnr, "lsp")
          :catch(function(err) return handleFallbackException(bufnr, err, "treesitter") end)
          :catch(function(err) return handleFallbackException(bufnr, err, "indent") end)
      end
  end,
})
