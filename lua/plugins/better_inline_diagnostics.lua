return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = "LspAttach",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "classic",
      options = {
        show_source = {
          enabled = true,
          if_many = true,
        },
        use_icons_from_diagnostic = true,
        override_open_float = true,
        show_diags_only_under_cursor = true,
      },
      signs = {
        arrow = "    ",
      },
    })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
