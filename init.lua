vim.g.deprecation_warnings = false
-- vim.lsp.buf_get_clients = function(bufnr)
--   return vim.lsp.get_clients({ bufnr = bufnr or 0 })
-- end
require("core")
require("config.colorscheme").setup()
require("nvim-ts-autotag").setup()
require("plugins.move")

vim.filetype.add({
  extension = {
    svelte = "svelte",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

vim.api.nvim_create_user_command("Live", function()
  local cmd = "live-server ." -- or "five-server ."
  vim.fn.jobstart(cmd, {
    detach = true,
    on_exit = function()
      print("Server stopped")
    end,
  })
  print("Starting Live Server...")
end, {})
