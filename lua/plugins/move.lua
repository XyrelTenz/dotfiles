return {
  "nvim-mini/mini.move",
  version = "*",
  config = function()
    require("mini.move").setup({
      mappings = {
        -- Move selection in Visual mode (e.g., Shift + j)
        down = "<S-j>",
        up = "<S-k>",
        left = "<S-h>",
        right = "<S-l>",

        -- Move lines in Normal/Visual mode (e.g., <Leader>j)
        line_right = "<Leader>l",
        line_left = "<Leader>h",
        line_down = "<Leader>j",
        line_up = "<Leader>k",
      },
      options = {
        reindent_linewise = true,
      },
    })
  end,
}
