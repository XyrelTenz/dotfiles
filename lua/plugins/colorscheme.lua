return {
  "sainnhe/everforest",
  name = "everforest",
  priority = 1000, -- Make sure it loads first

  -- This init function will run *before* the colorscheme is loaded.
  -- This is where you set the style (dark, medium, soft, etc.)
  init = function()
    -- Set the background style. Options are:
    -- "hard", "medium", "soft"
    vim.g.everforest_background_style = "medium"

    -- You can also enable transparency (like you had for catppuccin)
    vim.g.everforest_transparent_background = 1 -- 1 = true, 0 = false

    -- To enable italics for comments, keywords, etc.
    vim.g.everforest_enable_italics = 1
  end,
}
