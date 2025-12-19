require("core")
require("config.colorscheme").setup()
require("nvim-ts-autotag").setup()
require("plugins.move")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})
