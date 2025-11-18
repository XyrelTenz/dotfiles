return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline_popup",
    },

    views = {
      cmdline_popup = {
        position = {
          row = "45%", -- slightly lower for aesthetic balance
          col = "50%",
        },
        size = {
          width = 42,
          height = "auto",
        },
        border = {
          style = "rounded",
        },
        win_options = {
          winblend = 15, -- makes it "glass" transparent
          winhighlight = table.concat({
            "Normal:NoiceCmdline",
            "FloatBorder:NoiceCmdBorder",
            "CursorLine:NoiceCmdCursorLine",
          }, ","),
        },
      },
    },

    -- OPTIONAL: makes message UI also aesthetic
    presets = {
      command_palette = false,
      bottom_search = false,
      long_message_to_split = true,
    },
  },

  config = function(_, opts)
    require("noice").setup(opts)

    -- 🌈 Custom aesthetic colors
    vim.api.nvim_set_hl(0, "NoiceCmdline", {
      bg = "#1a1b26", -- deep aesthetic night-theme background
      fg = "#c0caf5",
    })

    vim.api.nvim_set_hl(0, "NoiceCmdBorder", {
      fg = "#7aa2f7", -- soft blue border
      bg = "#1a1b26",
    })

    vim.api.nvim_set_hl(0, "NoiceCmdCursorLine", {
      bg = "#24283b", -- subtle highlight
    })
  end,
}
