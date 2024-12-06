return {
  -- ===== Git =====
  -- A Git wrapper so awesome, it should be illegal
  -- - Commands:
  -- - - :Git add | :Git commit | :Git diff | :Git log | :Git blame
  {
    'tpope/vim-fugitive',
    priority = vim.g.patconfig_highest_base_priority - 50,
  },
}
