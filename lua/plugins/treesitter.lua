return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "svelte",
      "html",
      "css",
      "javascript",
      "typescript",
      "kotlin",
      "kt",
      "java",
    },
    highlight = {
      enable = true,
      -- disable = { "prisma" },
      additional_vim_regex_highlighting = false,
    },
  },
}
