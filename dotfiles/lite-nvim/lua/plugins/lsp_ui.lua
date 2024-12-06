return {
  -- ===== LSP =====
  -- Standalone UI for nvim-lsp progress. Eye candy for the impatient.
  {
    'j-hui/fidget.nvim',
    priority = vim.g.patconfig_highest_base_priority - 110,
  },
  -- LSP Actions
  {
    "glepnir/lspsaga.nvim",
    priority = vim.g.patconfig_highest_base_priority - 110,
    event = "LspAttach",
    -- config = function()
    --   require("lspsaga").setup({
    --     ui = {
    --       kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    --     },
    --   })
    -- end,
  },
  -- LSP Lens
  {
    "VidocqH/lsp-lens.nvim",
    priority = vim.g.patconfig_highest_base_priority - 110,
    cond = function()
      return false
    end,
    opts = {
      enable = true,
      include_declaration = false,
      sections = {
        definition = true,
        references = true,
        implements = true,
      },
    },
  },
}
