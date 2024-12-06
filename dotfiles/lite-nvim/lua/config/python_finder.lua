-- Python Path Workaround properly written
if vim.fn.executable('python3') then
  if vim.g.is_win then
    vim.g.python3_host_prog = vim.fn.substitute(vim.fn.exepath("python"), ".exe$", '', 'g')
  else
    vim.g.python3_host_prog = vim.fn.exepath("python3")
  end
else
  vim.api.nvim_err_writeln("Python3 executable not found! You must install Python3 and set its PATH correctly!")
  return
end