return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        bold = true,
        italic = false,
        transparency = true,
      },
      highlight_groups = {
        CursorLineNr = { fg = "rose" },
      },
    },
  },
  {
    "vague-theme/vague.nvim",
    opts = {
      tranparent = false,
      bold = true,
      italic = false,
      on_highlights = function(hl, colors)
        hl.CursorLineNr = {
          fg = colors.delta,
          bold = true,
        }
      end
    },
  },
}
