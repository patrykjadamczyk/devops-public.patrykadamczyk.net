return {
    -- ===== Autocompletion Engine =====
    -- Ctrl+Y to autocomplete
    -- NeoVim Completion Engine
    {
        -- "hrsh7th/nvim-cmp",
        -- Magazine
        "iguanacucumber/magazine.nvim",
        name = "nvim-cmp", -- Otherwise highlighting gets messed up
        -- End Magazine
        priority = vim.g.patconfig_highest_base_priority - 30,
        config = function()
            local cmp = require("cmp")
            local cmp_types = require("cmp.types")
            local cmp_kinds = {
                Text = "  ",
                Method = "  ",
                Function = "  ",
                Constructor = "  ",
                Field = "  ",
                Variable = "  ",
                Class = "  ",
                Interface = "  ",
                Module = "  ",
                Property = "  ",
                Unit = "  ",
                Value = "  ",
                Enum = "  ",
                Keyword = "  ",
                Snippet = "  ",
                Color = "  ",
                File = "  ",
                Reference = "  ",
                Folder = "  ",
                EnumMember = "  ",
                Constant = "  ",
                Struct = "  ",
                Event = "  ",
                Operator = "  ",
                TypeParameter = "  ",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b><up>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-b><down>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
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
                    -- Default Overriddes
                    ['<Down>'] = {
                        i = cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Select }),
                    },
                    ['<Up>'] = {
                        i = cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Select }),
                    },
                    ['<C-n>'] = {
                        i = cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Select }),
                        -- Default
                        -- i = function()
                        --     if cmp.visible() then
                        --         cmp.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Insert })
                        --     else
                        --         cmp.complete()
                        --     end
                        -- end,
                    },
                    ['<C-p>'] = {
                        i = cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Select }),
                        -- Default
                        -- i = function()
                        --     if cmp.visible() then
                        --         cmp.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Insert })
                        --     else
                        --         cmp.complete()
                        --     end
                        -- end,
                    },
                }),
                sources = cmp.config.sources({
                    {
                        name = "codeium",
                        group_index = 1,
                        priority = 100,
                    },
                    {
                        name = "supermaven",
                        group_index = 1,
                        priority = 100,
                    },
                    {
                        name = "lazydev",
                        group_index = 0,
                    },
                    -- { name = "go_pkgs" },
                    { name = "neorg" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "snippets" },
                    { name = "dynamic" },
                    { name = "nvim_lua" },
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                        },
                    },
                    { name = "fonts", option = { space_filter = "-" } },
                    { name = "omni" },
                    { name = "buffer" },
                    { name = "async_path" },
                }),
                formatting = {
                    format = function(entry, vim_item)
                        -- Kind icons
                        vim_item.kind = string.format("%s %s", cmp_kinds[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                        -- Source
                        vim_item.menu = ({
                            -- go_pkgs = "[GoPkgs]",
                            lazydev = "[LazyDev]",
                            Codeium = "[Codeium]",
                            Supermaven = "[Supermaven]",
                            neorg = "[Neorg]",
                            nvim_lsp = "[LSP]",
                            vsnip = "[Snip]",
                            snippets = "[Snip]",
                            dynamic = "[Dyn]",
                            nvim_lua = "[Lua]",
                            fonts = "[Fonts]",
                            spell = "[Spell]",
                            buffer = "[Buffer]",
                            async_path = "[Path]",
                            cmdline = "[Command]",
                            ["vim-dadbod-completion"] = "[DB]",
                            omni = "[Omni]",
                            latex_symbols = "[Latex]",
                        })[entry.source.name]
                        if entry.source.name == "codeium" then
                            vim_item.kind = "ﮧ  Suggestion"
                            vim_item.menu = "[Codeium]"
                        end
                        if entry.source.name == "supermaven" then
                            vim_item.kind = "ﮧ  Suggestion"
                            vim_item.menu = "[Supermaven]"
                        end
                        return vim_item
                    end,
                },
                experimental = {
                    ghost_text = true,
                },
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                -- mapping = cmp.mapping.preset.cmdline(),
                mapping = cmp.mapping.preset.insert({
                    ["<Down>"] = {
                        i = cmp.mapping.select_next_item(),
                        c = cmp.mapping.select_next_item(),
                    },
                    ["<Up>"] = {
                        i = cmp.mapping.select_prev_item(),
                        c = cmp.mapping.select_prev_item(),
                    },
                    ["<C-n>"] = {
                        i = cmp.mapping.select_next_item(),
                        c = cmp.mapping.select_next_item(),
                    },
                    ["<C-p>"] = {
                        i = cmp.mapping.select_prev_item(),
                        c = cmp.mapping.select_prev_item(),
                    },
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = {
                        i = cmp.mapping.confirm({ select = true }),
                        c = cmp.mapping.confirm({ select = true }),
                    },
                }),
                sources = cmp.config.sources({
                    { name = "async_path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            -- Fix problems with vsnip in neorg
            cmp.setup.filetype({ "norg", "zig" }, {
                sources = cmp.config.sources({
                    {
                        name = "codeium",
                        group_index = 1,
                        priority = 100,
                    },
                    {
                        name = "supermaven",
                        group_index = 1,
                        priority = 100,
                    },
                    { name = "neorg" },
                    { name = "nvim_lsp" },
                    -- { name = "snippets" },
                    { name = "dynamic" },
                    { name = "nvim_lua" },
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                        },
                    },
                    { name = "fonts", option = { space_filter = "-" } },
                    { name = "omni" },
                    { name = "buffer" },
                    { name = "async_path" },
                }),
            })
            -- Fix problems with codeium in latex and minifiles
            cmp.setup.filetype({ "tex", "minifiles" }, {
                sources = cmp.config.sources({
                    { name = "neorg" },
                    { name = "nvim_lsp" },
                    { name = "snippets" },
                    { name = "dynamic" },
                    { name = "nvim_lua" },
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                        },
                    },
                    { name = "fonts", option = { space_filter = "-" } },
                    { name = "omni" },
                    { name = "buffer" },
                    { name = "async_path" },
                }),
            })

            -- Dadbod
            vim.cmd([[
            autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
            ]])

            -- Set up lspconfig.

            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- local lspconfig = require("lspconfig")
            --
            -- require("lspconfig")["lua_ls"].setup({})
            --
            -- local servers = {
            --     "lua_ls",
            --     "jsonls",
            --     "vimls",
            --     "csharp_ls",
            --     "yamlls",
            -- }
            -- for _, lsp in ipairs(servers) do
            --     lspconfig[lsp].setup({
            --         capabilities = capabilities,
            --     })
            -- end

            -- Dynamic
            local Date = require("cmp_dynamic.utils.date")

            local ft_augroup = vim.api.nvim_create_augroup("PatFTCMP", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    local filetype = vim.bo.filetype
                    local fileformat = vim.bo.fileformat
                    local eol = "\n"
                    if fileformat == "dos" then
                        eol = "\r\n"
                    elseif fileformat == "mac" then
                        eol = "\r"
                    end
                    local dynamic_items = {
                        {
                            label = "todayus",
                            insertText = function()
                                return os.date("%Y/%m/%d")
                            end,
                            resolve = true,
                        },
                        {
                            label = "today",
                            insertText = function()
                                return os.date("%d.%m.%Y")
                            end,
                            resolve = true,
                        },
                    }
                    -- if filetype == "norg" then
                    table.insert(dynamic_items, {
                        label = "neorg-journal",
                        insertText = function()
                            return table.concat({
                                "* " .. os.date("%d/%m/%Y"),
                                "** {:../../../../notes/special/journal-cheatsheet:}[Cheatsheet]",
                                "** TODO",
                                "\t- ( ) Todo Title",
                                "\t\t%TODO_ESTIMATE: 0h%",
                                "\t\t%TODO_STARTDATE: " .. os.date("%d-%m-%Y") .. "%",
                                "\t\t%TODO_ENDDATE: " .. os.date("%d-%m-%Y") .. "%",
                                "\t\t%TODO_PRIORITY: 10%",
                                "\t\t%TODO_SENTIMENT_NEUTRAL: 1%",
                                "\t\ttest description",
                                "\t\tNotes: Use C-x on sentiment to change it, Use `f lvt%d` to clean metadata in TODO metadata",
                                "\t\tEstimate - Hours, Priority - 1 - highest, Sentiment - number of spoons (mental workload points)",
                                "\t\tTime Report Format: Date From (datetime snippet) - Date to - 00:00",
                                "\t\t%TODO_TIMEREPORT: Date From - Date To - Time%",
                                "** Notes",
                                "\tTT",
                            }, eol)
                        end,
                        insertTextFormat = 2,
                        resolve = true,
                    })
                    table.insert(dynamic_items, {
                        label = "neorg-todo",
                        insertText = function()
                            return table.concat({
                                "- ( ) ${1:Todo Title}",
                                "\t%TODO_ESTIMATE: ${2:0}h%",
                                "\t\t%TODO_STARTDATE: " .. os.date("%d-%m-%Y") .. "%",
                                "\t\t%TODO_ENDDATE: " .. os.date("%d-%m-%Y") .. "%",
                                "\t%TODO_PRIORITY: ${3:10}%",
                                "\t%TODO_SENTIMENT_NEUTRAL: ${4:1}%",
                                "\t$0",
                            }, eol)
                        end,
                        insertTextFormat = 2,
                        resolve = true,
                    })
                    table.insert(dynamic_items, {
                        label = "neorg-timereport",
                        insertText = function()
                            return "\t\t%TODO_TIMEREPORT: "
                                .. os.date("%d-%m-%Y %H:%M")
                                .. " - "
                                .. os.date("%d-%m-%Y %H:%M")
                                .. " - ${1:00:00}%"
                        end,
                        insertTextFormat = 2,
                        resolve = true,
                    })
                    -- end
                    require("cmp_dynamic").register(dynamic_items)
                end,
                group = ft_augroup,
            })
            require("cmp_dynamic").register({
                {
                    label = "today",
                    insertText = function()
                        return os.date("%Y/%m/%d")
                    end,
                },
                {
                    label = "next Monday",
                    insertText = function()
                        return Date.new():add_date(7):day(1):format("%Y/%m/%d")
                    end,
                    resolve = true, -- default: false
                },
            })
        end,
        dependencies = {
            -- This needs to be setup before cmp or it fails
            "folke/neoconf.nvim",
            -- Snippets
            "rafamadriz/friendly-snippets",
            -- LSP Source for nvim-cmp
            -- "hrsh7th/cmp-nvim-lsp",
            -- Buffer Source for nvim-cmp
            -- "hrsh7th/cmp-buffer",
            -- Paths Source for nvim-cmp
            -- "FelipeLema/cmp-async-path",
            -- Lua Source for nvim-cmp
            -- "hrsh7th/cmp-nvim-lua",
            "folke/lazydev.nvim",
            -- LSP Signature Help
            "hrsh7th/cmp-nvim-lsp-signature-help",
            -- VSnip -> VSCode Snippet Syntax for Snippets in Vim
            -- "patrykjadamczyk/vim-vsnip",
            -- "hrsh7th/cmp-vsnip",
            -- Neovim Native Snippet Engine
            {
                "garymjr/nvim-snippets",
                opts = {
                    friendly_snippets = true,
                    -- search_paths = {
                    --     vim.fn.stdpath('config') .. '/snippets',
                    --     '~/.vsnip'
                    -- },
                    global_snippets = {
                        "all",
                        "global",
                    },
                    extended_filetypes = {
                        markdown = {
                            -- TODO: Find better way to do this so this just works with no setup only in math mode in md
                            "latex",
                            "katex",
                            "mathjax"
                        },
                        -- JS being JS
                        typescript = {"javascript"},
                        typescriptreact = {"javascriptreact", "typescript", "javascript"},
                        javascriptreact = {"javascript"},
                        -- Divided Tex and Latex
                        -- Tex - in files .tex
                        -- Latex - in mathmode in md (not specific to katex/mathjax)
                        tex = {"latex"},
                    },
                },
            },
            -- Spell Check for nvim-cmp
            "f3fora/cmp-spell",
            -- Cmdline Source for nvim-cmp
            -- "hrsh7th/cmp-cmdline",
            -- Fonts Source for nvim-cmp
            "amarakon/nvim-cmp-fonts",
            -- Omni Func Source for nvim-cmp
            "hrsh7th/cmp-omni",
            -- Dynamic Options
            "uga-rosa/cmp-dynamic",
            -- -- Go Packages Source for nvim-cmp
            -- "Snikimonkd/cmp-go-pkgs",
            -- Required
            "Exafunction/codeium.nvim",
            "epwalsh/obsidian.nvim",
            "nvim-neorg/neorg",
            -- Magazine
            {
                "iguanacucumber/mag-nvim-lsp",
                name = "cmp-nvim-lsp",
                opts = {}
            },
            {
                "iguanacucumber/mag-nvim-lua",
                name = "cmp-nvim-lua"
            },
            {
                "iguanacucumber/mag-buffer",
                name = "cmp-buffer"
            },
            {
                "iguanacucumber/mag-cmdline",
                name = "cmp-cmdline"
            },
            {
                "https://codeberg.org/FelipeLema/cmp-async-path"
            },
            -- End Magazine
        },
    },
}
