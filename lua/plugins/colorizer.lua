return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufRead", -- Load when you open a file
    opts = {
      user_default_options = {
        mode = "background", -- Recommended for Flutter/Dart
        names = false, -- Don't show color names
      },
      filetypes = { "*" }, -- Apply to all file types
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },
}
