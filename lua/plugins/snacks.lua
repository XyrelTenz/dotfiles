return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("snacks").setup({
      notifier = { enabled = true },
      words = { enabled = true },
      lazygit = {
        configure = false,
        win = {
          position = "float",
          width = 0.99,
          height = 0.99,
        },
      },
      terminal = {
        win = {
          position = "right",
          width = 0.5,
          wo = {
            winbar = "",
          },
        },
      },
      picker = {
        layout = {
          preset = "dropdown",
          layout = {
            width = 0.8,
            height = 0.8,
          },
        },
        win = {
          input = {
            border = "rounded",
          },
          list = {
            border = "rounded",
          },
          preview = {
            border = "rounded",
          },
        },
        formatters = {
          file = {
            filename_first = true,
          },
        },
        prompt = "   ",
      },
    })
  end,
}
