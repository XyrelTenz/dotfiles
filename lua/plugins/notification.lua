return {
  "rcarriga/nvim-notify",
  opts = {
    stages = "fade_in_slide_out",
    timeout = 3000,
    background_colour = "#000000",
    render = "default",
    on_open = function(win)
      local buf = vim.api.nvim_win_get_buf(win)
      vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
      vim.api.nvim_set_option_value("winblend", 20, { win = win })
    end,
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
  end,
}
