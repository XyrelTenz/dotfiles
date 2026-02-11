---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "svelte",
      "html",
      "css",
      "javascript",
      "typescript",
    },
    highlight = {
      enable = true,
      disable = { "prisma" },
    },
  },
}
