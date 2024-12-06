function VimPrint(...)
    local toPrint = {}
    for _, arg in ipairs({ ... }) do
        table.insert(toPrint, vim.inspect(arg))
    end
    return print(unpack(toPrint))
end
function Dump(...)
    return VimPrint(...)
end
