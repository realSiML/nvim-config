return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "nvim-telescope/telescope.nvim",
    "rachartier/tiny-code-action.nvim",
  },
  config = function()
    -- NOTE: LSP Custom Keybinds
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        -- Buffer local mappings
        local opts = { buffer = ev.buf, silent = true }

        -- Keymaps
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", require('tiny-code-action').code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "df", function() vim.diagnostic.open_float() end, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Show signature help"
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end,
    })

    -- NOTE: Diagnostic Setup
    -- Define sign icons for each severity
    local signs = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    }
    -- update diagnostic config function
    vim.diagnostic.config({
      severity_sort = true,
      signs = { text = signs },
      virtual_text = { severity_sort = true },
      underline = true,
      update_in_insert = false,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
      },
    })

    -- toggle for virtual text
    vim.keymap.set("n", "<leader>lx", function()
      local current = vim.diagnostic.config().virtual_text
      vim.diagnostic.config({ virtual_text = not current })
    end, { desc = "Toggle LSP virtual text" })

    -- NOTE: Setup servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

    vim.lsp.config('*', { capabilities = capabilities })

    -- Configure and enable LSP servers
    -- lua_ls
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim", "require" },
          },
          completion = {
            callSnippet = "Replace",
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
          telemetry = {
            enable = false,
          }
        },
      },
    })

    -- emmet_language_server
    -- vim.lsp.config("emmet_language_server", {
    --   filetypes = {
    --     "css",
    --     "html",
    --     "javascript",
    --     "javascriptreact",
    --     "less",
    --     "typescriptreact",
    --   },
    --   init_options = {
    --     includeLanguages = {},
    --     excludeLanguages = {},
    --     extensionsPath = {},
    --     preferences = {},
    --     showAbbreviationSuggestions = true,
    --     showExpandedAbbreviation = "always",
    --     showSuggestionsAsSnippets = false,
    --     syntaxProfiles = {},
    --     variables = {},
    --   },
    -- })

    -- emmet_ls
    -- vim.lsp.config("emmet_ls", {
    --   filetypes = {
    --     "html",
    --     "typescriptreact",
    --     "javascriptreact",
    --     "css",
    --     "sass",
    --     "scss",
    --     "less",
    --     "svelte",
    --   },
    -- })

    -- tsgo (Effect/TSGo Language Server)
    vim.lsp.config("tsgo", {
      cmd = { "tsgo", "--lsp", "-stdio" },
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      single_file_support = true,
      init_options = {
        preferences = {
          includeCompletionsForModuleExports = true,
          includeCompletionsForImportStatements = true,
        },
      },
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
          },
        },
        javascript = {
          validate = {
            enable = true,
          },
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
          },
        },
      },
    })

    -- gopls
    -- vim.lsp.config("gopls", {
    --   settings = {
    --     gopls = {
    --       analyses = {
    --         unusedparams = true,
    --       },
    --       staticcheck = true,
    --       gofumpt = true,
    --     },
    --   },
    -- })

    -- css
    -- vim.lsp.config("cssls", {
    --   filetypes = { "css", "scss", "less" },
    --   init_options = { provideFormatter = true },
    --   single_file_support = true,
    --   settings = {
    --     css = {
    --       lint = {
    --         unknownAtRules = "ignore",
    --       },
    --       validate = true
    --     },
    --     scss = {
    --       lint = {
    --         unknownAtRules = "ignore"
    --       },
    --       validate = true
    --     },
    --     less = {
    --       lint = {
    --         unknownAtRules = "ignore"
    --       },
    --       validate = true
    --     },
    --   },
    -- })

    -- tailwind
    -- vim.lsp.config("tailwindcss", {
    --   filetypes = {
    --     "html",
    --     "css",
    --     "javascript",
    --     "typescript",
    --     "javascriptreact",
    --     "typescriptreact",
    --     "svelte",
    --     "vue",
    --     "astro",
    --   },
    --   init_options = {
    --     userLanguages = {
    --       astro = "html",
    --     },
    --   },
    -- })

    -- astro
    -- vim.lsp.config("astro", {
    --   filetypes = { "astro" },
    --
    --   init_options = {
    --     typescript = {
    --       tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server/node_modules/typescript/lib"
    --     }
    --   },
    -- })

    -- Instead of using mason enable all configured LSP via `automatic_enable=true`
    -- Prefer more control by enable manual server call below via vim.lsp.enable("")
    -- mason config: lua/sethy/plugins/lsp/mason.lua:22
    vim.lsp.enable({
      "lua_ls",
      "marksman",
      "ruff",
      "ty",
      -- "cssls",
      -- "emmet_language_server",
      -- "emmet_ls",
      "tsgo",
      -- "gopls",
      -- "rust_analyzer",
      -- "astro",
      -- "tailwindcss",
    })
  end,
}
