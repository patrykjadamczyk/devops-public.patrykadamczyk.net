---@diagnostic disable-next-line: lowercase-global
function has(item)
  return vim.fn.has(item) == 1
end
vim.g.is_win = (has("win32") or has("win64")) and true or false
vim.g.is_linux = (has("unix") and (not has("macunix"))) and true or false
vim.g.is_mac  = has("macunix") and true or false
vim.g.nvimrc = vim.fn.stdpath("config")