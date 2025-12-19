if vim.fn.has("nvim-0.10") == 1 then
  vim.lsp.buf_get_clients = function(bufnr)
    return vim.lsp.get_clients({ bufnr = bufnr })
  end
end

local original_notify = vim.notify
vim.notify = function(msg, level, opts)
  -- If the message matches the warning we want to hide, return early
  if msg and msg:match("vim.validate is deprecated") then
    return
  end
  -- Otherwise, pass it to the real notification handler
  original_notify(msg, level, opts)
end

require("core.options")
require("core.autocmds")
require("core.utils")
require("core.lazy")
require("core.keymaps")
require("core.lsp")
