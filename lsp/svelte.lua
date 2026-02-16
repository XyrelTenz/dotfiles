--- @type vim.lsp.Config
return {
  -- Svelte-specific on_attach
  on_attach = function(client, bufnr)
    -- 1. Standard Keybindings (Copy these from your other config if you want them here too)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    -- 2. "The Fix": Force Svelte to reload when you edit .ts/.js files
    -- Without this, Svelte files won't realize you changed a helper function in a .ts file
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      group = vim.api.nvim_create_augroup("SvelteForceUpdate", { clear = true }),
      callback = function(ctx)
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
  end,

  -- Svelte capabilities (optional, but good if you use cmp)
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
}
