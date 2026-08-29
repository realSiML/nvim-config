return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "neovim/nvim-lspconfig",
  },
  lazy = false,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = {
        "lua_ls",
        "tsgo",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "emmet_language_server",
        "gopls",
        "marksman",
        "ols",
        "ruff",
        "ty",
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "biome",
        "prettier",
        "stylua",
      },
    })
  end,
}
