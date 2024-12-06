return {
    -- Linters
    {
        "mfussenegger/nvim-lint",
        -- "patrykjadamczyk/nvim-lint",
        priority = vim.g.patconfig_highest_base_priority - 130,
        opts = {
            events = { "BufWritePost", "BufReadPost", "InsertLeave" },
        },
        config = function(_, opts)
            local M = {}

            local lint = require("lint")

            function M.debounce(ms, fn)
                local timer = vim.loop.new_timer()
                if timer == nil then
                    return
                end
                return function(...)
                    local argv = { ... }
                    timer:start(ms, 0, function()
                        timer:stop()
                        vim.schedule_wrap(fn)(unpack(argv))
                    end)
                end
            end

            function M.lint()
                local names = lint.linters_by_ft[vim.bo.filetype] or {}
                local ctx = { filename = vim.api.nvim_buf_get_name(0) }
                ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
                names = vim.tbl_filter(function(name)
                    local linter = lint.linters[name]
                    return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
                end, names)

                if #names > 0 then
                    lint.try_lint(names)
                end
            end

            vim.api.nvim_create_autocmd(opts.events, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = M.debounce(100, M.lint),
            })
            vim.keymap.set("n", "<leader>ll", function()
                vim.notify("Starting linting", vim.log.levels.INFO, { title = "nvim-lint" })
                M.debounce(100, M.lint)
            end, { desc = "Lint file" })
        end,
    },
}
