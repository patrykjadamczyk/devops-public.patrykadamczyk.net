--" ====================== Telescope ======================
--" Config
require('nvim-web-devicons').setup()

require('telescope').setup({
  extensions = {
    tele_tabby = {
      use_highlighter = true,
    },
    command_palette = {},
    frecency = {
      db_safe_mode = false,
      auto_validate = false,
    },
  }
})

require('telescope').load_extension('tele_tabby')

require("telescope").load_extension('emoji')

require('telescope').load_extension('glyph')

require('telescope').load_extension('command_palette')

require('telescope').load_extension('env')

require('telescope').load_extension('file_browser')

require('telescope').load_extension('find_pickers')

require("telescope").load_extension('undo')

require("telescope").load_extension('notify')

require('telescope').load_extension('projects')

require("telescope").load_extension('harpoon')

require("telescope").load_extension('heading')

require("telescope").load_extension('ui-select')

require("telescope").load_extension('frecency')
