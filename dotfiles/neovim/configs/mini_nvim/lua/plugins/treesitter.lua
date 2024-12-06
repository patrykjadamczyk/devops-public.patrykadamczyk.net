return {
    -- ===== Treesitter =====
    {
        "nvim-treesitter/nvim-treesitter",
        priority = vim.g.patconfig_highest_base_priority - 180,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.install").prefer_git = false

            ----------------- WINDOWS BEING WEIRD WITH PARSERS WORKAROUND
            -- adviced from treesiiter docs (not working)
            -- require('nvim-treesitter.install').compilers = { "clang" }
            -- Tried and it worked completely
            if vim.g.patconfig_mainwindowspc == 1 then
                require("nvim-treesitter.install").compilers = { "zig" }
            end
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "bash",
                    "regex",
                    "markdown",
                    "markdown_inline",
                    "sql",
                    "go",
                    "gomod",
                    "gowork",
                    "gosum",
                    "bibtex",
                    "c",
                    "c_sharp",
                    "cmake",
                    "comment",
                    "cpp",
                    "css",
                    "csv",
                    "diff",
                    "dockerfile",
                    "doxygen",
                    "elvish",
                    "fish",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "gpg",
                    "graphql",
                    "hjson",
                    "html",
                    "htmldjango",
                    "http",
                    "ini",
                    "javascript",
                    "jq",
                    "jsdoc",
                    "json",
                    "json5",
                    "jsonc",
                    "jsonnet",
                    "just",
                    "latex",
                    "llvm",
                    "lua",
                    "luadoc",
                    "luap",
                    "luau",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "nasm",
                    "ninja",
                    "nix",
                    "nu",
                    "ocaml",
                    "ocaml_interface",
                    "ocamllex",
                    "passwd",
                    "php",
                    "phpdoc",
                    "po",
                    "pymanifest",
                    "python",
                    "query",
                    "regex",
                    "requirements",
                    "rst",
                    "rust",
                    "ron",
                    "scss",
                    "sql",
                    "ssh_config",
                    "styled",
                    "todotxt",
                    "toml",
                    "tsv",
                    "tsx",
                    "twig",
                    "typescript",
                    "typst",
                    "vhs",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                    "zig",
                },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                -- sync_install = true,
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                -- Text objects stuff
                textobjects = {
                    select = {
                        enable = false,
                        lookahead = true, -- Automatically jump forward to textobj
                        keymaps = {
                            -- -- Around argument
                            -- ['aa'] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
                            -- -- Inside argument
                            -- ['ia'] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
                            -- -- Around function
                            -- ['af'] = { query = "@function.outer", desc = "Select around a function" },
                            -- -- Inside function
                            -- ['if'] = { query = "@function.inner", desc = "Select inside a function" },
                            -- -- Around class
                            -- ['ac'] = { query = "@class.outer", desc = "Select around a class" },
                            -- -- Inside class
                            -- ['ic'] = { query = "@class.inner", desc = "Select inside a class" },
                            -- -- Around if
                            -- ['ad'] = { query = "@conditional.outer", desc = "Select around an if statement" },
                            -- -- Inside if
                            -- ['id'] = { query = "@conditional.inner", desc = "Select inside an if statement" },
                            -- -- Around Loop
                            -- ['al'] = { query = "@loop.outer", desc = "Select around a loop" },
                            -- -- Inside Loop
                            -- ['il'] = { query = "@loop.inner", desc = "Select inside a loop" },
                            -- -- Around Comment
                            -- ['at'] = { query = "@comment.outer", desc = "Select around a comment" },
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                            ["]l"] = "@loop.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]C"] = "@class.outer",
                            ["]L"] = "@loop.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@class.outer",
                            ["[l"] = "@loop.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[C"] = "@class.outer",
                            ["[L"] = "@loop.outer",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>sp"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>sP"] = "@parameter.inner",
                        },
                    },
                },
                -- Context Comment String
                -- context_commentstring = {
                --   enable = true,
                --   enable_autocmd = false,
                -- },
                -- Auto tag close
                autotag = {
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true,
                },
                -- Incremental Selection
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gni",
                        node_incremental = "gna",
                        scope_incremental = "gns",
                        node_decremental = "gnx",
                    },
                },
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                opts = {
                    enable = true,
                    enable_autocmd = false,
                },
            },
            "windwp/nvim-ts-autotag",
        },
    },
}
