return {
  "nvim-neo-tree/neo-tree.nvim",
  -- *** ADD THE DEPENDENCIES TABLE HERE ***
  dependencies = {
    "nvim-mini/mini.icons", -- **This ensures mini.icons loads BEFORE neo-tree**
    -- You may have other dependencies here like 'nvim-tree/nvim-web-devicons'
    -- but you should only need 'mini.icons' if you are using that plugin exclusively.
  },
  opts = {
    window = {
      position = "float",
      popup = {
        size = { height = "80%", width = "80%" },
        position = "50%",
        border = "none",
      },
    },
  },
}
