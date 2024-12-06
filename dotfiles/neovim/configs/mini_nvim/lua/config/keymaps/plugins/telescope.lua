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
    "<cmd>lua MiniPick.builtin.files({}, {})<cr>",
    -- '<cmd>lua MiniPick.builtin.files({}, {source = { cwd = "../../../.."}})<cr>',
    {
        noremap = true,
        silent = true,
        desc = "Search for files using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fN",
    '<cmd>lua MiniPick.builtin.files({}, { source = { cwd = "~/.config/neorg", name = "Notes" }})<cr>',
    {
        noremap = true,
        silent = true,
        desc = "Search for notes using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fb",
    "<cmd>Pick buffers<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for buffers using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fh",
    "<cmd>Pick help<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for help tags using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fn",
    MiniNotify.show_history,
    {
        noremap = true,
        silent = true,
        desc = "Search for notifications using Notify",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>fl",
    "<cmd>lua MiniPick.builtin.grep_live({}, {})<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search for content in files using Pick",
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
    "<leader>fe",
    "<cmd>Pick explorer<cr>",
    {
        noremap = true,
        silent = true,
        desc = "File browser using Pick",
    },
})
--#endregion
--#region Telescope LSP Keymaps
PatVimKeyMapSet({
    "n",
    "<leader>ltd",
    "<cmd>Pick lsp scope='type_definition'<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Show type definitions from LSP using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lD",
    "<cmd>Pick lsp scope='definition'<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Show definitions from LSP using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lim",
    "<cmd>Pick lsp scope='implementation'<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Show implementations from LSP using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lS",
    "<cmd>Pick lsp scope='workspace_symbol'<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through workspace symbols using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>lws",
    "<cmd>Pick lsp scope='workspace_symbol'<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through workspace symbols using Pick",
    },
})
PatVimKeyMapSet({
    "n",
    "<leader>ldc",
    "<cmd>Pick lsp scope='document_symbol'<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through document symbols using Pick",
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
    "<cmd>Pick lsp scope='references'<cr>",
    {
        noremap = true,
        silent = true,
        desc = "Search through references using Pick",
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
    "<cmd>Pick buf_lines<cr>",
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
--#endregion
