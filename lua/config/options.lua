vim.opt.shell = "powershell"

vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote = ""
vim.opt.shellpipe = "|"
vim.opt.shellredir = ">"
vim.opt.shellxquote = ""

-- Colors
vim.lsp.document_color_default_options = {
  mode = "background",
}
