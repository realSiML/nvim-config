vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end
})


vim.opt_local.makeprg = "uv run %"
vim.opt_local.errorformat = '%*\\s##File "%f"\\, line %l\\, in %m,%*\\s##File "%f"\\, line %l'
