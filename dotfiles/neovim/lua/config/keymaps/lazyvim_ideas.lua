--#region LazyVim Ideas
-- Alternate file
-- Note alternate file to current file needs to be loaded before hand
PatVimKeyMapSet({
    "n",
    "<leader>#",
    "<cmd>e #<cr>",
    {
        silent = true,
        desc = "Go to alternate file",
    },
})
-- Comment on new line
PatVimKeyMapSet({
    "n",
    "gco",
    "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>",
    { desc = "Add Comment Below" },
})
PatVimKeyMapSet({
    "n",
    "gcO",
    "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>",
    { desc = "Add Comment Above" },
})
-- New File
PatVimKeyMapSet({
    "n",
    "<leader>on",
    "<cmd>enew<cr>",
    { desc = "New File" },
})
-- Lists
PatVimKeyMapSet({
    "n",
    "<leader>ol",
    "<cmd>lopen<cr>",
    { desc = "Location List" },
})
PatVimKeyMapSet({
    "n",
    "<leader>oq",
    "<cmd>copen<cr>",
    { desc = "Quickfix List" },
})
-- highlights under cursor
PatVimKeyMapSet({
    "n",
    "<leader>oT",
    vim.show_pos,
    { desc = "Treesitter Inspect Pos" },
})
PatVimKeyMapSet({
    "n",
    "<leader>ot",
    "<cmd>InspectTree<cr>",
    { desc = "Treesitter Inspect Tree" },
})
-- `2TermExec cmd="git status" dir=~/<my-repo-path>`
-- windows
PatVimKeyMapSet({
    "n",
    "<leader>ww",
    "<C-W>p",
    { desc = "Other Window", remap = true },
})
PatVimKeyMapSet({
    "n",
    "<leader>wd",
    "<C-W>c",
    { desc = "Delete Window", remap = true },
})
PatVimKeyMapSet({
    "n",
    "<leader>w-",
    "<C-W>s",
    { desc = "Split Window Below", remap = true },
})
PatVimKeyMapSet({
    "n",
    "<leader>w|",
    "<C-W>v",
    { desc = "Split Window Right", remap = true },
})
PatVimKeyMapSet({
    "n",
    "<leader>-",
    "<C-W>s",
    { desc = "Split Window Below", remap = true },
})
PatVimKeyMapSet({
    "n",
    "<leader>|",
    "<C-W>v",
    { desc = "Split Window Right", remap = true },
})

