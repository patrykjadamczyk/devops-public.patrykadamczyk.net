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
            -- Rest of mini.nvim with reasons why not
            -- If there is not specified reason it looked like not for me
            require("mini.diff").setup() -- To think through because ]h works weardly

            require("mini.align").setup() -- I don't think i need aligning text for now
            -- require("mini.basics").setup() -- TODO: Add things from that into my configuration

            local miniclue = require('mini.clue')
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = 'n', keys = '<Leader>' },
                    { mode = 'x', keys = '<Leader>' },

                    -- Next / Prev triggers
                    { mode = 'n', keys = '[' },
                    { mode = 'n', keys = ']' },

                    -- Built-in completion
                    { mode = 'i', keys = '<C-x>' },

                    -- `g` key
                    { mode = 'n', keys = 'g' },
                    { mode = 'x', keys = 'g' },

                    -- Marks
                    { mode = 'n', keys = "'" },
                    { mode = 'n', keys = '`' },
                    { mode = 'x', keys = "'" },
                    { mode = 'x', keys = '`' },

                    -- Registers
                    { mode = 'n', keys = '"' },
                    { mode = 'x', keys = '"' },
                    { mode = 'i', keys = '<C-r>' },
                    { mode = 'c', keys = '<C-r>' },

                    -- Window commands
                    { mode = 'n', keys = '<C-w>' },

                    -- `z` key
                    { mode = 'n', keys = 'z' },
                    { mode = 'x', keys = 'z' },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                    { mode = 'n', keys = "!", desc = "Filter through external program" },
                    { mode = 'n', keys = "<", desc = "Indent left" },
                    { mode = 'n', keys = ">", desc = "Indent right" },
                    { mode = 'n', keys = "V", desc = "Visual Line Mode" },
                    { mode = 'n', keys = "c", desc = "Change" },
                    { mode = 'n', keys = "d", desc = "Delete" },
                    { mode = 'n', keys = "gU", desc = "Uppercase" },
                    { mode = 'n', keys = "gu", desc = "Lowercase" },
                    { mode = 'n', keys = "g~", desc = "Toggle case" },
                    { mode = 'n', keys = "r", desc = "Replace" },
                    { mode = 'n', keys = "v", desc = "Visual Character Mode" },
                    { mode = 'n', keys = "y", desc = "Yank (copy)" },
                    { mode = 'n', keys = "zf", desc = "Create fold" },
                    { mode = 'n', keys = "~", desc = "Toggle case" },
                    { mode = 'x', keys = "!", desc = "Filter through external program" },
                    { mode = 'x', keys = "<", desc = "Indent left" },
                    { mode = 'x', keys = ">", desc = "Indent right" },
                    { mode = 'x', keys = "V", desc = "Visual Line Mode" },
                    { mode = 'x', keys = "c", desc = "Change" },
                    { mode = 'x', keys = "d", desc = "Delete" },
                    { mode = 'x', keys = "gU", desc = "Uppercase" },
                    { mode = 'x', keys = "gu", desc = "Lowercase" },
                    { mode = 'x', keys = "g~", desc = "Toggle case" },
                    { mode = 'x', keys = "r", desc = "Replace" },
                    { mode = 'x', keys = "v", desc = "Visual Character Mode" },
                    { mode = 'x', keys = "y", desc = "Yank (copy)" },
                    { mode = 'x', keys = "zf", desc = "Create fold" },
                    { mode = 'x', keys = "~", desc = "Toggle case" },
                    { mode = "x", keys = "$", desc = "End of line" },
                    { mode = "x", keys = "%", desc = "Matching character: '()', '{}', '[]'" },
                    { mode = "x", keys = "0", desc = "Start of line" },
                    { mode = "x", keys = "F", desc = "Move to previous char" },
                    { mode = "x", keys = "G", desc = "Last line" },
                    { mode = "x", keys = "T", desc = "Move before previous char" },
                    { mode = "x", keys = "^", desc = "Start of line (non-blank)" },
                    { mode = "x", keys = "b", desc = "Previous word" },
                    { mode = "x", keys = "e", desc = "Next end of word" },
                    { mode = "x", keys = "f", desc = "Move to next char" },
                    { mode = "x", keys = "ge", desc = "Previous end of word" },
                    { mode = "x", keys = "gg", desc = "First line" },
                    { mode = "x", keys = "h", desc = "Left" },
                    { mode = "x", keys = "j", desc = "Down" },
                    { mode = "x", keys = "k", desc = "Up" },
                    { mode = "x", keys = "l", desc = "Right" },
                    { mode = "x", keys = "t", desc = "Move before next char" },
                    { mode = "x", keys = "w", desc = "Next word" },
                    { mode = "x", keys = "{", desc = "Previous empty line" },
                    { mode = "x", keys = "}", desc = "Next empty line" },
                    { mode = "o", keys = "$", desc = "End of line" },
                    { mode = "o", keys = "%", desc = "Matching character: '()', '{}', '[]'" },
                    { mode = "o", keys = "0", desc = "Start of line" },
                    { mode = "o", keys = "F", desc = "Move to previous char" },
                    { mode = "o", keys = "G", desc = "Last line" },
                    { mode = "o", keys = "T", desc = "Move before previous char" },
                    { mode = "o", keys = "^", desc = "Start of line (non-blank)" },
                    { mode = "o", keys = "b", desc = "Previous word" },
                    { mode = "o", keys = "e", desc = "Next end of word" },
                    { mode = "o", keys = "f", desc = "Move to next char" },
                    { mode = "o", keys = "ge", desc = "Previous end of word" },
                    { mode = "o", keys = "gg", desc = "First line" },
                    { mode = "o", keys = "h", desc = "Left" },
                    { mode = "o", keys = "j", desc = "Down" },
                    { mode = "o", keys = "k", desc = "Up" },
                    { mode = "o", keys = "l", desc = "Right" },
                    { mode = "o", keys = "t", desc = "Move before next char" },
                    { mode = "o", keys = "w", desc = "Next word" },
                    { mode = "o", keys = "{", desc = "Previous empty line" },
                    { mode = "o", keys = "}", desc = "Next empty line" },
                    { mode = "x", keys = "a", desc = "+around" },
                    { mode = "x", keys = 'a"', desc = "double quoted string" },
                    { mode = "x", keys = "a'", desc = "single quoted string" },
                    { mode = "x", keys = "a(", desc = "same as ab" },
                    { mode = "x", keys = "a)", desc = "same as ab" },
                    { mode = "x", keys = "a<", desc = "a <> from '<' to the matching '>'" },
                    { mode = "x", keys = "a>", desc = "same as a<" },
                    { mode = "x", keys = "aB", desc = "a Block from [{ to ]} (with brackets)" },
                    { mode = "x", keys = "aW", desc = "a WORD (with white space)" },
                    { mode = "x", keys = "a[", desc = "a [] from '[' to the matching ']'" },
                    { mode = "x", keys = "a]", desc = "same as a[" },
                    { mode = "x", keys = "a`", desc = "string in backticks" },
                    { mode = "x", keys = "ab", desc = "a block from [( to ]) (with braces)" },
                    { mode = "x", keys = "ap", desc = "a paragraph (with white space) " },
                    { mode = "x", keys = "as", desc = "a sentence (with white space)" },
                    { mode = "x", keys = "at", desc = "a tag block (with white space)" },
                    { mode = "x", keys = "aw", desc = "a word (with white space)" },
                    { mode = "x", keys = "a{", desc = "same as aB" },
                    { mode = "x", keys = "a}", desc = "same as aB" },
                    { mode = "x", keys = "i", desc = "+inside" },
                    { mode = "x", keys = 'i"', desc = "double quoted string without the quotes" },
                    { mode = "x", keys = "i'", desc = "single quoted string without the quotes" },
                    { mode = "x", keys = "i(", desc = "same as ib" },
                    { mode = "x", keys = "i)", desc = "same as ib" },
                    { mode = "x", keys = "i<", desc = "inner <> from '<' to the matching '>'" },
                    { mode = "x", keys = "i>", desc = "same as i<" },
                    { mode = "x", keys = "iB", desc = "inner Block from [{ and ]}" },
                    { mode = "x", keys = "iW", desc = "inner WORD" },
                    { mode = "x", keys = "i[", desc = "inner [] from '[' to the matching ']'" },
                    { mode = "x", keys = "i]", desc = "same as i[" },
                    { mode = "x", keys = "i`", desc = "string in backticks without the backticks" },
                    { mode = "x", keys = "ib", desc = "inner block from [( to ])" },
                    { mode = "x", keys = "ip", desc = "inner paragraph" },
                    { mode = "x", keys = "is", desc = "inner sentence" },
                    { mode = "x", keys = "it", desc = "inner tag block" },
                    { mode = "x", keys = "iw", desc = "inner word" },
                    { mode = "x", keys = "i{", desc = "same as iB" },
                    { mode = "x", keys = "i}", desc = "same as iB" },
                    { mode = "o", keys = "a", desc = "+around" },
                    { mode = "o", keys = 'a"', desc = "double quoted string" },
                    { mode = "o", keys = "a'", desc = "single quoted string" },
                    { mode = "o", keys = "a(", desc = "same as ab" },
                    { mode = "o", keys = "a)", desc = "same as ab" },
                    { mode = "o", keys = "a<", desc = "a <> from '<' to the matching '>'" },
                    { mode = "o", keys = "a>", desc = "same as a<" },
                    { mode = "o", keys = "aB", desc = "a Block from [{ to ]} (with brackets)" },
                    { mode = "o", keys = "aW", desc = "a WORD (with white space)" },
                    { mode = "o", keys = "a[", desc = "a [] from '[' to the matching ']'" },
                    { mode = "o", keys = "a]", desc = "same as a[" },
                    { mode = "o", keys = "a`", desc = "string in backticks" },
                    { mode = "o", keys = "ab", desc = "a block from [( to ]) (with braces)" },
                    { mode = "o", keys = "ap", desc = "a paragraph (with white space) " },
                    { mode = "o", keys = "as", desc = "a sentence (with white space)" },
                    { mode = "o", keys = "at", desc = "a tag block (with white space)" },
                    { mode = "o", keys = "aw", desc = "a word (with white space)" },
                    { mode = "o", keys = "a{", desc = "same as aB" },
                    { mode = "o", keys = "a}", desc = "same as aB" },
                    { mode = "o", keys = "i", desc = "+inside" },
                    { mode = "o", keys = 'i"', desc = "double quoted string without the quotes" },
                    { mode = "o", keys = "i'", desc = "single quoted string without the quotes" },
                    { mode = "o", keys = "i(", desc = "same as ib" },
                    { mode = "o", keys = "i)", desc = "same as ib" },
                    { mode = "o", keys = "i<", desc = "inner <> from '<' to the matching '>'" },
                    { mode = "o", keys = "i>", desc = "same as i<" },
                    { mode = "o", keys = "iB", desc = "inner Block from [{ and ]}" },
                    { mode = "o", keys = "iW", desc = "inner WORD" },
                    { mode = "o", keys = "i[", desc = "inner [] from '[' to the matching ']'" },
                    { mode = "o", keys = "i]", desc = "same as i[" },
                    { mode = "o", keys = "i`", desc = "string in backticks without the backticks" },
                    { mode = "o", keys = "ib", desc = "inner block from [( to ])" },
                    { mode = "o", keys = "ip", desc = "inner paragraph" },
                    { mode = "o", keys = "is", desc = "inner sentence" },
                    { mode = "o", keys = "it", desc = "inner tag block" },
                    { mode = "o", keys = "iw", desc = "inner word" },
                    { mode = "o", keys = "i{", desc = "same as iB" },
                    { mode = "o", keys = "i}", desc = "same as iB" },
                    { mode = "o", keys = "a(", desc = "a block from [( to ]) (with braces)" },
                    { mode = "o", keys = "a)", desc = "a block from [( to ]) (with braces)" },
                    { mode = "o", keys = "a>", desc = "a <> from '<' to the matching '>'" },
                    { mode = "o", keys = "a]", desc = "a [] from '[' to the matching ']'" },
                    { mode = "o", keys = "a}", desc = "a Block from [{ to ]} (with brackets)" },
                    { mode = "o", keys = "a{", desc = "a Block from [{ to ]} (with brackets)" },
                    { mode = "o", keys = "i(", desc = "inner block from [( to ])" },
                    { mode = "o", keys = "i)", desc = "inner block from [( to ])" },
                    { mode = "o", keys = "i>", desc = "inner <> from '<' to the matching '>'" },
                    { mode = "o", keys = "i]", desc = "inner [] from '[' to the matching ']'" },
                    { mode = "o", keys = "i}", desc = "inner Block from [{ and ]}" },
                    { mode = "o", keys = "i{", desc = "inner Block from [{ and ]}" },
                    { mode = "o", keys = "aB", desc = "Whole Buffer" },
                    { mode = "o", keys = "iB", desc = "Whole Buffer with trimmed empty lines" },
                    { mode = "o", keys = "aD", desc = "Diagnostic" },
                    { mode = "o", keys = "iD", desc = "Diagnostic" },
                    { mode = "o", keys = "aI", desc = "Around Indent scope" },
                    { mode = "o", keys = "iI", desc = "Inside Indent scope" },
                    { mode = "o", keys = "aL", desc = "Whole Line" },
                    { mode = "o", keys = "iL", desc = "Line after initial indent" },
                    { mode = "o", keys = "aN", desc = "Whole Number (-21.56)" },
                    { mode = "o", keys = "iN", desc = "Just Number (21)" },
                    { mode = "o", keys = "ao", desc = "Around Code Block" },
                    { mode = "o", keys = "io", desc = "Inside Code Block" },
                    { mode = "o", keys = "ac", desc = "Around Class" },
                    { mode = "o", keys = "ic", desc = "Inside Class" },
                    { mode = "o", keys = "ad", desc = "Around Conditional" },
                    { mode = "o", keys = "id", desc = "Inside Conditional" },
                    { mode = "o", keys = "al", desc = "Around Loop" },
                    { mode = "o", keys = "il", desc = "Inside Loop" },
                    { mode = "o", keys = "am", desc = "Around Comment" },
                    { mode = "o", keys = "im", desc = "Inside Comment" },
                    { mode = "o", keys = "ae", desc = "Word using case ([hello]world)" },
                    { mode = "o", keys = "ie", desc = "Word using case ([hello]world)" },
                    { mode = "o", keys = "aa", desc = "Around Argument" },
                    { mode = "o", keys = "ia", desc = "Inside Argument" },
                    { mode = "o", keys = "au", desc = "Around Function Call" },
                    { mode = "o", keys = "iu", desc = "Inside Function Call" },
                    { mode = "o", keys = "aU", desc = "Around Function Call (name without dot)" },
                    { mode = "o", keys = "iU", desc = "Inside Function Call (name without dot)" },
                    { mode = "x", keys = "a(", desc = "a block from [( to ]) (with braces)" },
                    { mode = "x", keys = "a)", desc = "a block from [( to ]) (with braces)" },
                    { mode = "x", keys = "a>", desc = "a <> from '<' to the matching '>'" },
                    { mode = "x", keys = "a]", desc = "a [] from '[' to the matching ']'" },
                    { mode = "x", keys = "a}", desc = "a Block from [{ to ]} (with brackets)" },
                    { mode = "x", keys = "a{", desc = "a Block from [{ to ]} (with brackets)" },
                    { mode = "x", keys = "i(", desc = "inner block from [( to ])" },
                    { mode = "x", keys = "i)", desc = "inner block from [( to ])" },
                    { mode = "x", keys = "i>", desc = "inner <> from '<' to the matching '>'" },
                    { mode = "x", keys = "i]", desc = "inner [] from '[' to the matching ']'" },
                    { mode = "x", keys = "i}", desc = "inner Block from [{ and ]}" },
                    { mode = "x", keys = "i{", desc = "inner Block from [{ and ]}" },
                    { mode = "x", keys = "aB", desc = "Whole Buffer" },
                    { mode = "x", keys = "iB", desc = "Whole Buffer with trimmed empty lines" },
                    { mode = "x", keys = "aD", desc = "Diagnostic" },
                    { mode = "x", keys = "iD", desc = "Diagnostic" },
                    { mode = "x", keys = "aI", desc = "Around Indent scope" },
                    { mode = "x", keys = "iI", desc = "Inside Indent scope" },
                    { mode = "x", keys = "aL", desc = "Whole Line" },
                    { mode = "x", keys = "iL", desc = "Line after initial indent" },
                    { mode = "x", keys = "aN", desc = "Whole Number (-21.56)" },
                    { mode = "x", keys = "iN", desc = "Just Number (21)" },
                    { mode = "x", keys = "ao", desc = "Around Code Block" },
                    { mode = "x", keys = "io", desc = "Inside Code Block" },
                    { mode = "x", keys = "ac", desc = "Around Class" },
                    { mode = "x", keys = "ic", desc = "Inside Class" },
                    { mode = "x", keys = "ad", desc = "Around Conditional" },
                    { mode = "x", keys = "id", desc = "Inside Conditional" },
                    { mode = "x", keys = "al", desc = "Around Loop" },
                    { mode = "x", keys = "il", desc = "Inside Loop" },
                    { mode = "x", keys = "am", desc = "Around Comment" },
                    { mode = "x", keys = "im", desc = "Inside Comment" },
                    { mode = "x", keys = "ae", desc = "Word using case ([hello]world)" },
                    { mode = "x", keys = "ie", desc = "Word using case ([hello]world)" },
                    { mode = "x", keys = "aa", desc = "Around Argument" },
                    { mode = "x", keys = "ia", desc = "Inside Argument" },
                    { mode = "x", keys = "au", desc = "Around Function Call" },
                    { mode = "x", keys = "iu", desc = "Inside Function Call" },
                    { mode = "x", keys = "aU", desc = "Around Function Call (name without dot)" },
                    { mode = "x", keys = "iU", desc = "Inside Function Call (name without dot)" },
                    { mode = "n", keys = "<c-w>", desc = "+window" },
                    { mode = "n", keys = "<c-w>+", desc = "Increase height" },
                    { mode = "n", keys = "<c-w>-", desc = "Decrease height" },
                    { mode = "n", keys = "<c-w><", desc = "Decrease width" },
                    { mode = "n", keys = "<c-w>=", desc = "Equally high and wide" },
                    { mode = "n", keys = "<c-w>>", desc = "Increase width" },
                    { mode = "n", keys = "<c-w>T", desc = "Break out into a new tab" },
                    { mode = "n", keys = "<c-w>_", desc = "Max out the height" },
                    { mode = "n", keys = "<c-w>h", desc = "Go to the left window" },
                    { mode = "n", keys = "<c-w>j", desc = "Go to the down window" },
                    { mode = "n", keys = "<c-w>k", desc = "Go to the up window" },
                    { mode = "n", keys = "<c-w>l", desc = "Go to the right window" },
                    { mode = "n", keys = "<c-w>o", desc = "Close all other windows" },
                    { mode = "n", keys = "<c-w>q", desc = "Quit a window" },
                    { mode = "n", keys = "<c-w>s", desc = "Split window" },
                    { mode = "n", keys = "<c-w>v", desc = "Split window vertically" },
                    { mode = "n", keys = "<c-w>w", desc = "Switch windows" },
                    { mode = "n", keys = "<c-w>x", desc = "Swap current with next" },
                    { mode = "n", keys = "<c-w>|", desc = "Max out the width" },
                    { mode = "x", keys = "<c-w>", desc = "+window" },
                    { mode = "x", keys = "<c-w>+", desc = "Increase height" },
                    { mode = "x", keys = "<c-w>-", desc = "Decrease height" },
                    { mode = "x", keys = "<c-w><", desc = "Decrease width" },
                    { mode = "x", keys = "<c-w>=", desc = "Equally high and wide" },
                    { mode = "x", keys = "<c-w>>", desc = "Increase width" },
                    { mode = "x", keys = "<c-w>T", desc = "Break out into a new tab" },
                    { mode = "x", keys = "<c-w>_", desc = "Max out the height" },
                    { mode = "x", keys = "<c-w>h", desc = "Go to the left window" },
                    { mode = "x", keys = "<c-w>j", desc = "Go to the down window" },
                    { mode = "x", keys = "<c-w>k", desc = "Go to the up window" },
                    { mode = "x", keys = "<c-w>l", desc = "Go to the right window" },
                    { mode = "x", keys = "<c-w>o", desc = "Close all other windows" },
                    { mode = "x", keys = "<c-w>q", desc = "Quit a window" },
                    { mode = "x", keys = "<c-w>s", desc = "Split window" },
                    { mode = "x", keys = "<c-w>v", desc = "Split window vertically" },
                    { mode = "x", keys = "<c-w>w", desc = "Switch windows" },
                    { mode = "x", keys = "<c-w>x", desc = "Swap current with next" },
                    { mode = "x", keys = "<c-w>|", desc = "Max out the width" },
                    { mode = "n", keys = "z<CR>", desc = "Top this line, 1st non-blank col" },
                    { mode = "n", keys = "z=", desc = "Spelling suggestions" },
                    { mode = "n", keys = "zA", desc = "Toggle all folds under cursor" },
                    { mode = "n", keys = "zC", desc = "Close all folds under cursor" },
                    { mode = "n", keys = "zD", desc = "Delete all folds under cursor" },
                    { mode = "n", keys = "zE", desc = "Delete all folds in file" },
                    { mode = "n", keys = "zH", desc = "Half screen to the left" },
                    { mode = "n", keys = "zL", desc = "Half screen to the right" },
                    { mode = "n", keys = "zM", desc = "Close all folds" },
                    { mode = "n", keys = "zO", desc = "Open all folds under cursor" },
                    { mode = "n", keys = "zR", desc = "Open all folds" },
                    { mode = "n", keys = "za", desc = "Toggle fold under cursor" },
                    { mode = "n", keys = "zb", desc = "Bottom this line" },
                    { mode = "n", keys = "zc", desc = "Close fold under cursor" },
                    { mode = "n", keys = "zd", desc = "Delete fold under cursor" },
                    { mode = "n", keys = "ze", desc = "Right this line" },
                    { mode = "n", keys = "zg", desc = "Add word to spell list" },
                    { mode = "n", keys = "zi", desc = "Toggle folding" },
                    { mode = "n", keys = "zm", desc = "Fold more" },
                    { mode = "n", keys = "zo", desc = "Open fold under cursor" },
                    { mode = "n", keys = "zr", desc = "Fold less" },
                    { mode = "n", keys = "zs", desc = "Left this line" },
                    { mode = "n", keys = "zt", desc = "Top this line" },
                    { mode = "n", keys = "zv", desc = "Show cursor line" },
                    { mode = "n", keys = "zw", desc = "Mark word as bad/misspelling" },
                    { mode = "n", keys = "zx", desc = "Update folds" },
                    { mode = "n", keys = "zz", desc = "Center this line" },
                    { mode = "n", keys = "H", desc = "Home line of window (top)" },
                    { mode = "n", keys = "L", desc = "Last line of window" },
                    { mode = "n", keys = "M", desc = "Middle line of window" },
                    { mode = "n", keys = "[%", desc = "Previous unmatched group" },
                    { mode = "n", keys = "[(", desc = "Previous (" },
                    { mode = "n", keys = "[<", desc = "Previous <" },
                    { mode = "n", keys = "[M", desc = "Previous method end" },
                    { mode = "n", keys = "[m", desc = "Previous method start" },
                    { mode = "n", keys = "[s", desc = "Previous misspelled word" },
                    { mode = "n", keys = "[{", desc = "Previous {" },
                    { mode = "n", keys = "]%", desc = "Next unmatched group" },
                    { mode = "n", keys = "](", desc = "Next (" },
                    { mode = "n", keys = "]<", desc = "Next <" },
                    { mode = "n", keys = "]M", desc = "Next method end" },
                    { mode = "n", keys = "]m", desc = "Next method start" },
                    { mode = "n", keys = "]s", desc = "Next misspelled word" },
                    { mode = "n", keys = "]{", desc = "Next {" },
                    { mode = "n", keys = "g%", desc = "Cycle backwards through results" },
                    { mode = "n", keys = "gN", desc = "Search backwards and select" },
                    { mode = "n", keys = "gT", desc = "Go to previous tab page" },
                    { mode = "n", keys = "gf", desc = "Go to file under cursor" },
                    { mode = "n", keys = "gi", desc = "Move to the last insertion and INSERT" },
                    { mode = "n", keys = "gn", desc = "Search forwards and select" },
                    { mode = "n", keys = "gt", desc = "Go to next tab page" },
                    { mode = "n", keys = "gv", desc = "Switch to VISUAL using last selection" },
                    { mode = "n", keys = "gx", desc = "Open the file under cursor with system app" },
                    { mode = "n", keys = "<C-d>", desc = "+Multicursor" },
                    { mode = "n", keys = "<leader>", desc = "+<leader>" },
                    { mode = "n", keys = "<leader><leader>", desc = "+<leader>" },
                    { mode = "n", keys = "<leader><tab>", desc = "+Tabs" },
                    { mode = "n", keys = "<leader>L", desc = "+Lazy" },
                    { mode = "n", keys = "<leader>b", desc = "+Buffer" },
                    { mode = "n", keys = "<leader>c", desc = "+Code" },
                    { mode = "n", keys = "<leader>d", desc = "+Debug/Dismiss/Delete" },
                    { mode = "n", keys = "<leader>f", desc = "+Find/Fix" },
                    { mode = "n", keys = "<leader>fC", desc = "+Find in Neovim Config" },
                    { mode = "n", keys = "<leader>fg", desc = "+Find in Projects" },
                    { mode = "n", keys = "<leader>g", desc = "+Go To" },
                    { mode = "n", keys = "<leader>h", desc = "+Harpoon" },
                    { mode = "n", keys = "<leader>hj", desc = "+Harpoon jump to mark" },
                    { mode = "n", keys = "<leader>i", desc = "+Insert" },
                    { mode = "n", keys = "<leader>l", desc = "+LSP" },
                    { mode = "n", keys = "<leader>ld", desc = "+LSP Document" },
                    { mode = "n", keys = "<leader>li", desc = "+LSP Incoming" },
                    { mode = "n", keys = "<leader>lo", desc = "+LSP Outgoing" },
                    { mode = "n", keys = "<leader>lt", desc = "+LSP Type" },
                    { mode = "n", keys = "<leader>lw", desc = "+LSP Workspace" },
                    { mode = "n", keys = "<leader>n", desc = "+Neorg/Notifications" },
                    { mode = "n", keys = "<leader>o", desc = "+Open" },
                    { mode = "n", keys = "<leader>p", desc = "+Peek" },
                    { mode = "n", keys = "<leader>q", desc = "+Quickfix list" },
                    { mode = "n", keys = "<leader>r", desc = "+Refactor" },
                    { mode = "n", keys = "<leader>s", desc = "+Scratch/Search/Swap/Sort" },
                    { mode = "n", keys = "<leader>t", desc = "+Toggle" },
                    { mode = "n", keys = "<leader>tt", desc = "+Toggle Trouble/Transparent" },
                    { mode = "n", keys = "<leader>u", desc = "+Undo" },
                    { mode = "n", keys = "<leader>v", desc = "+Visual" },
                    { mode = "n", keys = "<leader>w", desc = "+Wezterm/Window" },
                    { mode = "n", keys = "[", desc = "+Go to previous" },
                    { mode = "n", keys = "]", desc = "+Go to next" },
                    { mode = "n", keys = "g", desc = "+Go to" },
                    { mode = "n", keys = "g?", desc = "+Debug Print" },
                    { mode = "n", keys = "gr", desc = "+LSP" },
                    { mode = "n", keys = "grp", desc = "+Peek" },
                    { mode = "n", keys = "s", desc = "+Surround" },
                    { mode = "n", keys = "z", desc = "+Fold / Scroll" },
                    { mode = "n", keys = "ZZ", desc = "Save and quit" },
                    { mode = "n", keys = "ZQ", desc = "Quit" },
                    { mode = "o", keys = "<leader>", desc = "+<leader>" },
                    { mode = "o", keys = "[", desc = "+To previous" },
                    { mode = "o", keys = "]", desc = "+To next" },
                    { mode = "o", keys = "g", desc = "+To" },
                    { mode = "v", "<leader>", desc = "+<leader>" },
                    { mode = "v", "<leader>r", desc = "+Replace/Refactor" },
                    { mode = "v", "[", desc = "+Visually select to previous" },
                    { mode = "v", "]", desc = "+Visually select to next" },
                    { mode = "v", "g", desc = "+Visually select to" },
                    { mode = "v", "s", desc = "+Surround" },
                },
            }) -- I use which-key.nvim
            require("mini.comment").setup({
                options = {
                    custom_commentstring = function()
                        return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
                    end,
                },
            }) -- Comment.nvim have more options
            require("mini.completion").setup() -- Nvim CMP have more integrations
            -- require("mini.deps").setup() -- I use lazy.nvim
            require("mini.fuzzy").setup() -- This is just sorter for telescope
            require("mini.git").setup() -- I prefer using lazygit
            require("mini.hipatterns").setup({
                highlighters = {
                    fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
                    hack  = { pattern = 'HACK',  group = 'MiniHipatternsHack'  },
                    todo  = { pattern = 'TODO',  group = 'MiniHipatternsTodo'  },
                    note  = { pattern = 'NOTE',  group = 'MiniHipatternsNote'  },
                    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
                    -- Todo+ (VsCode) + GTD from NEORG + Other Ideas
                    -- Todo Metadata
                    TODO_ESTIMATE = { pattern = "TODO_ESTIMATE", icon = " ", color = "info" },
                    TODO_STARTDATE = { pattern = "TODO_STARTDATE", icon = " ", color = "info" },
                    TODO_ENDDATE = { pattern = "TODO_ENDDATE", icon = " ", color = "info" },
                    TODO_TIMESPENT = { pattern = "TODO_TIMESPENT", icon = " ", color = "info" },
                    TODO_CONTEXT = { pattern = "TODO_CONTEXT", icon = " ", color = "info" },
                    TODO_WAITING_FOR = { pattern = "TODO_WAITING_FOR", icon = " ", color = "info" },
                    TODO_ASSIGNED = { pattern = "TODO_ASSIGNED", icon = " ", color = "info" },
                    TODO_TIMEREPORT = { pattern = "TODO_TIMEREPORT", icon = " ", color = "info" },
                    -- Todo priorities
                    TODO_CRITICAL = { pattern = "TODO_CRITICAL", icon = " ", color = "error" },
                    TODO_PRIORITY_HIGH = { pattern = "TODO_PRIORITY_HIGH", icon = " ", color = "warning" },
                    TODO_PRIORITY_LOW = { pattern = "TODO_PRIORITY_LOW", icon = "ﱢ ", color = "info" },
                    TODO_PRIORITY = { pattern = "TODO_PRIORITY", icon = "‼ ", color = "warning" },
                    TODO_MAYBE = { pattern = "TODO_MAYBE", icon = " ", color = "hint" },
                    -- Todo - Task Sentiment + Spoon Theory
                    TODO_SENTIMENT_POSITIVE = { pattern = "TODO_SENTIMENT_POSITIVE", icon = "󰱱 ", color = "info" },
                    TODO_SENTIMENT_NEUTRAL = { pattern = "TODO_SENTIMENT_NEUTRAL", icon = "󰱴 ", color = "info" },
                    TODO_SENTIMENT_NEGATIVE = { pattern = "TODO_SENTIMENT_NEGATIVE", icon = "󰱶 ", color = "info" },
                    -- Other keywords
                    CONTEXT = { pattern = "CONTEXT", icon = "❄", color = "info" },
                    IDEA = { pattern = "IDEA", icon = "☀", color = "hint" },
                    REASON = { pattern = "REASON", icon = "∵", color = "info" },
                    REFERENCE = { pattern = "REFERENCE", icon = "", color = "info" },
                    TIP = { pattern = "TIP", icon = "󰓠", color = "info" },
                    URL = { pattern = "URL", icon = "", color = "info" },
                }
            }) -- I prefer more todocomments.nvim
            require("mini.map").setup({}) -- nvim-scrollbar work a bit better
            MiniMap.open()
            require("mini.notify").setup({}) -- Cant be used because noice doesnt support it
            vim.notify = require('mini.notify').make_notify()
            PatVimKeyMapSet({
                "n",
                "<leader>dn",
                MiniNotify.clear,
                {
                    noremap = true,
                    silent = true,
                    desc = "Dismiss all elements of noice and notifications",
                },
            })
            require("mini.pairs").setup({}) -- I currently use nvim-autopairs
            require("mini.pick").setup({}) -- I prefer telescope.nvim
            vim.ui.select = MiniPick.ui_select
            function PAT_section_filename()
                -- In terminal always use plain name
                if vim.bo.buftype == 'terminal' then
                    return '%t'
                else
                    -- File name with 'truncate', 'modified', 'readonly' flags
                    -- Use relative path if truncated
                    return '%f%m%r'
                end
            end
            function PAT_section_location()
                -- Use `virtcol()` to correctly handle multi-byte characters
                return '%l/%L:%2v/%-2{virtcol("$") - 1}'
            end
            require("mini.statusline").setup({
                content = {
                    active = function()
                        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                        local git           = MiniStatusline.section_git({ trunc_width = 40 })
                        local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
                        local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                        local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
                        local filename      = PAT_section_filename()
                        local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                        local location      = PAT_section_location()
                        local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

                        return MiniStatusline.combine_groups({
                            { hl = mode_hl,                  strings = { mode } },
                            { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics, lsp } },
                            '%<', -- Mark general truncate point
                            { hl = 'MiniStatuslineFilename', strings = { filename } },
                            '%=', -- End left alignment
                            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                            { hl = mode_hl,                  strings = { search, location } },
                        })
                    end,
                }
            }) -- I prefer lualine.nvim
            require("mini.tabline").setup({}) -- I prefer bufferline.nvim
            require("mini.visits").setup({}) -- Will think about this one (maybe as addition to harpoon or instead of harpoon)
            vim.keymap.set(
                "n",
                '<Leader>vr',
                function()
                    local visits = require('mini.visits')
                    visits.select_path('', { sort = visits.gen_sort.default({ recency_weight = 1 }) })
                end,
                { desc = 'Select recent (all)' }
            )
            vim.keymap.set(
                "n",
                '<Leader>vR',
                function()
                    local visits = require('mini.visits')
                    visits.select_path(vim.fn.getcwd(), { sort = visits.gen_sort.default({ recency_weight = 1 }) })
                end,
                { desc = 'Select recent (cwd)' }
            )
            vim.keymap.set(
                "n",
                '<Leader>vy',
                function()
                    local visits = require('mini.visits')
                    visits.select_path('', { sort = visits.gen_sort.default({ recency_weight = 0.5 }) })
                end,
                { desc = 'Select frecent (all)' }
            )
            vim.keymap.set(
                "n",
                '<Leader>vY',
                function()
                    local visits = require('mini.visits')
                    visits.select_path(vim.fn.getcwd(), { sort = visits.gen_sort.default({ recency_weight = 0.5 }) })
                end,
                { desc = 'Select frecent (cwd)' }
            )
            vim.keymap.set(
                "n",
                '<Leader>vf',
                function()
                    local visits = require('mini.visits')
                    visits.select_path('', { sort = visits.gen_sort.default({ recency_weight = 0 }) })
                end,
                { desc = 'Select frequent (all)' }
            )
            vim.keymap.set(
                "n",
                '<Leader>vF',
                function()
                    local visits = require('mini.visits')
                    visits.select_path(vim.fn.getcwd(), { sort = visits.gen_sort.default({ recency_weight = 0 }) })
                end,
                { desc = 'Select frequent (cwd)' }
            )
            vim.keymap.set(
                'n',
                '<leader>va',
                '<Cmd>lua MiniVisits.add_label()<CR>',
                { desc = 'Add label' }
            )
            vim.keymap.set(
                'n',
                '<leader>vd',
                '<Cmd>lua MiniVisits.remove_label()<CR>',
                { desc = 'Remove label' }
            )
            vim.keymap.set(
                'n',
                '<leader>vl',
                '<Cmd>lua MiniVisits.select_label("", "")<CR>',
                { desc = 'Select label (all)' }
            )
            vim.keymap.set(
                'n',
                '<leader>vL',
                '<Cmd>lua MiniVisits.select_label()<CR>',
                { desc = 'Select label (cwd)' }
            )
            -- require("mini.base16").setup() -- Theme - I prefer more catpuccin or tokyonight
            require("mini.colors").setup()
            vim.schedule(function()
                MiniColors.get_colorscheme():add_transparency({
                    general = true,
                    float = true,
                    statuscolumn = true,
                    statusline = true,
                    tabline = true,
                    winbar = true
                }):apply()
            end)
            require("mini.hues").setup({
                background = "#1e1e2e",
                foreground = "#cba6f7",
                saturation = "medium",
                plugins = { default = true },
            }) -- Theme - I prefer more catpuccin or tokyonight
        end,
    },
}
