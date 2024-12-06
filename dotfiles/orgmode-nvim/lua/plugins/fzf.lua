return {
  -- ===== Fuzzy Search File =====
  {
    'junegunn/fzf',
    priority = vim.g.patconfig_highest_base_priority - 10,
    dir = '~/.fzf',
    build = './install --all',
  },
  --Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() }}
  {
    'junegunn/fzf.vim',
    priority = vim.g.patconfig_highest_base_priority - 10,
  }
}
