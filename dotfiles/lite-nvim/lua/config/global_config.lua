-- Do not map stuff for Visual Multi
vim.g.VM_default_mappings = 0
-- Codium no keymaps
-- vim.g.codeium_no_map_tab = 1
-- vim.g.codeium_disable_bindings = 1

vim.g.patconfig_highest_base_priority = 3000
vim.g.patconfig_powershell = 1

-- PowerShell
if vim.fn.executable('pwsh') == 1 and vim.g.patconfig_powershell == 1 then
    -- Shell options
    -- Sets the shell to use for system() and ! commands
    vim.opt.shell = 'pwsh'
    -- vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
    -- vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command '
    vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command . $PROFILE;'
    vim.opt.shellxquote = ''
    vim.opt.shellquote = ''
    vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'
    vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s'
end
