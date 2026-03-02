return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = false,
      },
    },
  },
  config = function(_, opts)
    vim.g.skip_ts_context_commentstring_module = true
    require("mini.comment").setup(opts)
  end,
  opts = {
    options = {
      custom_commentstring = function()
        return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
      end,
    },
  },
}
