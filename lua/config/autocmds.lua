vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.server_capabilities.colorProvider then
      require("vim.lsp.document_color").buf_attach(args.buf)
    end
  end,
})
