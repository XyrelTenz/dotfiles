return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_contrast = true -- Make sidebars (nvim-tree) have a darker background
    vim.g.nord_borders = false -- Enable/disable borders between splits
    vim.g.nord_disable_background = false -- Set to TRUE if you want WezTerm/Acrylic blur
    vim.g.nord_italic = false -- Enable italics
    vim.g.nord_bold = false -- Enable bold text
  end,
}
