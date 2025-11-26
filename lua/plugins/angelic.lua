return {
  "sponkurtus2/angelic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("angelic").setup({})
    vim.cmd.colorscheme("angelic")
  end,
}
