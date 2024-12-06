-- ========================= LSP =========================
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
lsp_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    lsp_defaults.capabilities
)

require("mason").setup({
    registries = {
        -- Default registry
        "github:mason-org/mason-registry",
        -- Registry for roslyn LSP server
        "github:Crashdummyy/mason-registry",
    },
})
require('mason-lspconfig').setup_handlers({
    ['rust_analyzer'] = function() end,
})
require("mason-bridge").setup({})
require("conform").setup({
    format_on_save = function(bufnr)
        -- Enable with a global or buffer-local variable
        if vim.g.enable_autoformat == true or vim.b[bufnr].enable_autoformat == true then
            return { timeout_ms = 500, lsp_fallback = true }
        end
    end,
    formatters_by_ft = require("mason-bridge").get_formatters(),
    formatters = {
        csharpier = {
            command = "dotnet-csharpier",
            args = { "--write-stdout" },
        },
    },
})
require("lint").linters_by_ft = require("mason-bridge").get_linters()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "jsonls",
        "vimls",
        -- "omnisharp",
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
        "ts_ls",
        -- "codelldb",
        -- "rust-analyzer",
    },
    -- automatic_installation = true,
    automatic_installation = {
        exclude = {
            "rust_analyzer",
        }
    },
})
-- lspconfig.lua_ls.before_init = require("neodev.lsp").before_init
lspconfig.lua_ls.setup({
    capabilities = lsp_defaults.capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                },
            },
            workspace = {
                -- disable due to excesive loading of stuff (for now)
                -- library = vim.api.nvim_get_runtime_file("", true),
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
lspconfig.ts_ls.setup({
    capabilities = lsp_defaults.capabilities,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
})
lspconfig.jsonls.setup({
    capabilities = lsp_defaults.capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
        yaml = {
            schemas = require("schemastore").yaml.schemas(),
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
    on_attach = function(client, _)
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
-- lspconfig.tinymist.setup({
--     capabilities = lsp_defaults.capabilities,
--     settings = {
--         exportPdf = "onType",
--         outputPath = "$root/target/$dir/$name",
--     },
-- })

local lsp_configs = require("lspconfig.configs")
if not lsp_configs.golangcilsp then
    lsp_configs.golangcilsp = {
        default_config = {
            cmd = { "golangci-lint-langserver" },
            root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
            init_options = {
                command = {
                    "golangci-lint",
                    "run",
                    "--enable-all",
                    "--disable",
                    "lll",
                    "--out-format",
                    "json",
                    "--issues-exit-code=1",
                },
            },
        },
    }
end
if not lsp_configs.gleamlsp then
    lsp_configs.gleamlsp = {
        default_config = {
            cmd = { "gleam", "lsp" },
            root_dir = lspconfig.util.root_pattern("gleam.toml"),
        },
    }
end
if not lsp_configs.nulsp then
    lsp_configs.nulsp = {
        default_config = {
            cmd = { "nu", "--lsp" },
            filetypes = { "nu" },
            root_dir = lspconfig.util.find_git_ancestor,
            single_file_support = true,
        },
    }
end

lspconfig.nulsp.setup({
    capabilities = lsp_defaults.capabilities,
    filetypes = { "nu" },
})

lspconfig.gleamlsp.setup({
    capabilities = lsp_defaults.capabilities,
    filetypes = { "gleam" },
})

lspconfig.golangci_lint_ls.setup({
    capabilities = lsp_defaults.capabilities,
    filetypes = { "go", "gomod" },
})

lspconfig.fsautocomplete.setup({
    cmd = {
        "fsautocomplete",
        "--adaptive-lsp-server-enabled",
    },
    capabilities = lsp_defaults.capabilities,
})

if (vim.g.patconfig_csharp_server__omnisharp == 1) then
    lspconfig.omnisharp.setup({
        handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
            ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
            ["textDocument/references"] = require("omnisharp_extended").references_handler,
            ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
        },
        capabilities = lsp_defaults.capabilities,
        settings = {
        FormattingOptions = {
            -- Enables support for reading code style, naming convention and analyzer
            -- settings from .editorconfig.
            EnableEditorConfigSupport = true,
            -- Specifies whether 'using' directives should be grouped and sorted during
            -- document formatting.
            OrganizeImports = nil,
        },
        MsBuild = {
            -- If true, MSBuild project system will only load projects for files that
            -- were opened in the editor. This setting is useful for big C# codebases
            -- and allows for faster initialization of code navigation features only
            -- for projects that are relevant to code that is being edited. With this
            -- setting enabled OmniSharp may load fewer projects and may thus display
            -- incomplete reference lists for symbols.
            -- LoadProjectsOnDemand = nil,
            LoadProjectsOnDemand = true,
        },
        RoslynExtensionsOptions = {
            -- Enables support for roslyn analyzers, code fixes and rulesets.
            -- EnableAnalyzersSupport = nil,
            EnableAnalyzersSupport = true,
            -- Enables support for showing unimported types and unimported extension
            -- methods in completion lists. When committed, the appropriate using
            -- directive will be added at the top of the current file. This option can
            -- have a negative impact on initial completion responsiveness,
            -- particularly for the first few completion sessions after opening a
            -- solution.
            -- EnableImportCompletion = nil,
            EnableImportCompletion = true,
            -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            -- true
            AnalyzeOpenDocumentsOnly = nil,
        },
        Sdk = {
            -- Specifies whether to include preview versions of the .NET SDK when
            -- determining which version to use for project loading.
            IncludePrereleases = true,
        },
        },
    })
end

if (vim.g.patconfig_csharp_server__omnisharp_mono == 1) then
    lspconfig.omnisharp_mono.setup({
        handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
            ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
            ["textDocument/references"] = require("omnisharp_extended").references_handler,
            ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
        },
        capabilities = lsp_defaults.capabilities,
    })
end

if (vim.g.patconfig_csharp_server__csharp_ls == 1) then
    lspconfig.csharp_ls.setup({
        handlers = {
            ["textDocument/definition"] = require('csharpls_extended').handler,
            ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
        },
        capabilities = lsp_defaults.capabilities,
    })
end

local configured_manually = {
    "lua_ls",
    "ts_ls",
    "jsonls",
    "yamlls",
    "gopls",
    "eslint",
    "golangcilsp",
    "fsautocomplete",
    "omnisharp",
    "omnisharp_mono",
    "csharp_ls",
}
local ignored = {
    "perlnavigator",
    "rust_analyzer",
}

for _, server_name in ipairs(require("mason-lspconfig").get_installed_servers()) do
    -- Ignore all manually configured servers to not override their configuration and ignore specific servers because of problems
    if not vim.tbl_contains(configured_manually, server_name) and not vim.tbl_contains(ignored, server_name) then
        require("lspconfig")[server_name].setup({
            capabilities = lsp_defaults.capabilities,
        })
    end
end

require("ufo").setup({
    -- Based on astronvim
    provider_selector = function(_, filetype, buftype)
        -- if filetype == "yaml" then
        --   -- My addition: This is because code below doesn't check for foldingRange capability at all on server
        --   return {"treesitter", "indent"}
        -- end
        local function handleFallbackException(bufnr, err, providerName)
            if type(err) == "string" and err:match("UfoFallbackException") then
                return require("ufo").getFolds(bufnr, providerName)
            else
                return require("promise").reject(err)
            end
        end

        return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
            or function(bufnr)
                return require("ufo")
                    .getFolds(bufnr, "lsp")
                    :catch(function(err)
                        return handleFallbackException(bufnr, err, "treesitter")
                    end)
                    :catch(function(err)
                        return handleFallbackException(bufnr, err, "indent")
                    end)
            end
    end,
})
vim.keymap.set({ "n", "v" }, "<leader>lF", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end, { desc = "Format file or range (in visual mode)" })
