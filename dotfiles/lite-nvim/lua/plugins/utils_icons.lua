return {
  -- Emoji in Vim
  -- - https://www.webfx.com/tools/emoji-cheat-sheet/
  -- - Functions:
  -- - - emoji#for(name[, default = '', pad = 1]) - Get Emoji based on name
  -- - - emoji#list() - List all emoji
  -- - - emoji#complete(findstart, base) - Complete emoji
  -- - - %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g - Replace all emoji codes into emojis
  {
    'junegunn/vim-emoji',
    priority = vim.g.patconfig_highest_base_priority - 520,
  },
  -- Adds file type icons to Vim plugins
  {
    'ryanoasis/vim-devicons',
    priority = vim.g.patconfig_highest_base_priority - 520,
  },
}
