return {
  -- ===== Git =====
  -- A git commit browser in Vim
  -- - Commands:
  -- - - :GV - Open GV
  -- - - :GV! - will only list commits that affected the current file
  -- - - :GV? - fills the location list with the revisions of the current file
  {
    'junegunn/gv.vim',
    priority = vim.g.patconfig_highest_base_priority - 60,
  },
}
