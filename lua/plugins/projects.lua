return {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  config = function()
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "package.json", "Makefile" },
      show_hidden = true,
      silent_chdir = true,
    })
  end,
}