-- tabs
PatVimKeyMapSet({
    "n",
    "<leader><tab>l",
    "<cmd>tablast<cr>",
    { desc = "Last Tab" },
})
PatVimKeyMapSet({
    "n",
    "<leader><tab>o",
    "<cmd>tabonly<cr>",
    { desc = "Close Other Tabs" },
})
PatVimKeyMapSet({
    "n",
    "<leader><tab>f",
    "<cmd>tabfirst<cr>",
    { desc = "First Tab" },
})
PatVimKeyMapSet({
    "n",
    "<leader><tab><tab>",
    "<cmd>tabnew<cr>",
    { desc = "New Tab" },
})
PatVimKeyMapSet({
    "n",
    "<leader><tab>]",
    "<cmd>tabnext<cr>",
    { desc = "Next Tab" },
})
PatVimKeyMapSet({
    "n",
    "<leader><tab>d",
    "<cmd>tabclose<cr>",
    { desc = "Close Tab" },
})
PatVimKeyMapSet({
    "n",
    "<leader><tab>[",
    "<cmd>tabprevious<cr>",
    { desc = "Previous Tab" },
})
--#endregion
--#region Treesitter
PatVimKeyMapSet({
    "n",
    "<C-space>",
    "<cmd>normal gni<cr>",
    {
        desc = "Start incremental selection",
        noremap = true,
        silent = true,
    },
})
PatVimKeyMapSet({
    "v",
    "<C-space>",
    function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gna", true, false, true), "x", false)
    end,
    {
        desc = "Incremental selection",
        noremap = true,
        silent = true,
    },
})
PatVimKeyMapSet({
    "v",
    "<BS>",
    function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gnx", true, false, true), "x", false)
    end,
    {
        desc = "Decremental selection",
        noremap = true,
        silent = true,
    },
})
--#endregion
--#region Bufferline
PatVimKeyMapSet({
    "n",
    "<leader>bp",
    "<Cmd>BufferLineTogglePin<CR>",
    { desc = "Toggle Pin" },
})
PatVimKeyMapSet({
    "n",
    "<leader>bP",
    "<Cmd>BufferLineGroupClose ungrouped<CR>",
    { desc = "Delete Non-Pinned Buffers" },
})
PatVimKeyMapSet({
    "n",
    "<leader>bo",
    "<Cmd>BufferLineCloseOthers<CR>",
    { desc = "Delete Other Buffers" },
})
PatVimKeyMapSet({
    "n",
    "<leader>br",
    "<Cmd>BufferLineCloseRight<CR>",
    { desc = "Delete Buffers to the Right" },
})
PatVimKeyMapSet({
    "n",
    "<leader>bl",
    "<Cmd>BufferLineCloseLeft<CR>",
    { desc = "Delete Buffers to the Left" },
})
PatVimKeyMapSet({
    "n",
    "<leader>b<Left>",
    "<Cmd>BufferLineCyclePrev<CR>",
    { desc = "Prev Buffer" },
})
PatVimKeyMapSet({
    "n",
    "<leader>b<Right>",
    "<Cmd>BufferLineCycleNext<CR>",
    { desc = "Next Buffer" },
})
PatVimKeyMapSet({
    "n",
    "B<Left>",
    "<Cmd>BufferLineCyclePrev<CR>",
    { desc = "Prev Buffer" },
})
PatVimKeyMapSet({
    "n",
    "B<Right>",
    "<Cmd>BufferLineCycleNext<CR>",
    { desc = "Next Buffer" },
})
--#endregion
--#region Noice
PatVimKeyMapSet({
    "n",
    "<leader>nt",
    function()
        require("noice").cmd("pick")
    end,
    { desc = "Noice Picker (Telescope/FzfLua)" },
})
--#endregion
--#region Telescope
PatVimKeyMapSet({
    "n",
    "<leader>:",
    "<cmd>Telescope command_history<cr>",
    { desc = "Telescope Command History" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fCf",
    function()
        require("telescope.builtin").find_files({
            prompt_title = "Find file in config",
            cwd = vim.fn.stdpath("config"),
        })
    end,
    { desc = "Telescope Find file in Config" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fCl",
    function()
        require("telescope.builtin").live_grep({
            prompt_title = "Search in config",
            cwd = vim.fn.stdpath("config"),
        })
    end,
    { desc = "Telescope Search in Config" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fgf",
    function()
        require("telescope.builtin").find_files({
            prompt_title = "Find file in Projects",
            cwd = "~/go/src/",
        })
    end,
    { desc = "Telescope Find file in Projects" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fgl",
    function()
        require("telescope.builtin").live_grep({
            prompt_title = "Search in Projects",
            cwd = "~/go/src/",
        })
    end,
    { desc = "Telescope Search in Projects" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fo",
    "<cmd>Telescope loclist<cr>",
    { desc = "Telescope Location List" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fq",
    "<cmd>Telescope quickfix<cr>",
    { desc = "Telescope Quickfix List" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fm",
    "<cmd>Telescope man_pages<cr>",
    { desc = "Telescope Man Page" },
})
PatVimKeyMapSet({
    "n",
    "<leader>f`",
    "<cmd>Telescope marks<cr>",
    { desc = "Telescope Marks" },
})
PatVimKeyMapSet({
    "n",
    "<leader>f,",
    -- "<cmd>Telescope lsp_document_symbols<cr>",
    function()
        require("telescope.builtin").lsp_document_symbols({
            layout_strategy = "vertical",
            layout_config = {
                preview_cutoff = 0,
                preview_height = 0.5,
            },
            fname_width = 0.4,
            symbol_width = 0.4,
            symbol_type_width = 0.2,
        })
    end,
    { desc = "Telescope Document Symbols" },
})
PatVimKeyMapSet({
    "n",
    "<leader>f.",
    -- "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
            layout_strategy = "vertical",
            layout_config = {
                preview_cutoff = 0,
                preview_height = 0.5,
            },
            fname_width = 0.4,
            symbol_width = 0.4,
            symbol_type_width = 0.2,
        })
    end,
    { desc = "Telescope Workspace Symbols" },
})
PatVimKeyMapSet({
    "n",
    "<leader>f/",
    -- Function provided is changed lsp_dynamic_workspace_symbols
    -- "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    function()
        local bufnr = vim.api.nvim_get_current_buf()
        local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
        local cwd_dir = vim.fn.getcwd(-1, -1)
        local forbidden_dirs_per_ft = {
            ["global"] = {
                "node_modules",
                "vendor",
            },
            ["lua"] = {
                ".local/share",
                -- TODO: Add windows location
            },
            ["php"] = {},
            ["javascript"] = {},
            ["javascriptreact"] = {},
            ["typescript"] = {},
            ["typescriptreact"] = {},
            ["go"] = {},
            ["python2"] = {
                cwd_dir .. "/venv",
                cwd_dir .. "\\venv",
            },
            ["python"] = {
                cwd_dir .. "/venv",
                cwd_dir .. "\\venv",
            },
            ["ruby"] = {},
            ["eruby"] = {},
            ["java"] = {
                cwd_dir .. "/.gradle",
                cwd_dir .. "\\.gradle",
            },
            ["c"] = {
                "include",
            },
            ["cpp"] = {
                "include",
            },
            ["rust"] = {},
        }
        local function vendor_filter(symbols)
            if vim.tbl_isempty(symbols) then
                return symbols
            end
            return vim.tbl_filter(function(symbol)
                for _, pattern in ipairs(forbidden_dirs_per_ft["global"] or {}) do
                    if string.match(symbol.filename, pattern) then
                        return false
                    end
                end
                for _, pattern in ipairs(forbidden_dirs_per_ft[buf_ft] or {}) do
                    if string.match(symbol.filename, pattern) then
                        return false
                    end
                end
                return true
            end, symbols)
        end
        local symbols_sorter = function(symbols)
            if vim.tbl_isempty(symbols) then
                return symbols
            end

            local current_buf = vim.api.nvim_get_current_buf()

            -- sort adequately for workspace symbols
            local filename_to_bufnr = {}
            for _, symbol in ipairs(symbols) do
                if filename_to_bufnr[symbol.filename] == nil then
                    filename_to_bufnr[symbol.filename] = vim.uri_to_bufnr(vim.uri_from_fname(symbol.filename))
                end
                symbol.bufnr = filename_to_bufnr[symbol.filename]
            end

            table.sort(symbols, function(a, b)
                if a.bufnr == b.bufnr then
                    return a.lnum < b.lnum
                end
                if a.bufnr == current_buf then
                    return true
                end
                if b.bufnr == current_buf then
                    return false
                end
                return a.bufnr < b.bufnr
            end)

            return symbols
        end
        local function get_workspace_symbols_requester(opts)
            local cancel = function() end

            return function(prompt)
                local tx, rx = require("plenary.async.control").channel.oneshot()
                cancel()
                _, cancel = vim.lsp.buf_request(bufnr, "workspace/symbol", { query = prompt }, tx)

                -- Handle 0.5 / 0.5.1 handler situation
                local err, res = rx()
                assert(not err, err)

                local locations = vim.lsp.util.symbols_to_items(res or {}, bufnr) or {}
                locations = vendor_filter(locations)
                if not vim.tbl_isempty(locations) then
                    locations = require("telescope.utils").filter_symbols(locations, opts, symbols_sorter) or {}
                end
                return locations
            end
        end

        local function dynamic_workspace_symbols(opts)
            require("telescope.pickers")
                .new(opts, {
                    prompt_title = "LSP Project Symbols",
                    finder = require("telescope.finders").new_dynamic({
                        entry_maker = opts.entry_maker or require("telescope.make_entry").gen_from_lsp_symbols(opts),
                        fn = get_workspace_symbols_requester(opts),
                    }),
                    previewer = require("telescope.config").values.qflist_previewer(opts),
                    sorter = require("telescope.sorters").highlighter_only(opts),
                    attach_mappings = function(_, map)
                        map("i", "<c-space>", require("telescope.actions").to_fuzzy_refine)
                        return true
                    end,
                })
                :find()
        end
        dynamic_workspace_symbols({
            layout_strategy = "vertical",
            layout_config = {
                preview_cutoff = 0,
                preview_height = 0.5,
            },
            fname_width = 0.4,
            symbol_width = 0.4,
            symbol_type_width = 0.2,
        })
    end,
    { desc = "Telescope Project Symbols" },
})
PatVimKeyMapSet({
    "n",
    '<leader>f"',
    -- "<cmd>LSPSaga outline<cr>",
    function()
        local lspsaga = require("lspsaga")
        -- Float
        lspsaga.config.outline.layout = "float"
        lspsaga.config.outline.max_height = 0.7
        -- Run
        require("lspsaga.symbol"):outline()
        -- Default
        lspsaga.config.outline.layout = "normal"
        lspsaga.config.outline.max_height = 0.5
    end,
    { desc = "LSP Saga Outline Float" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fT",
    "<cmd>Telescope treesitter<cr>",
    { desc = "Telescope Treesitter" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fR",
    "<cmd>Telescope resume<cr>",
    { desc = "Telescope Resume" },
})
PatVimKeyMapSet({
    "n",
    "<leader>fB",
    "<cmd>Telescope<cr>",
    { desc = "Telescope Builtin" },
})

-- Default scrolloff with jzz on end of file is super buggy mess
-- local default_scrolloff = vim.o.scrolloff
vim.g.scrolloff = false
PatVimKeyMapSet({
    "n",
    "<leader>to",
    function()
        -- if vim.o.scrolloff == 999 then
        --     vim.o.scrolloff = default_scrolloff
        -- else
        --     vim.o.scrolloff = 999
        -- end
        vim.g.scrolloff = vim.g.scrolloff == false
    end,
    { desc = "Switch between normal scrolloff and force center" },
})
local default_sidescrolloff = vim.o.sidescrolloff
PatVimKeyMapSet({
    "n",
    "<leader>tO",
    function()
        if vim.o.sidescrolloff == 999 then
            vim.o.sidescrolloff = default_sidescrolloff
        else
            vim.o.sidescrolloff = 999
        end
    end,
    { desc = "Switch between normal sidescrolloff and force center" },
})
--#endregion
--#region Indent
PatVimKeyMapSet({
    "v",
    "<",
    "<gv",
    { desc = "Indent Left" }
})
PatVimKeyMapSet({
    "v",
    ">",
    ">gv",
    { desc = "Indent Left" }
})
--#endregion
