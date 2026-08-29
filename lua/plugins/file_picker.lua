return {
  "dmtrKovalenko/fff.nvim",
  build = function()
    -- downloads a prebuilt binary or falls back to cargo build
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    title = 'Find Files',
    prompt = '> ',
    prompt_vim_mode = true,
    preview = {
      line_numbers = true,
    },
  },
  lazy = false,
  keys = {
    {
      "<leader>ff",
      function()
        require("fff").find_files()
      end,
      desc = "File Picker: Find files",
    },
    {
      "<leader>fg",
      function()
        require('fff').live_grep({
          grep = {
            modes = { 'fuzzy', 'plain' }
          }
        })
      end,
      desc = 'File Picker: Live grep',
    },
  },
}
