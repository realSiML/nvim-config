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
        "html",
        "emmet_language_server",
        "cssls",
        "ts_ls",
        "tailwindcss",
        "svelte",
        "ty",
        "ruff",
        "gopls",
        "ols",
        "marksman",
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "biome",
      },
    })
  end,
}
