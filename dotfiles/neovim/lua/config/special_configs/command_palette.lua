-- stylua: ignore
-- Telescope
table.insert(
    require("command_palette").CpMenu,
    {
        "Telescope",
        { "Notifications", ":Telescope notify" },
        { "Help Tags", ":Telescope help_tags" },
        { "File Browser", ":Telescope file_browser" },
        { "Environment", ":Telescope env" },
        { "Glyphs", ":Telescope glyph" },
        { "Emoji", ":Telescope emoji" },
        { "Project", ":Telescope projects" },
        { "Undo", ":Telescope undo" },
        { "Git Branches", ":Telescope git_branches" },
        { "Git Status", ":Telescope git_status" },
        { "Git Stash", ":Telescope git_stash" },
        { "Git Files", ":Telescope git_files" },
        { "Git Commits", ":Telescope git_commits" },
        { "Git Commits for current buffer", ":Telescope git_bcommits" },
        { "AutoCommands", ":Telescope autocommands" },
        { "Quick Fix History", ":Telescope quickfixhistory" },
        { "Command History", ":Telescope command_history" },
        { "Search History", ":Telescope search_history" },
        { "Vim Options", ":Telescope vim_options" },
        { "Vim Registers", ":Telescope registers" },
        { "Tags", ":Telescope tags" },
        { "Man Pages", ":Telescope man_pages" },
        { "Spell Suggestions", ":Telescope spell_suggest" },
        { "Jump List", ":Telescope jumplist" },
        { "Diagnostics", ":Telescope diagnostics" },
        { "Highlights", ":Telescope highlights" },
        { "Keymaps", ":Telescope keymaps" },
        { "Tree Sitter", ":Telescope treesitter" },
        { "Buffers", ":Telescope buffers" },
        { "Commands", ":Telescope commands" },
        { "Find Files", ":Telescope find_files" },
        { "Quick Fix", ":Telescope quickfix" },
        { "Package Info", ":Telescope package_info" },
        { "Grep String", ":Telescope grep_string" },
        { "Live Grep", ":Telescope live_grep" },
        { "Filetypes", ":Telescope filetypes" },
        { "Find in current buffer", ":Telescope current_buffer_fuzzy_find" },
        { "Find tags in current buffer", ":Telescope current_buffer_tags" },
        { "LSP References", ":Telescope lsp_references" },
        { "LSP Incomming Calls", ":Telescope lsp_incoming_calls" },
        { "LSP Outgoing Calls", ":Telescope lsp_outgoing_calls" },
        { "LSP Document Symbols", ":Telescope lsp_document_symbols" },
        { "LSP Workspace Symbols", ":Telescope lsp_workspace_symbols" },
        { "LSP Dynamic Workspace Symbols", ":Telescope lsp_dynamic_workspace_symbols" },
        { "LSP Implementations", ":Telescope lsp_implementations" },
        { "LSP Definitions", ":Telescope lsp_definitions" },
        { "LSP Type Definitions", ":Telescope lsp_type_definitions" },
        { "Telescope Builtins", ":Telescope builtin" },
        { "Dap Commands", ":Telescope dap commands" },
        { "Dap Configurations", ":Telescope dap configurations" },
        { "Dap Breakpoints", ":Telescope dap list_breakpoints" },
        { "Dap Variables", ":Telescope dap variables" },
        { "Dap Frames", ":Telescope dap frames" },
        { "Symbols", ":Telescope symbols" },
        { "Frecency", ":Telescope frecency" },
        { "Headings", ":Telescope headings" },
        { "Templates", ":Telescope find_template" },
        { "Insert Template in Current Buffer", ":Telescope find_template type=insert" },
        { "Scope Buffers", ":Telescope scope buffers" },
    }
)
-- LSP Saga
table.insert(
    require("command_palette").CpMenu,
    {
        "LSP Saga",
        { "Rename in Project", ":Lspsaga rename ++project" },
        { "Code Action", ":Lspsaga code_action" },
        { "Range Code Action", ":Lspsaga range_code_action" },
        { "Hover Documentation", ":Lspsaga hover_doc" },
        { "Diagnostic Jump to Next", ":Lspsaga diagnostic_jump_next" },
        { "Diagnostic Jump to Previous", ":Lspsaga diagnostic_jump_prev" },
        { "LSP Finder", ":Lspsaga lsp_finder" },
        { "Signature Help", ":Lspsaga signature_help" },
        { "Preview Definition", ":Lspsaga preview_definition" },
        { "Peek Definition", ":Lspsaga peek_definition" },
        { "Go To Definition", ":Lspsaga goto_definition" },
        { "Show line diagnostics", ":Lspsaga show_line_diagnostics" },
        { "Show cursor diagnostics", ":Lspsaga show_cursor_diagnostics" },
        { "Show buf diagnostics", ":Lspsaga show_buf_diagnostics" },
        { "Show outline", ":Lspsaga outline" },
        { "Incomming Calls", ":Lspsaga incomming_calls" },
        { "Outcomming Calls", ":Lspsaga outgoing_calls" },
    }
)
-- File
table.insert(
    require("command_palette").CpMenu,
    {
        "File",
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
        { "save current file (C-s)", ":w" },
        { "save all files (C-A-s)", ":wa" },
        { "quit (C-q)", ":qa" },
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
        { "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
    }
)
-- Help
table.insert(
    require("command_palette").CpMenu,
    {
        "Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
    }
)
-- Vim
table.insert(
    require("command_palette").CpMenu,
    {
        "Vim",
        { "reload vimrc", ":source $MYVIMRC" },
        { "check health", ":checkhealth" },
        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
        { "paste mode", ":set paste!" },
        { "cursor line", ":set cursorline!" },
        { "cursor column", ":set cursorcolumn!" },
        { "spell checker", ":set spell!" },
        { "relative number", ":set relativenumber!" },
        { "search highlighting (F12)", ":set hlsearch!" },
        { "options", ":options" },
    }
)
-- Dap
table.insert(
    require("command_palette").CpMenu,
    {
        "Dap",
        { "pause", ":lua require'dap'.pause()" },
        { "step into", ":lua require'dap'.step_into()" },
        { "step back", ":lua require'dap'.step_back()" },
        { "step over", ":lua require'dap'.step_over()" },
        { "step out", ":lua require'dap'.step_out()" },
        { "frames", ":lua require'telescope'.extensions.dap.frames{}" },
        { "current scopes", ':lua ViewCurrentScopes(); vim.cmd("wincmd w|vertical resize 40")' },
        { "current scopes floating window", ":lua ViewCurrentScopesFloatingWindow()" },
        { "current value floating window", ":lua ViewCurrentValueFloatingWindow()" },
        { "commands", ":lua require'telescope'.extensions.dap.commands{}" },
        { "configurations", ":lua require'telescope'.extensions.dap.configurations{}" },
        { "repl", ":lua require'dap'.repl.open(); vim.cmd(\"wincmd w|resize 12\")" },
        { "close", ":lua require'dap'.close(); require'dap'.repl.close()" },
        { "run to cursor", ":lua require'dap'.run_to_cursor()" },
        { "continue", ":lua require'dap'.continue()" },
        { "clear breakpoints", ":lua require('dap.breakpoints').clear()" },
        { "breakpoints", ":lua require'telescope'.extensions.dap.list_breakpoints{}" },
        { "toggle breakpoint", ":lua require'dap'.toggle_breakpoint()" },
        { "Dap Commands", ":Telescope dap commands" },
        { "Dap Configurations", ":Telescope dap configurations" },
        { "Dap Breakpoints", ":Telescope dap list_breakpoints" },
        { "Dap Variables", ":Telescope dap variables" },
        { "Dap Frames", ":Telescope dap frames" },
    }
)
-- File
table.insert(
    require("command_palette").CpMenu,
    {
        "File Line Endings",
        { "UNIX Format", ":set ff=unix" },
        { "DOS Format", ":set ff=dos" },
        { "Mac Format", ":set ff=mac" },
    }
)
-- Special Plugin Stuff
table.insert(
    require("command_palette").CpMenu,
    {
        "Plugins Settings",
        { "Edit Trusted Configs", ":exe 'edit' stdpath('data').'/config-local'" },
        { "Markdown Preview", ":MarkdownPreview" },
        { "Markdown Preview Stop", ":MarkdownPreviewStop" },
        { "Document Diagnostics (Trouble)", ":TroubleToggle document_diagnostics" },
        { "Workspace Diagnostics (Trouble)", ":TroubleToggle workspace_diagnostics" },
        { "Location List (Trouble)", ":TroubleToggle loclist" },
        { "Quickfix List (Trouble)", ":TroubleToggle quickfix" },
        { "ToDo List", ":TodoTelescope" },
    }
)
-- My Own kinda Plugins
table.insert(require("command_palette").CpMenu, {
    "Patryk Utilities",
    { "Show Digraph Prompt", ":lua digraph_prompt()" },
    { "Detect FileType", ":filetype detect" },
    -- This to not be with .git and .hg file you need ripgrep
    {
        "Open File in NeoVim Config",
        ":lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config'),prompt_prefix='💻 ',prompt_title='NeoVim Config Files'})",
    },
    { "Format Go File", ":PatGoFormat" },
    { "Format File with LSP", ":lua vim.lsp.buf.format()" },
})
-- Scretch
table.insert(
    require("command_palette").CpMenu,
    {
        "Scratch Files",
        { "New Scratch File", ':lua require("scretch").new()' },
        { "New Named Scratch File", ':lua require("scretch").new_named()' },
        { "Last Scratch File", ':lua require("scretch").last()' },
        { "Search Scratch Files", ':lua require("scretch").search()' },
        { "Explore Scratch File", ':lua require("scretch").explore()' },
    }
)
-- Neorg
table.insert(
    require("command_palette").CpMenu,
    {
        "Neorg",
        { "Neorg Workspace", ":Neorg workspace" },
        { "Neorg Workspace: Notes", ":Neorg workspace notes" },
        { "Neorg Workspace: TODO", ":Neorg workspace todo" },
        { "Neorg Index", ":Neorg index" },
        { "Generate Workspace Summary in file", ":Neorg generate-workspace-summary" },
        { "Toggle Concealer", ":Neorg toggle-concealer" },
        { "Fuzzy Searching Any Linkable", ":Telescope neorg find_linkable" },
        { "Automatic File Link Insertion", ":Telescope neorg insert_file_link" },
        { "Fuzzy Searching Headings", ":Telescope neorg search_headings" },
        { "Open Journal: Today", ":Neorg journal today" },
        { "Open Journal: Yesterday", ":Neorg journal yesterday" },
        { "Open Journal: Tomorrow", ":Neorg journal tomorrow" },
        { "Open Journal: Open TOC", ":Neorg journal toc open" },
        { "Open Journal: Update TOC", ":Neorg journal toc update" },
    }
)
-- OverSeer
table.insert(
    require("command_palette").CpMenu,
    { "Overseer - Build System", { "Run Task", ":OverseerRun" }, { "Toggle Output", ":OverseerToggle" } }
)
-- Commands
table.insert(
    require("command_palette").CpMenu,
    {
        "Commands",
        { "Run Go Tests using gotestsum", ':TermExec cmd="gotestsum --watch  -- -v -count=1 ./..."' },
        { "Run Go Tests", ':TermExec cmd="go test -v -count=1 ./..."' },
        { "Run Jest Tests", ':TermExec cmd="jest"' },
    }
)
