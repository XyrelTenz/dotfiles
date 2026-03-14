vim.lsp.enable("kotlin_lsp")

vim.lsp.config("kotlin_lsp", {
  single_file_support = false,
})

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.kotlin_language_server.setup({
      -- cmd = { "/usr/bin/kotlin-lsp" },
      cmd = { "kotlin-lsp", "--stdio" },
      filetypes = { "kotlin", "kt", "kts" },
      root_dir = lspconfig.util.root_pattern(
        "settings.gradle",
        "settings.gradle.kts",
        "build.gradle",
        "build.gradle.kts",
        "pom.xml",
        ".git"
      ),
      settings = {},
    })
  end,
}
