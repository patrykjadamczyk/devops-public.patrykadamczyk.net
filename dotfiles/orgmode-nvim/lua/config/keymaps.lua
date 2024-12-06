local keymap = vim.keymap
-- ==================== Keyboard Shortcuts and Remaps ====================
-- Keymaps from vim format
--#region Window Navigation (Ctrl+[H/J/K/L])
keymap.set(
  "n",
  "<C-h>",
  "<C-w>h",
  {
    noremap = true,
    silent = true,
    desc = "Go to left window"
  }
)
keymap.set(
  "n",
  "<C-j>",
  "<C-w>j",
  {
    noremap = true,
    silent = true,
    desc = "Go to bottom window"
  }
)
keymap.set(
  "n",
  "<C-k>",
  "<C-w>k",
  {
    noremap = true,
    silent = true,
    desc = "Go to top window"
  }
)
keymap.set(
  "n",
  "<C-l>",
  "<C-w>l",
  {
    noremap = true,
    silent = true,
    desc = "Go to right window"
  }
)
--#endregion
--#region Window Navigation (Ctrl+[ArrowKeys])
keymap.set(
  "n",
  "<C-Left>",
  "<C-w>h",
  {
    noremap = true,
    silent = true,
    desc = "Go to left window"
  }
)
keymap.set(
  "n",
  "<C-Down>",
  "<C-w>j",
  {
    noremap = true,
    silent = true,
    desc = "Go to bottom window"
  }
)
keymap.set(
  "n",
  "<C-Up>",
  "<C-w>k",
  {
    noremap = true,
    silent = true,
    desc = "Go to top window"
  }
)
keymap.set(
  "n",
  "<C-Right>",
  "<C-w>l",
  {
    noremap = true,
    silent = true,
    desc = "Go to left window"
  }
)
--#endregion
--#region Window Resize (Ctrl+W [left/down/up/right])
keymap.set(
  "n",
  "<C-w><left>",
  "<C-w>>",
  {
    noremap = true,
    silent = true,
    desc = "Increase window width"
  }
)
keymap.set(
  "n",
  "<C-w><right>",
  "<C-w><",
  {
    noremap = true,
    silent = true,
    desc = "Decrease window width"
  }
)
keymap.set(
  "n",
  "<C-w><up>",
  "<C-w>+",
  {
    noremap = true,
    silent = true,
    desc = "Increase window height"
  }
)
keymap.set(
  "n",
  "<C-w><down>",
  "<C-w>-",
  {
    noremap = true,
    silent = true,
    desc = "Decrease window height"
  }
)
--#endregion
--#region Tab Navigation (T + [H/J/K/L] / TN)
keymap.set(
  "n",
  "th",
  "<cmd>tabfirst<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Go to first tab"
  }
)
keymap.set(
  "n",
  "tk",
  "<cmd>tabnext<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Go to next tab"
  }
)
keymap.set(
  "n",
  "tj",
  "<cmd>tabprev<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Go to previous tab"
  }
)
keymap.set(
  "n",
  "tl",
  "<cmd>tablast<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Go to last tab"
  }
)
keymap.set(
  "n",
  "tn",
  "<cmd>tabnew<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Open new tab"
  }
)
keymap.set(
  "n",
  "td",
  "<cmd>tabclose<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Close current tab"
  }
)
keymap.set(
  "n",
  "t<right>",
  "<cmd>tabnext<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Go to next tab"
  }
)
keymap.set(
  "n",
  "t<left>",
  "<cmd>tabprev<CR>",
  {
    noremap = true,
    silent = true,
    desc = "Go to previous tab"
  }
)
--#endregion
-- ========== Plugin Keymaps ==========
--#region Telescope Keymaps
keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search for files using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>fp",
  "<cmd>Telescope projects<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Open project using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search for buffers using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>fh",
  "<cmd>Telescope help_tags<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search for help tags using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>fn",
  "<cmd>Telescope notify<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search for notifications using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>fl",
  "<cmd>Telescope live_grep<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search for content in files using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>fr",
  "<cmd>Telescope frecency<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search for recent files using Telescope"
  }
)
keymap.set(
  "n",
  "<C-p>",
  "<cmd>Telescope command_palette<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Show command palette"
  }
)
--#endregion
--#region Telescope LSP Keymaps
keymap.set(
  "n",
  "<leader>ltd",
  "<cmd>Telescope lsp_type_definitions<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Show type definitions from LSP using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>ld",
  "<cmd>Telescope lsp_definitions<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Show definitions from LSP using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>li",
  "<cmd>Telescope lsp_implementations<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Show implementations from LSP using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>lws",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through workspace symbols using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>ldc",
  "<cmd>Telescope lsp_document_symbols<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through document symbols using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>loc",
  "<cmd>Telescope lsp_outgoing_calls<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through outgoing calls using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>lic",
  "<cmd>Telescope lsp_incoming_calls<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through incoming calls using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>lr",
  "<cmd>Telescope lsp_references<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through references using Telescope"
  }
)
--#endregion
--#region Telescope Other Keymaps
keymap.set(
  "n",
  "<leader>fs",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through workspace symbols using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>fr",
  "<cmd>Telescope lsp_references<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through references using Telescope"
  }
)
--#endregion
--#region LSP Saga Keymaps
keymap.set(
  "n",
  "<leader>fd",
  "<cmd>Lspsaga show_buf_diagnostics<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through diagnostics for current buffer using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>pd",
  "<cmd>Lspsaga peek_definition<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Peek definition using LSP Saga"
  }
)
keymap.set(
  "n",
  "<leader>hd",
  "<cmd>Lspsaga hover_doc<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Show hover documentation using LSP Saga"
  }
)
--#endregion
--#region Breakpoints
keymap.set(
  "n",
  "<leader>b",
  "<cmd>lua require('dap').toggle_breakpoint()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Toggle breakpoint for current line"
  }
)
keymap.set(
  "n",
  "<leader>fb",
  "<cmd>lua require('telescope').extensions.dap.list_breakpoints({})<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through list of breakpoints using Telescope"
  }
)
keymap.set(
  "n",
  "<leader>dr",
  "<cmd>lua require('dap').repl.open()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Open Debugger REPL"
  }
)
keymap.set(
  "n",
  "<leader>du",
  "<cmd>lua require('dapui').toggle()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Open Debugger UI"
  }
)
--#endregion
--#region TroubleToggle
keymap.set(
  "n",
  "<leader>ttd",
  "<cmd>TroubleToggle document_diagnostics<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Open Trouble window for current document diagnostics"
  }
)
keymap.set(
  "n",
  "<leader>ttw",
  "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Open Trouble window for workspace diagnostics"
  }
)
keymap.set(
  "n",
  "<leader>ft",
  "<cmd>TodoTelescope<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through TODOs using Telescope"
  }
)
--#endregion
--#region Format through LSP
keymap.set(
  "n",
  "<leader>lf",
  "<cmd>lua vim.lsp.buf.format()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Format buffer using LSP"
  }
)
--#endregion
--#region Scratch
keymap.set(
  "n",
  "<leader>sc",
  "<cmd>lua require('scretch').new_named()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Make new named scratch file"
  }
)
keymap.set(
  "n",
  "<leader>sf",
  "<cmd>lua require('scretch').search()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through scratch files"
  }
)
--#endregion
--#region Neorg
keymap.set(
  "n",
  "<leader>nj",
  "<cmd>Neorg journal today<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Open today's neorg journal entry"
  }
)
--#endregion
--#region LSP Saga Terminal
keymap.set(
  "n",
  "<A-t>",
  "<cmd>Lspsaga term_toggle<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Toggle terminal from LSP Saga"
  }
)
--#endregion
--#region Undo History
keymap.set(
  "n",
  "<leader>u",
  "<cmd>Telescope undo<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through undo history using Telescope"
  }
)
--#endregion
--#region Nvim-cmp / Autocomplete
keymap.set(
  "i",
  "<C-space>",
  "<cmd>lua require('cmp').complete()<cr>",
  {
    silent = true,
    desc = "Force autocomplete"
  }
)
keymap.set(
  "i",
  "<C-c>",
  "<cmd>lua require('cmp').complete()<cr>",
  {
    silent = true,
    desc = "Force autocomplete"
  }
)
--#endregion
--#region Visual Multi Cursor Mode
keymap.set(
  "n",
  "<C-d>b",
  "<Plug>(VM-Start-Regex-Search)",
  {
    silent = true,
    desc = "Search using Regex for adding next cursor"
  }
)
keymap.set(
  "n",
  "<C-d>d",
  "<Plug>(VM-Find-Under)",
  {
    silent = true,
    desc = "Add new cursor to next occurence of word under cursor"
  }
)
keymap.set(
  "n",
  "<C-S-Up>",
  "<Plug>(VM-Add-Cursor-Up)",
  {
    silent = true,
    desc = "Add cursor above current line"
  }
)
keymap.set(
  "n",
  "<C-S-Down>",
  "<Plug>(VM-Add-Cursor-Down)",
  {
    silent = true,
    desc = "Add cursor below current line"
  }
)
--#endregion
--#region Inlay Hints
keymap.set(
  "n",
  "<leader>th",
  "<cmd>lua vim.lsp.inlay_hint(0, nil)<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Toggle inlay hints"
  }
)
--#endregion
--#region Harpoon
keymap.set(
  "n",
  "<leader>hm",
  "<cmd>lua require('harpoon.mark').toggle_file()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Toggle harpoon mark for current file"
  }
)
keymap.set(
  "n",
  "<leader>hq",
  "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Open Harpoon quick menu"
  }
)
keymap.set(
  "n",
  "<leader>hn",
  "<cmd>lua require('harpoon.ui').nav_next()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Go to next Harpoon mark"
  }
)
keymap.set(
  "n",
  "<leader>hp",
  "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Go to previous Harpoon Mark"
  }
)
-- nnoremap <leader>hf <cmd>Telescope harpoon marks<cr>
keymap.set(
  "n",
  "<leader>fd",
  "<cmd>Lspsaga show_buf_diagnostics<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Search through diagnostics for current buffer using Telescope"
  }
)
--#endregion
--#region Automatically center cursor when going half page up down
keymap.set(
  "n",
  "<C-i>",
  "<C-d>zz",
  {
    noremap = true,
    silent = true,
    desc = "Go down half page and center"
  }
)
keymap.set(
  "n",
  "<C-u>",
  "<C-u>zz",
  {
    noremap = true,
    silent = true,
    desc = "Go up half page and center"
  }
)
--#endregion
--#region Toggle Transparent
keymap.set(
  "n",
  "<leader>ttt",
  "<cmd>TransparentToggle<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Toggle transparent background"
  }
)
--#endregion
--#region Dismiss all elements of noice (notifications included)
keymap.set(
  "n",
  "<leader>nn",
  "<cmd>NoiceDismiss<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Dismiss all elements of noice and notifications"
  }
)
--#endregion
--#region Sort selection
keymap.set(
  "v",
  "<leader>ss",
  "<cmd>sort<cr>",
  {
    noremap = true,
    silent = true,
    desc = "Sort selection"
  }
)
--#endregion
--#region Select current line
keymap.set(
  "n",
  "<leader>vv",
  "0v$",
  {
    noremap = true,
    silent = true,
    desc = "Select current line"
  }
)
--#endregion
-- Keymaps from lua
--#region Overriding defaults of VIM
-- Do not yank with x
keymap.set('n', 'x', '"_x')
-- Remove highlight search on escape
vim.keymap.set(
  { "i", "n" },
  "<esc>",
  "<cmd>noh<cr><esc>",
  {
    desc = "Escape and clear hlsearch"
  }
)
--#endregion
--#region LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(_)
    vim.api.nvim_create_user_command('LspFormat', function()
      vim.lsp.buf.format()
    end, { desc = 'Format buffer with language server' })

    -- LSP actions
    -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
    vim.keymap.set(
      'n',
      'gK',
      '<cmd>Lspsaga hover_doc<cr>',
      {
        desc = "Hover Documentation"
      }
    )
    -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    vim.keymap.set(
      'n',
      'gd',
      '<cmd>Lspsaga goto_definition<cr>',
      {
        desc = "Go to definition"
      }
    )
    vim.keymap.set(
      'n',
      'gD',
      '<cmd>lua vim.lsp.buf.declaration()<cr>',
      {
        desc = "Go to declaration"
      }
    )
    vim.keymap.set(
      'n',
      'gi',
      '<cmd>lua vim.lsp.buf.implementation()<cr>',
      {
        desc = "Show implementations"
      }
    )
    -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    vim.keymap.set(
      'n',
      'go',
      '<cmd>Lspsaga goto_type_definition<cr>',
      {
        desc = "Go to type definition"
      }
    )
    vim.keymap.set(
      'n',
      'gO',
      '<cmd>Lspsaga peek_type_definition<cr>',
      {
        desc = "Peek type definition"
      }
    )
    -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    vim.keymap.set(
      'n',
      'gr',
      '<cmd>Telescope lsp_references<cr>',
      {
        desc = "Show References from LSP"
      }
    )
    vim.keymap.set(
      'n',
      'gs',
      '<cmd>lua vim.lsp.buf.signature_help()<cr>',
      {
        desc = "Show signature help"
      }
    )
    -- vim.keymap.set('n', 'gs', '<cmd>Lspsaga signature_help<cr>')
    -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    vim.keymap.set(
      'n',
      '<F2>',
      '<cmd>Lspsaga rename<cr>',
      {
        desc = "Rename through LSP"
      }
    )
    vim.keymap.set(
      {'n', 'x'},
      '<F3>',
      '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
      {
        desc = "Format code using LSP"
      }
    )
    -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    -- vim.keymap.set('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    vim.keymap.set(
      'n',
      '<F4>',
      '<cmd>Lspsaga code_action<cr>',
      {
        desc = "Show code actions"
      }
    )
    vim.keymap.set(
      'x',
      '<F4>',
      '<cmd>Lspsaga range_code_action<cr>',
      {
        desc = "Show code actions on range"
      }
    )

    -- Diagnostics
    -- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    -- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    -- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    vim.keymap.set(
      'n',
      'gl',
      '<cmd>Lspsaga show_line_diagnostics<cr>',
      {
        desc = "Show line diagnostics"
      }
    )
    vim.keymap.set(
      'n',
      '[d',
      '<cmd>Lspsaga diagnostic_jump_prev<cr>',
      {
        desc = "Go to previous diagnostic"
      }
    )
    vim.keymap.set(
      'n',
      ']d',
      '<cmd>Lspsaga diagnostic_jump_next<cr>',
      {
        desc = "Go to next diagnostic"
      }
    )
  end
})
--#endregion
--#region Additional Keybinds
vim.keymap.set(
  'n',
  '<C-s>',
  '<cmd>w<cr>',
  {
    desc = "Save file"
  }
)
--#endregion
--#region Terminal
vim.keymap.set(
  't',
  '<C-x>',
  vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
  { desc = "Exit terminal mode" }
)
--#endregion
--#region Replace
-- Replace all occurences of selection
vim.keymap.set(
  'v',
  '<leader>rs',
  "\"hy:%s/<C-r>h//g<left><left>",
  { desc = "Replace all occurences" }
)
--#endregion
--#region Move line
vim.keymap.set(
  'v',
  '<S-j>',
  ':MoveBlock(1)<CR>',
  { silent = true, noremap = true, desc = "Move block downwards" }
)
vim.keymap.set(
  'v',
  '<S-k>',
  ':MoveBlock(-1)<CR>',
  { silent = true, noremap = true, desc = "Move block upwards" }
)
vim.keymap.set(
  'v',
  '<S-h>',
  ':MoveHBlock(-1)<CR>',
  { silent = true, noremap = true, desc = "Move block left" }
)
vim.keymap.set(
  'v',
  '<S-l>',
  ':MoveHBlock(1)<CR>',
  { silent = true, noremap = true, desc = "Move block right" }
)

