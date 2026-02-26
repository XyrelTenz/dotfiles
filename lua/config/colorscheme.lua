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
  "EndOfBuffer",
}

local function make_transparent()
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

function M.setup()
  vim.cmd("colorscheme kanagawa-paper-ink")
  -- vim.cmd("colorscheme dark_flat")
  -- vim.cmd("colorscheme NeoSolarized")
  -- vim.cmd("colorscheme poimandres")
  -- vim.cmd("colorscheme darkvoid")
  -- vim.cmd("colorscheme onedark")
  -- vim.cmd("colorscheme cyberdream")
  -- vim.cmd("colorscheme hybrid")
  -- vim.cmd("colorscheme nord")
  -- vim.cmd("colorscheme everforest")
  -- vim.cmd("colorscheme vscode")
  -- vim.cmd("colorscheme bamboo")
  -- vim.cmd("colorscheme mellow")
  -- vim.cmd("colorscheme boo")
  -- vim.cmd("colorscheme everblush")
  -- vim.cmd("colorscheme solarized-osaka")
  -- vim.cmd("colorscheme sherbet")

  -- Apply transparency
  make_transparent()

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = make_transparent,
  })
end

return M
