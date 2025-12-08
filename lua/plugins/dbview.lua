return {
  "Spelis/nvim-dbview",
  lazy = true,
  keys = {
    {
      "<leader>db",
      "<cmd>DBVIEW<cr>",
      desc = "Open Database Viewer",
    },
    cmd = {
      "DBView",
    },
    opts = {
      python_path = "python3",
      exec_key + "<C-x>",
    },
  },
}
