return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  config = function()
    require("screenkey").setup({
      win_opts = {
        relative = "editor",
        anchor = "SE", -- Anchor the window's South-East corner...
        width = 25,
        height = 1,
        border = "rounded",
        row = vim.o.lines - vim.o.cmdheight - 1,
        col = vim.o.columns - 1,
      },
    })

    vim.schedule(function()
      vim.cmd("Screenkey")
    end)
  end,
}
