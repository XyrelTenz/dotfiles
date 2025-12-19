return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[
           ████ ██████           █████      ██                    
          ███████████             █████                             
          █████████ ███████████████████ ███   ███████████   
         █████████  ███     █████████████ █████ ██████████████   
         █████████ ██████████ █████████ █████ █████ ████ █████   
       ███████████ ███    ███ █████████ █████ █████ ████ █████  
      ██████  █████████████████████ ████ █████ █████ ████ ██████ 
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    opts.config = opts.config or {}

    opts.config.header = vim.split(logo, "\n")
    opts.theme = "hyper"

    opts.config.shortcut = {
      {
        icon = " ",
        desc = "Files",
        group = "Label",
        action = function()
          Snacks.picker.files()
        end,
        key = "f",
      },
      {
        icon = " ",
        desc = "Database",
        group = "Number",
        action = "enew | SQLua",
        key = "d",
      },
      {
        icon = " ",
        desc = "Recent",
        group = "DiagnosticHint",
        action = function()
          Snacks.picker.recent()
        end,
        key = "r",
      },
      {
        icon = " ",
        desc = "Config",
        group = "Number",
        action = function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        key = "c",
      },
      {
        icon = "󰒲 ",
        desc = "Lazy",
        group = "Label",
        action = "Lazy",
        key = "l",
      },
      {
        icon = " ",
        desc = "Quit",
        group = "Number",
        action = "qa",
        key = "q",
      },
    }
  end,
}
