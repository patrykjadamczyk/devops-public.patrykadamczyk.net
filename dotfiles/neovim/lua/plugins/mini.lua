return {
    -- ===== eschanovski/mini =====
    {
        "echasnovski/mini.nvim",
        version = false,
        priority = vim.g.patconfig_highest_base_priority - 280,
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("mini.ai").setup({
                custom_textobjects = {
                    B = require("mini.extra").gen_ai_spec.buffer(),
                    D = require("mini.extra").gen_ai_spec.diagnostic(),
                    I = require("mini.extra").gen_ai_spec.indent(),
                    L = require("mini.extra").gen_ai_spec.line(),
                    N = require("mini.extra").gen_ai_spec.number(),
                    a = require("mini.ai").gen_spec.argument(),
                    u = require("mini.ai").gen_spec.function_call(),
                    U = require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" }),
                    -- o = require("mini.ai").gen_spec.treesitter({
                    --     a = { "@conditional.outer", "@loop.outer" },
                    --     i = { "@conditional.inner", "@loop.inner" },
                    -- }),
                    o = require("mini.ai").gen_spec.treesitter({ -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    c = require("mini.ai").gen_spec.treesitter({
                        a = { "@class.outer" },
                        i = { "@class.inner" },
                    }),
                    d = require("mini.ai").gen_spec.treesitter({
                        a = { "@conditional.outer" },
                        i = { "@conditional.inner" },
                    }),
                    l = require("mini.ai").gen_spec.treesitter({
                        a = { "@loop.outer" },
                        i = { "@loop.inner" },
                    }),
                    m = require("mini.ai").gen_spec.treesitter({
                        a = { "@comment.outer" },
                        i = { "@comment.inner" },
                    }),
                    e = { -- Word with case
                        {
                            "%u[%l%d]+%f[^%l%d]",
                            "%f[%S][%l%d]+%f[^%l%d]",
                            "%f[%P][%l%d]+%f[^%l%d]",
                            "^[%l%d]+%f[^%l%d]",
                        },
                        "^().*()$",
                    },
                    -- Markdown code block
                    M = require("mini.ai").gen_spec.treesitter({
                        a = { "@codeblock.outer" },
                        i = { "@codeblock.inner" },
                    }),
                },
            })
            require("mini.operators").setup({
                -- Evaluate text and replace with output
                evaluate = {
                    prefix = "g=",
                },
                -- Exchange text regions
                exchange = {
                    prefix = "ge",

                    -- Whether to reindent new text to match previous indent
                    reindent_linewise = true,
                },
                -- Multiply (duplicate) text
                multiply = {
                    prefix = "gm",
                },
                -- Replace text with register
                replace = {
                    prefix = "gR",
                    -- Whether to reindent new text to match previous indent
                    reindent_linewise = true,
                },
                -- Sort text
                sort = {
                    prefix = "gs",
                },
            })
            require('mini.operators').make_mappings(
                'replace',
                { textobject = 'grs', line = 'grss', selection = 'grs' }
            )
            require("mini.bracketed").setup()
            require("mini.indentscope").setup()
            require("mini.jump").setup()
            require("mini.jump2d").setup({
                allowed_windows = {
                    current = true,
                    not_current = false,
                },
                mappings = {
                    start_jumping = "<leader><CR>",
                },
            })
            require("mini.trailspace").setup()
            require("mini.extra").setup()
            require("mini.bufremove").setup()
            require("mini.move").setup({
                mappings = {
                    -- Move visual selection in Visual mode.
                    left = "<S-left>",
                    right = "<S-right>",
                    down = "<S-down>",
                    up = "<S-up>",
                    -- Move current line in Normal mode
                    line_left = "<S-left>",
                    line_right = "<S-right>",
                    line_down = "<S-down>",
                    line_up = "<S-up>",
                },
                options = {
                    reindent_linewise = true,
                },
            })
            require("mini.sessions").setup({
                autoread = true,
                -- autowrite = true,
            })
            require("mini.surround").setup({
                -- Add custom surroundings to be used on top of builtin ones. For more
                -- information with examples, see `:h MiniSurround.config`.
                custom_surroundings = nil,

                -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
                highlight_duration = 500,

                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    -- For () use sa) instead of sa( because sa( adds space arround parenthesis
                    add = "sa", -- Add surrounding in Normal and Visual modes
                    delete = "sd", -- Delete surrounding
                    find = "sf", -- Find surrounding (to the right)
                    find_left = "sF", -- Find surrounding (to the left)
                    highlight = "sh", -- Highlight surrounding
                    replace = "sr", -- Replace surrounding
                    update_n_lines = "sn", -- Update `n_lines`

                    suffix_last = "l", -- Suffix to search with "prev" method
                    suffix_next = "n", -- Suffix to search with "next" method
                },

                -- Number of lines within which surrounding is searched
                n_lines = 20,

                -- Whether to respect selection type:
                -- - Place surroundings on separate lines in linewise mode.
                -- - Place surroundings on each line in blockwise mode.
                respect_selection_type = false,

                -- How to search for surrounding (first inside current line, then inside
                -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
                -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
                -- see `:h MiniSurround.config`.
                search_method = "cover",
            })
            -- require("mini.starter").setup() -- I use it and it's setup in different place
            -- Experiments
            -- require("mini.animate").setup() -- It slows scrolling a lot
            require("mini.cursorword").setup()
            -- require("mini.diff").setup() -- To think through because ]h works weardly
            require("mini.splitjoin").setup()
            -- Experiments - Plugin Dev
            require("mini.doc").setup()
            require("mini.test").setup()
            -- Additional functions
            require("mini.misc").setup({
                make_global = {
                    "put",
                    "put_text",
                    "resize_window",
                    "zoom",
                },
            })
            MiniMisc.setup_restore_cursor()
            require("mini.icons").setup({
                -- Icon style: 'glyph' or 'ascii'
                style = "glyph",
                -- Customize per category. See `:h MiniIcons.config` for details.
                default = {},
                directory = {},
                extension = {},
                file = {},
                filetype = {},
                lsp = {},
                os = {},
            })
            MiniIcons.mock_nvim_web_devicons()

            require("mini.files").setup({
                -- Customization of shown content
                content = {
                    -- Predicate for which file system entries to show
                    filter = nil,
                    -- What prefix to show to the left of file system entry
                    prefix = nil,
                    -- In which order to show file system entries
                    sort = nil,
                },

                -- Module mappings created only inside explorer.
                -- Use `''` (empty string) to not create one.
                mappings = {
                    close = "q",
                    go_in = "<Right>",
                    go_in_plus = "<S-Right>",
                    go_out = "<Left>",
                    go_out_plus = "<S-Left>",
                    reset = "<BS>",
                    reveal_cwd = "@",
                    show_help = "g?",
                    synchronize = "=",
                    trim_left = "<",
                    trim_right = ">",
                },

                -- General options
                options = {
                    -- Whether to delete permanently or move into module-specific trash
                    permanent_delete = true,
                    -- Whether to use for editing directories
                    use_as_default_explorer = true,
                },

                -- Customization of explorer windows
                windows = {
                    -- Maximum number of windows to show side by side
                    max_number = math.huge,
                    -- Whether to show preview of file/directory under cursor
                    preview = false,
                    -- Width of focused window
                    width_focus = 50,
                    -- Width of non-focused window
                    width_nofocus = 15,
                    -- Width of preview window
                    width_preview = 25,
                },
            })
            require("mini.pick").setup()
            -- Rest of mini.nvim with reasons why not
            -- If there is not specified reason it looked like not for me

            -- require("mini.align").setup() -- I don't think i need aligning text for now
            -- require("mini.base16").setup() -- Theme - I prefer more catpuccin or tokyonight
            -- require("mini.basics").setup() -- TODO: Add things from that into my configuration

            -- require("mini.clue").setup() -- I use which-key.nvim
            -- require("mini.colors").setup()
            -- require("mini.comment").setup() -- Comment.nvim have more options
            -- require("mini.completion").setup() -- Nvim CMP have more integrations
            -- require("mini.deps").setup() -- I use lazy.nvim
            -- require("mini.fuzzy").setup() -- This is just sorter for telescope
            -- require("mini.git").setup() -- I prefer using lazygit
            -- require("mini.hipatterns").setup() -- I prefer more todocomments.nvim
            -- require("mini.hues").setup() -- Theme - I prefer more catpuccin or tokyonight
            -- require("mini.map").setup() -- nvim-scrollbar work a bit better
            -- require("mini.notify").setup() -- Cant be used because noice doesnt support it
            -- require("mini.pairs").setup() -- I currently use nvim-autopairs
            -- require("mini.statusline").setup() -- I prefer lualine.nvim
            -- require("mini.tabline").setup() -- I prefer bufferline.nvim
            -- require("mini.visits").setup() -- Will think about this one (maybe as addition to harpoon or instead of harpoon)
        end,
    },
}
