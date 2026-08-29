return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    win_options = {
      winbar = "%{v:lua.require('oil').get_current_dir()}",
    },
    view_options = {
      show_hidden = true,
    },
  },
  lazy = false,
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "File Explorer: Open parent directory" }
  },
}
