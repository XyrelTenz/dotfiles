return {
  "xemptuous/sqlua.nvim",
  lazy = true,
  cmd = "SQLua",
  keys = {
    { "<leader>db", "<cmd>SQLua<cr>", desc = "Open SQLua" },
  },
  config = function()
    require("sqlua").setup({
      style = {
        title_icon = " ",
      },
    })
  end,
}
