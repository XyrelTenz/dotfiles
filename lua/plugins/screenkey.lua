return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  config = function()
    require("screenkey").setup({
      -- win_opts = { row = 2, col = 2 },
    })

    vim.schedule(function()
      vim.cmd("Screenkey")
    end)
  end,
}
