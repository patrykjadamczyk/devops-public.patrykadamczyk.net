-- Nushell
if vim.fn.executable("nu") == 1 and vim.g.patconfig_nushell == 1 then
    -- Shell options
    -- Sets the shell to use for system() and ! commands
    vim.opt.shell = "nu"
    vim.opt.shellcmdflag = "-c"
    vim.opt.shellquote = "'"
    vim.opt.shellxquote = ""
    vim.opt.shellpipe = "2>&1 | save --raw %s"
    vim.opt.shellredir = "2>&1 | save --raw %s"
end

-- PowerShell
if vim.fn.executable("pwsh") == 1 and vim.g.patconfig_powershell == 1 then
    -- Shell options
    -- Sets the shell to use for system() and ! commands
    vim.opt.shell = "pwsh"
    -- vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
    -- vim.opt.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command '
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command . $PROFILE;"
    vim.opt.shellxquote = ""
    vim.opt.shellquote = ""
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s"
    vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
end
