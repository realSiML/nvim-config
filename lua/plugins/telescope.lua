return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  keys = {
    {
      '<leader>fb',
      function() require('telescope.builtin').buffers() end,
      desc = 'Telescope buffers'
    },
    {
      '<leader>fh',
      function() require('telescope.builtin').help_tags() end,
      desc = 'Telescope help tags'
    },
    {
      '<leader>fr',
      function() require('telescope.builtin').oldfiles() end,
      desc = 'Telescope oldfiles'
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        },
      }
    })
    require("telescope").load_extension("ui-select")
  end
}
