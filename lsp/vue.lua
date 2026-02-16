require("lspconfig").volar.setup({
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
})

require("lspconfig").ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/path/to/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})
