return {
  "nvim-mini/mini.icons",
  version = false,
  config = function()
    local icons = require("mini.icons")
    icons.setup({
      directory = {
        ["directory"] = { hl = "MiniIconsCyan" },
      },
    })
    icons.mock_nvim_web_devicons()
  end,
}
