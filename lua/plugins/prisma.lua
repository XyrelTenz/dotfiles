return {
  "prisma/vim-prisma",
  lazy = false,
  priority = 1000,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "prisma",
      callback = function()
        vim.opt_local.syntax = "prisma"
      end,
    })
  end,
}
