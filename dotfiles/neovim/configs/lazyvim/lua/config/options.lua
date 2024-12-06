-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
---@diagnostic disable-next-line: undefined-global
LazyVim.terminal.setup("nu")

-- LazyVim auto format
vim.g.autoformat = true

-- Ensure that signcolumn is always visible with 2 places for signs
-- This is for making sure that effect of jumping of ui will stop
vim.o.signcolumn = "yes:2"
