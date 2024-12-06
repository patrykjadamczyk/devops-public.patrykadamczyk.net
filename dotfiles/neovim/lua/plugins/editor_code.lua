return {
    -- A better annotation generator. Supports multiple languages and annotation conventions.
    {
        "danymat/neogen",
        priority = vim.g.patconfig_highest_base_priority - 310,
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("neogen").setup({
                snippet_engine = "nvim",
                enabled = true,
                languages = {
                    cs = {
                        template = {
                            annotation_convention = "xmldoc",
                        },
                    },
                },
            })
        end,
    },
    -- Todo Comments
    {
        "folke/todo-comments.nvim",
        priority = vim.g.patconfig_highest_base_priority - 310,
        opts = {
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                -- Todo+ (VsCode) + GTD from NEORG + Other Ideas
                -- Todo Metadata
                TODO_ESTIMATE = { icon = " ", color = "info" },
                TODO_STARTDATE = { icon = " ", color = "info" },
                TODO_ENDDATE = { icon = " ", color = "info" },
                TODO_TIMESPENT = { icon = " ", color = "info" },
                TODO_CONTEXT = { icon = " ", color = "info" },
                TODO_WAITING_FOR = { icon = " ", color = "info" },
                TODO_ASSIGNED = { icon = " ", color = "info" },
                TODO_TIMEREPORT = { icon = " ", color = "info" },
                -- Todo priorities
                TODO_CRITICAL = { icon = " ", color = "error" },
                TODO_PRIORITY_HIGH = { icon = " ", color = "warning" },
                TODO_PRIORITY_LOW = { icon = "ﱢ ", color = "info" },
                TODO_PRIORITY = { icon = "‼ ", color = "warning" },
                TODO_MAYBE = { icon = " ", color = "hint" },
                -- Todo - Task Sentiment + Spoon Theory
                TODO_SENTIMENT_POSITIVE = { icon = "󰱱 ", color = "info" },
                TODO_SENTIMENT_NEUTRAL = { icon = "󰱴 ", color = "info" },
                TODO_SENTIMENT_NEGATIVE = { icon = "󰱶 ", color = "info" },
                -- Other keywords
                CONTEXT = { icon = "❄", color = "info" },
                IDEA = { icon = "☀", color = "hint" },
                REASON = { icon = "∵", color = "info" },
                REFERENCE = { icon = "", color = "info" },
                TIP = { icon = "󰓠", color = "info" },
                URL = { icon = "", color = "info" },
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        },
        -- config = function()
        --   require("todo-comments").setup({})
        -- end
    },
    -- AutoPair
    {
        "windwp/nvim-autopairs",
        priority = vim.g.patconfig_highest_base_priority - 310,
        event = "InsertEnter",
        opts = {
            map_cr = false,
            -- map_cr = true,
            check_ts = true,
        },
        config = function(_, opts)
            local npairs = require("nvim-autopairs")
            npairs.setup(opts)
            -- Place for special rules (docs: https://github.com/windwp/nvim-autopairs)
        end,
    },
    -- Better folds
    {
        "kevinhwang91/nvim-ufo",
        priority = vim.g.patconfig_highest_base_priority - 310,
        dependencies = {
            "kevinhwang91/promise-async",
        },
    },
    -- Colors for CSS etc
    {
        "brenoprata10/nvim-highlight-colors",
        priority = vim.g.patconfig_highest_base_priority - 310,
        opts = {
            -- render = "background",
            -- render = "foreground",
            render = "virtual",
            virtual_symbol = "■",
            virtual_symbol_prefix = "",
            virtual_symbol_suffix = " ",
            virtual_symbol_position = "inline",
            enable_hex = true,
            enable_short_hex = true,
            enable_rgb = true,
            enable_hsl = true,
            enable_var_usage = true,
            enable_named_colors = true,
            enable_tailwind = true,
        },
        config = function(_, opts)
            vim.opt.termguicolors = true
            require("nvim-highlight-colors").setup(opts)
        end,
    },
    -- Template
    {
        "glepnir/template.nvim",
        priority = vim.g.patconfig_highest_base_priority - 310,
        opts = {
            temp_dir = vim.fn.stdpath("config") .. "/nvim_templates",
            author = "Patryk Adamczyk",
            email = "patrykadamczyk@patrykadamczyk.net",
        },
    },
    -- Rainbow delimeters
    {
        "HiPhish/rainbow-delimiters.nvim",
        priority = vim.g.patconfig_highest_base_priority - 310,
        config = false,
    },
}
