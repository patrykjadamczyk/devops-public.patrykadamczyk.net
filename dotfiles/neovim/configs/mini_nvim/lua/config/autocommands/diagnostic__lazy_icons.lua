-- Prefix Icons for Lazy progress diagnostics
---@alias LazyDiagnostic {row: number, severity: number, message:string}
vim.diagnostic.config({
    virtual_text = {
        ---@param diag LazyDiagnostic
        prefix = function(diag, _, _)
            if string.match(diag.message, "([ ]*)already up to date") ~= nil then
                return ""
            end
            if string.match(diag.message, "([ ]*)updated(.*)") ~= nil then
                return "ﮮ"
            end
            if string.match(diag.message, "([ ]*)updates available") ~= nil then
                return ""
            end
            if string.match(diag.message, "([ ]*)fetch(.*)") ~= nil then
                return ""
            end
            if string.match(diag.message, "([ ]*)status(.*)") ~= nil then
                return "󱖫"
            end
            if string.match(diag.message, "([ ]*)checkout(.*)") ~= nil then
                return ""
            end
            if string.match(diag.message, "([ ]*)log(.*)") ~= nil then
                return ""
            end
        end,
    },
}, vim.api.nvim_create_namespace("lazy"))
