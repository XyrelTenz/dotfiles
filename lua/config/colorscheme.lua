local M = {}

local groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "SignColumn",
  "LineNr",
  "StatusLine",
  "StatusLineNC",
  "WinSeparator",
  "TelescopeNormal",
  "TelescopeBorder",
  "TelescopePromptNormal",
  "TelescopePromptBorder",
  "TelescopePreviewNormal",
  "TelescopePreviewBorder",
  "NvimTreeNormal",
  "NvimTreeNormalNC",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeFloatNormal",
  "NeoTreeFloatBorder",
  "MsgArea",
  "Pmenu",
  "PmenuSel",
  "TabLine",
  "TabLineSel",
  "TabLineFill",
}

local function make_transparent()
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

function M.setup()
  -- vim.cmd("colorscheme kanagawa-paper-ink")
  vim.cmd("colorscheme kanagawa-paper-ink")

  -- Apply transparency
  make_transparent()

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = make_transparent,
  })
end

return M
