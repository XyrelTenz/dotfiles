vim.g.depcration_warnings = false
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

--- Hide Line Numbers
vim.o.number = false
vim.o.relativenumber = false
--- Hide Vertical Split Line
vim.opt.fillchars:append({ vert = " " })
