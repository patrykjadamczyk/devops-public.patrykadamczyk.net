-- ================= Syntax Highlighting =================

-- NOTE: This could be moved to ftdetect plugin

-- Make array of file extensions to filetype mappings
local SyntaxHighlightOverride = {
    { { "*.md" }, "markdown" },
    { { "*.{jscs,jshint,eslint}rc" }, "json" },
    { { "gitconfig.local" }, "gitconfig" },
    { { "tmux.conf.local" }, "tmux" },
    { { "vimrc.local" }, "vim" },
    { { "*.plist" }, "xml" },
    { { "vlang", "*.v", "*.vsh", "*.vv", "v.mod" }, "vlang" }, -- Force these files to vlang for treesitter syntax to work
    -- Force Reload filetype for lazy loaded file type plugins
    { { "nim", "*.nim", "*.nims", "nim.cfg", "*.nim.cfg", "*.nimble" }, "nim" },
    { { "csv", "*.csv", "*.dat" }, "csv" },
    { { "log", "*.log" }, "log" },
    {
        {
            "*/log/{auth,cron,daemon,debug,kern,lpr,mail,messages,news/news,syslog,user}{,.log,.err,.info,.warn,.crit,.notice}{,.[0-9]*,-[0-9]*}",
        },
        "messages",
    },
    { { "hurl", "*.hurl" }, "hurl" },
    -- Force languages that are not detected
    -- XAML files (WPF etc)
    { { "xaml", "*.xaml" }, "xml" },
    -- Avalonia XAML files
    { { "axaml", "*.axaml" }, "xml" },
    -- HTTP files
    { { "http", "*.http" }, "http" },
    { { "graphql", "*.graphql" }, "graphql" },
}

-- Create autocommand that overrides filetypes based on extension
local SyntaxHighlightOverrideGroup = vim.api.nvim_create_augroup("SyntaxHighlightOverride", { clear = true })

for _, value in pairs(SyntaxHighlightOverride) do
    local patterns = value[1]
    local filetype = value[2]
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = patterns,
        group = SyntaxHighlightOverrideGroup,
        command = "set filetype=" .. filetype,
    })
end
