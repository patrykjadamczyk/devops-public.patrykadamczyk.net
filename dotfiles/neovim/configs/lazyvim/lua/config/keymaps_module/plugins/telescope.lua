--#region Telescope Keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true no_ignore_parent=true<cr>", {
    noremap = true,
    silent = true,
    desc = "Search for hidden files using Telescope",
})
vim.keymap.set("n", "<leader>fF", "<cmd>Telescope find_files<cr>", {
    noremap = true,
    silent = true,
    desc = "Search for files using Telescope",
})
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {
    noremap = true,
    silent = true,
    desc = "Search for buffers using Telescope",
})
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {
    noremap = true,
    silent = true,
    desc = "Search for help tags using Telescope",
})
vim.keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", {
    noremap = true,
    silent = true,
    desc = "Search for notifications using Telescope",
})
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", {
    noremap = true,
    silent = true,
    desc = "Search for content in files using Telescope",
})
--#endregion
--#region Telescope LSP Keymaps
vim.keymap.set("n", "<leader>ltd", "<cmd>Telescope lsp_type_definitions<cr>", {
    noremap = true,
    silent = true,
    desc = "Show type definitions from LSP using Telescope",
})
vim.keymap.set("n", "<leader>lD", "<cmd>Telescope lsp_definitions<cr>", {
    noremap = true,
    silent = true,
    desc = "Show definitions from LSP using Telescope",
})
vim.keymap.set("n", "<leader>lim", "<cmd>Telescope lsp_implementations<cr>", {
    noremap = true,
    silent = true,
    desc = "Show implementations from LSP using Telescope",
})
vim.keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through workspace symbols using Telescope",
})
vim.keymap.set("n", "<leader>lws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through workspace symbols using Telescope",
})
vim.keymap.set("n", "<leader>ldc", "<cmd>Telescope lsp_document_symbols<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through document symbols using Telescope",
})
vim.keymap.set("n", "<leader>loc", "<cmd>Telescope lsp_outgoing_calls<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through outgoing calls using Telescope",
})
vim.keymap.set("n", "<leader>lic", "<cmd>Telescope lsp_incoming_calls<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through incoming calls using Telescope",
})
vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through references using Telescope",
})
--#endregion
--#region Telescope Other Keymaps
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", {
    noremap = true,
    silent = true,
    desc = "Search through workspace symbols using Telescope",
})
--#endregion
--#region Additional keymaps
vim.keymap.set("n", "<leader>fS", function()
    require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
        previewer = false,
    }))
end, {
    noremap = true,
    silent = true,
    desc = "Suggest spelling using Telescope",
})
local function fuzzy_find_current_buffer()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end
vim.keymap.set("n", "<leader>/", fuzzy_find_current_buffer, {
    noremap = true,
    silent = true,
    desc = "Fuzzy search in current buffer",
})
--#endregion
