--#region Telescope Keymaps
-- PatVimKeyMapSet({
--     "n",
--     "<leader>ff",
--     "<cmd>Telescope find_files hidden=true no_ignore=true no_ignore_parent=true<cr>",
--     {
--         noremap = true,
--         silent = true,
--         desc = "Search for hidden files using Telescope",
--     },
-- })
PatVimKeyMapSet({
    "n",
    "<leader>ff",
    "<cmd>Telescope frecency workspace=CWD<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for files using Telescope (recent)",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fL",
    "<cmd>Telescope frecency workspace=LSP<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for files using Telescope in current LSP workspace",
    },
})
-- PatVimKeyMapSet({
--     "n",
--     "<leader>fF",
-- --     "<cmd>Telescope find_files hidden=true no_ignore=true no_ignore_parent=true<cr>",
--     "<cmd>Telescope find_files<cr>",
--     {
--         noremap = true,
--         silent = true,
--         desc = "Search for files using Telescope",
--     },
-- })
PatVimKeyMapSet({
    "n",
    "<leader>fF",
    "<cmd>Telescope find_files hidden=true no_ignore=true no_ignore_parent=true<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for files using Telescope (builtin)",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fN",
    "<cmd>Telescope find_files cwd=~/.config/neorg prompt_title=Notes<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for notes using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fp",
    "<cmd>Telescope projects<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Open project using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fb",
    "<cmd>Telescope buffers<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for buffers using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fh",
    "<cmd>Telescope help_tags<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for help tags using Telescope",
    },
})
-- PatVimKeyMapSet({
--     "n",
--     "<leader>fn",
--     "<cmd>Telescope notify<cr>",
--     {
--         noremap = true,
--         silent = true,
--         desc = "Search for notifications using Telescope",
--     },
-- })
PatVimKeyMapSet({
    "n",
    "<leader>fl",
    "<cmd>Telescope live_grep<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for content in files using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fr",
    "<cmd>Telescope frecency<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for recent files using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<C-p>",
    "<cmd>Telescope command_palette<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Show command palette",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fe",
    "<cmd>Telescope file_browser<cr>",
    {
        noremap = true,
        silent = true,
        desc = "File browser using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fE",
    function()
        vim.notify(
            table.concat({
                "InsertMode|NormalMode    name    action",
                "A-c|c    create    Create file|folder at current path (trailing path separator creates folder)",
                "S-CR    create_from_prompt    Create and open file|folder from prompt (trailing path separator creates folder)",
                "A-r|r    rename    Rename multi-selected files|folders",
                "A-m|m    move    Move multi-selected files|folders to current path",
                "A-y|y    copy    Copy (multi-)selected files|folders to current path",
                "A-d|d    remove    Delete (multi-)selected files|folders",
                "C-o|o    open    Open file|folder with default system application",
                "C-g|g    goto_parent_dir    Go to parent directory",
                "C-e|e    goto_home_dir    Go to home directory",
                "C-w|w    goto_cwd    Go to current working directory (cwd)",
                "C-t|t    change_cwd    Change nvim's cwd to selected folder|file(parent)",
                "C-f|f    toggle_browser    Toggle between file and folder browser",
                "C-h|h    toggle_hidden    Toggle hidden files|folders",
                "C-s|s    toggle_all    Toggle all entries ignoring .| and ..|",
                "Tab    see telescope.nvim    Toggle selection and move to next selection",
                "S-Tab    see telescope.nvim    Toggle selection and move to prev selection",
                "bs|    backspace    With an empty prompt, goes to parent dir. Otherwise acts normally",
            }, "\n"),
            vim.log.levels.INFO,
            {
                title = "File browser using Telescope",
            }
        )
    end,
    {
        noremap = true,
        silent = true,
        desc = "File browser using Telescope",
    },
})
--#endregion
--#region Telescope LSP Keymaps
PatVimKeyMapSet({
    "n",
    "<leader>ltd",
    "<cmd>Telescope lsp_type_definitions<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Show type definitions from LSP using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lD",
    "<cmd>Telescope lsp_definitions<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Show definitions from LSP using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lim",
    "<cmd>Telescope lsp_implementations<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Show implementations from LSP using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lS",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through workspace symbols using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lws",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through workspace symbols using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>ldc",
    "<cmd>Telescope lsp_document_symbols<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through document symbols using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>loc",
    "<cmd>Telescope lsp_outgoing_calls<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through outgoing calls using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lic",
    "<cmd>Telescope lsp_incoming_calls<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through incoming calls using Telescope",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lr",
    "<cmd>Telescope lsp_references<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through references using Telescope",
    },
})
--#endregion
--#region Telescope Other Keymaps
PatVimKeyMapSet({
    "n",
    "<leader>fw",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through workspace symbols using Telescope",
    },
})
--#endregion
--#region Additional keymaps
PatVimKeyMapSet({
    "n",
    "<leader>fS",
    function()
        require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
            previewer = false,
        }))
    end,
    {
        noremap = true,
        silent = true,
        desc = "Suggest spelling using Telescope",
    },
})
local function fuzzy_find_current_buffer()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end
PatVimKeyMapSet({
    "n",
    "<leader>/",
    fuzzy_find_current_buffer,
    {
        noremap = true,
        silent = true,
        desc = "Fuzzy search in current buffer",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>is",
    -- This hack of `i<esc>` is just so its placed in correct place (after cursor)
    "i<esc><cmd>Telescope symbols<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Insert symbol",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>it",
    "<cmd>Telescope find_template type=insert<CR>",
    {
        noremap = true,
        silent = true,
        desc = "Insert template",
    },
})
--#endregion
