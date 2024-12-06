return {
    -- WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.
    {
        "folke/which-key.nvim",
        priority = vim.g.patconfig_highest_base_priority - 220,
        opts = {
            -- preset = "classic",
            preset = "modern",
            -- preset = "helix",
            plugins = {
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            win = {
                -- NEVER ENABLE THIS, this is doesnt look or work good
                -- don't allow the popup to overlap with the cursor
                no_overlap = false,
                -- height = { min = 4, max = math.huge },
            },
        },
        config = function(_, opts)
            vim.o.timeout = true
            vim.o.timeoutlen = 300

            local wk = require("which-key")
            -- Setup Call
            wk.setup(opts)
            -- Override all presets
            wk.add({
                preset = true,
                mode = { "n", "x" },
                { "!", desc = "Filter through external program" },
                { "<", desc = "Indent left" },
                { ">", desc = "Indent right" },
                { "V", desc = "Visual Line Mode" },
                { "c", desc = "Change" },
                { "d", desc = "Delete" },
                { "gU", desc = "Uppercase" },
                { "gu", desc = "Lowercase" },
                { "g~", desc = "Toggle case" },
                { "r", desc = "Replace" },
                { "v", desc = "Visual Character Mode" },
                { "y", desc = "Yank (copy)" },
                { "zf", desc = "Create fold" },
                { "~", desc = "Toggle case" },
            })

            wk.add({
                mode = { "o", "x" },
                preset = true,
                { "$", desc = "End of line" },
                { "%", desc = "Matching character: '()', '{}', '[]'" },
                { "0", desc = "Start of line" },
                { "F", desc = "Move to previous char" },
                { "G", desc = "Last line" },
                { "T", desc = "Move before previous char" },
                { "^", desc = "Start of line (non-blank)" },
                { "b", desc = "Previous word" },
                { "e", desc = "Next end of word" },
                { "f", desc = "Move to next char" },
                { "ge", desc = "Previous end of word" },
                { "gg", desc = "First line" },
                { "h", desc = "Left" },
                { "j", desc = "Down" },
                { "k", desc = "Up" },
                { "l", desc = "Right" },
                { "t", desc = "Move before next char" },
                { "w", desc = "Next word" },
                { "{", desc = "Previous empty line" },
                { "}", desc = "Next empty line" },
            })

            wk.add({
                mode = { "o", "x" },
                preset = true,
                { "a", group = "around" },
                { 'a"', desc = "double quoted string" },
                { "a'", desc = "single quoted string" },
                { "a(", desc = "same as ab" },
                { "a)", desc = "same as ab" },
                { "a<", desc = "a <> from '<' to the matching '>'" },
                { "a>", desc = "same as a<" },
                { "aB", desc = "a Block from [{ to ]} (with brackets)" },
                { "aW", desc = "a WORD (with white space)" },
                { "a[", desc = "a [] from '[' to the matching ']'" },
                { "a]", desc = "same as a[" },
                { "a`", desc = "string in backticks" },
                { "ab", desc = "a block from [( to ]) (with braces)" },
                { "ap", desc = "a paragraph (with white space) " },
                { "as", desc = "a sentence (with white space)" },
                { "at", desc = "a tag block (with white space)" },
                { "aw", desc = "a word (with white space)" },
                { "a{", desc = "same as aB" },
                { "a}", desc = "same as aB" },
                { "i", group = "inside" },
                { 'i"', desc = "double quoted string without the quotes" },
                { "i'", desc = "single quoted string without the quotes" },
                { "i(", desc = "same as ib" },
                { "i)", desc = "same as ib" },
                { "i<", desc = "inner <> from '<' to the matching '>'" },
                { "i>", desc = "same as i<" },
                { "iB", desc = "inner Block from [{ and ]}" },
                { "iW", desc = "inner WORD" },
                { "i[", desc = "inner [] from '[' to the matching ']'" },
                { "i]", desc = "same as i[" },
                { "i`", desc = "string in backticks without the backticks" },
                { "ib", desc = "inner block from [( to ])" },
                { "ip", desc = "inner paragraph" },
                { "is", desc = "inner sentence" },
                { "it", desc = "inner tag block" },
                { "iw", desc = "inner word" },
                { "i{", desc = "same as iB" },
                { "i}", desc = "same as iB" },
            })
            -- Override
            wk.add({
                mode = { "o", "x" },
                preset = true,
                -- Change defaults (removing same as x names)
                { "a(", desc = "a block from [( to ]) (with braces)" },
                { "a)", desc = "a block from [( to ]) (with braces)" },
                { "a>", desc = "a <> from '<' to the matching '>'" },
                { "a]", desc = "a [] from '[' to the matching ']'" },
                { "a}", desc = "a Block from [{ to ]} (with brackets)" },
                { "a{", desc = "a Block from [{ to ]} (with brackets)" },
                { "i(", desc = "inner block from [( to ])" },
                { "i)", desc = "inner block from [( to ])" },
                { "i>", desc = "inner <> from '<' to the matching '>'" },
                { "i]", desc = "inner [] from '[' to the matching ']'" },
                { "i}", desc = "inner Block from [{ and ]}" },
                { "i{", desc = "inner Block from [{ and ]}" },
                -- Mini.ai
                { "aB", desc = "Whole Buffer" },
                { "iB", desc = "Whole Buffer with trimmed empty lines" },
                { "aD", desc = "Diagnostic" },
                { "iD", desc = "Diagnostic" },
                { "aI", desc = "Around Indent scope" },
                { "iI", desc = "Inside Indent scope" },
                { "aL", desc = "Whole Line" },
                { "iL", desc = "Line after initial indent" },
                { "aN", desc = "Whole Number (-21.56)" },
                { "iN", desc = "Just Number (21)" },
                { "ao", desc = "Around Code Block" },
                { "io", desc = "Inside Code Block" },
                { "ac", desc = "Around Class" },
                { "ic", desc = "Inside Class" },
                { "ad", desc = "Around Conditional" },
                { "id", desc = "Inside Conditional" },
                { "al", desc = "Around Loop" },
                { "il", desc = "Inside Loop" },
                { "am", desc = "Around Comment" },
                { "im", desc = "Inside Comment" },
                { "ae", desc = "Word using case ([hello]world)" },
                { "ie", desc = "Word using case ([hello]world)" },
                { "aa", desc = "Around Argument" },
                { "ia", desc = "Inside Argument" },
                { "au", desc = "Around Function Call" },
                { "iu", desc = "Inside Function Call" },
                { "aU", desc = "Around Function Call (name without dot)" },
                { "iU", desc = "Inside Function Call (name without dot)" },
            })

            wk.add({
                preset = true,
                mode = { "n", "x" },
                { "<c-w>", group = "window" },
                { "<c-w>+", desc = "Increase height" },
                { "<c-w>-", desc = "Decrease height" },
                { "<c-w><", desc = "Decrease width" },
                { "<c-w>=", desc = "Equally high and wide" },
                { "<c-w>>", desc = "Increase width" },
                { "<c-w>T", desc = "Break out into a new tab" },
                { "<c-w>_", desc = "Max out the height" },
                { "<c-w>h", desc = "Go to the left window" },
                { "<c-w>j", desc = "Go to the down window" },
                { "<c-w>k", desc = "Go to the up window" },
                { "<c-w>l", desc = "Go to the right window" },
                { "<c-w>o", desc = "Close all other windows" },
                { "<c-w>q", desc = "Quit a window" },
                { "<c-w>s", desc = "Split window" },
                { "<c-w>v", desc = "Split window vertically" },
                { "<c-w>w", desc = "Switch windows" },
                { "<c-w>x", desc = "Swap current with next" },
                { "<c-w>|", desc = "Max out the width" },
            })

            wk.add({
                preset = true,
                { "z<CR>", desc = "Top this line, 1st non-blank col" },
                { "z=", desc = "Spelling suggestions" },
                { "zA", desc = "Toggle all folds under cursor" },
                { "zC", desc = "Close all folds under cursor" },
                { "zD", desc = "Delete all folds under cursor" },
                { "zE", desc = "Delete all folds in file" },
                { "zH", desc = "Half screen to the left" },
                { "zL", desc = "Half screen to the right" },
                { "zM", desc = "Close all folds" },
                { "zO", desc = "Open all folds under cursor" },
                { "zR", desc = "Open all folds" },
                { "za", desc = "Toggle fold under cursor" },
                { "zb", desc = "Bottom this line" },
                { "zc", desc = "Close fold under cursor" },
                { "zd", desc = "Delete fold under cursor" },
                { "ze", desc = "Right this line" },
                { "zg", desc = "Add word to spell list" },
                { "zi", desc = "Toggle folding" },
                { "zm", desc = "Fold more" },
                { "zo", desc = "Open fold under cursor" },
                { "zr", desc = "Fold less" },
                { "zs", desc = "Left this line" },
                { "zt", desc = "Top this line" },
                { "zv", desc = "Show cursor line" },
                { "zw", desc = "Mark word as bad/misspelling" },
                { "zx", desc = "Update folds" },
                { "zz", desc = "Center this line" },
            })

            wk.add({
                preset = true,
                { "H", desc = "Home line of window (top)" },
                { "L", desc = "Last line of window" },
                { "M", desc = "Middle line of window" },
                { "[%", desc = "Previous unmatched group" },
                { "[(", desc = "Previous (" },
                { "[<", desc = "Previous <" },
                { "[M", desc = "Previous method end" },
                { "[m", desc = "Previous method start" },
                { "[s", desc = "Previous misspelled word" },
                { "[{", desc = "Previous {" },
                { "]%", desc = "Next unmatched group" },
                { "](", desc = "Next (" },
                { "]<", desc = "Next <" },
                { "]M", desc = "Next method end" },
                { "]m", desc = "Next method start" },
                { "]s", desc = "Next misspelled word" },
                { "]{", desc = "Next {" },
            })

            wk.add({
                preset = true,
                { "g%", desc = "Cycle backwards through results" },
                { "gN", desc = "Search backwards and select" },
                { "gT", desc = "Go to previous tab page" },
                { "gf", desc = "Go to file under cursor" },
                { "gi", desc = "Move to the last insertion and INSERT" },
                { "gn", desc = "Search forwards and select" },
                { "gt", desc = "Go to next tab page" },
                { "gv", desc = "Switch to VISUAL using last selection" },
                { "gx", desc = "Open the file under cursor with system app" },
            })
            -- Normal Mode mappings
            wk.add({
                { "<C-d>", group = "Multicursor" },
                { "<leader>", group = "<leader>" },
                { "<leader><leader>", group = "<leader>" },
                { "<leader><tab>", group = "Tabs" },
                { "<leader>L", group = "Lazy" },
                { "<leader>b", group = "Buffer" },
                { "<leader>c", group = "Code" },
                { "<leader>d", group = "Debug/Dismiss/Delete" },
                { "<leader>f", group = "Find/Fix" },
                { "<leader>fC", group = "Find in Neovim Config" },
                { "<leader>fg", group = "Find in Projects" },
                { "<leader>g", group = "Go To" },
                { "<leader>h", group = "Harpoon" },
                { "<leader>hj", group = "Harpoon jump to mark" },
                { "<leader>i", group = "Insert" },
                { "<leader>l", group = "LSP" },
                { "<leader>ld", group = "LSP Document" },
                { "<leader>li", group = "LSP Incoming" },
                { "<leader>lo", group = "LSP Outgoing" },
                { "<leader>lt", group = "LSP Type" },
                { "<leader>lw", group = "LSP Workspace" },
                { "<leader>n", group = "Neorg/Notifications" },
                { "<leader>o", group = "Open" },
                { "<leader>p", group = "Peek" },
                { "<leader>q", group = "Quickfix list" },
                { "<leader>r", group = "Refactor" },
                { "<leader>s", group = "Scratch/Search/Swap/Sort" },
                { "<leader>t", group = "Toggle" },
                { "<leader>tt", group = "Toggle Trouble/Transparent" },
                { "<leader>u", group = "Undo" },
                { "<leader>v", group = "Visual" },
                { "<leader>w", group = "Wezterm/Window" },
                { "[", group = "Go to previous" },
                { "]", group = "Go to next" },
                { "g", group = "Go to" },
                { "g?", group = "Debug Print" },
                { "gr", group = "LSP" },
                { "grp", group = "Peek" },
                { "s", group = "Surround" },
                { "z", group = "Fold / Scroll" },
                { "ZZ", desc = "Save and quit" },
                { "ZQ", desc = "Quit" },
            })
            -- Operator mode mappings
            wk.add({
                mode = { "o" },
                { "<leader>", group = "<leader>" },
                { "[", group = "To previous" },
                { "]", group = "To next" },
                { "g", group = "To" },
            })
            -- Visual / Select mode mappings
            wk.add({
                mode = { "v" },
                { "<leader>", group = "<leader>" },
                { "<leader>r", group = "Replace/Refactor" },
                { "[", group = "Visually select to previous" },
                { "]", group = "Visually select to next" },
                { "g", group = "Visually select to" },
                { "s", group = "Surround" },
            })
            -- Replace mode mappings
            -- wk.add({
            --     mode = { "R" },
            --     { "<leader>", group = "<leader>" },
            --     { "[", group = "Visually select to previous" },
            --     { "]", group = "Visually select to next" },
            --     { "g", group = "Visually select to" },
            --     { "s", group = "Surround" },
            --     { "y", group = "Copy" },
            -- })
        end,
    },
}