vim.keymap.set(
  'v',
  '<S-Down>',
  ':MoveBlock(1)<CR>',
  { silent = true, noremap = true, desc = "Move block downwards" }
)
vim.keymap.set(
  'v',
  '<S-Up>',
  ':MoveBlock(-1)<CR>',
  { silent = true, noremap = true, desc = "Move block upwards" }
)
vim.keymap.set(
  'v',
  '<S-Left>',
  ':MoveHBlock(-1)<CR>',
  { silent = true, noremap = true, desc = "Move block left" }
)
vim.keymap.set(
  'v',
  '<S-Right>',
  ':MoveHBlock(1)<CR>',
  { silent = true, noremap = true, desc = "Move block right" }
)
--#endregion
--#region Noice Signature Help Scroll And CMP signature scroll
vim.keymap.set({ "n", "i", "s" }, "<A-Down>", function()
  if not require("noice.lsp").scroll(4) then
    require("cmp").mapping.scroll_docs(4)(function()
      return "<A-Down>"
    end)
    -- if not require("cmp").mapping.scroll_docs(4) then
    --   return "<A-Down>"
    -- end
  end
end, { silent = true, expr = true, desc = "Scroll down documentation" })

vim.keymap.set({ "n", "i", "s" }, "<A-Up>", function()
  if not require("noice.lsp").scroll(-4) then
    require("cmp").mapping.scroll_docs(-4)(function()
      return "<A-Up>"
    end)
    -- if not require("cmp").mapping.scroll_docs(-4) then
    --   return "<A-Up>"
    -- end
  end
end, { silent = true, expr = true, desc = "Scroll up documentation" })
--#endregion
