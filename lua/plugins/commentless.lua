return {
  "soemre/commentless.nvim",
  cmd = "Commentless",
  keys = {
    {
      "<leader>/",
      function()
        require("commentless").toggle()
      end,
      desc = "Toggle Comments",
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- Customize Configuration
  },
}
