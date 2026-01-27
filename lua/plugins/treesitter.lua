return {
  "nvim-treesitter/nvim-treesitter",
  highlight = {
    enable = true,
  },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  opts = {
    highlight = {
      enable = true,
      disable = { "prisma" },
    },
    autotag = {
      enable = true,
    },
  },
}
