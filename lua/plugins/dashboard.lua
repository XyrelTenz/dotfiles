return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
                ████ ██████           █████       ██                    
               ███████████             █████                             
               █████████ ███████████████████ ███   ███████████   
              █████████  ███    █████████████ █████ ██████████████   
             █████████ ██████████ █████████ █████ █████ ████ █████   
           ███████████ ███    ███ █████████ █████ █████ ████ █████  
          ██████  █████████████████████ ████ █████ █████ ████ ██████ 
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      opts.config.header = vim.split(logo, "\n")
      opts.theme = "hyper"

      opts.config.shortcut = {
        {
          icon = " ",
          desc = "Files",
          action = "Telescope find_files",
          key = "f",
        },
        {
          icon = " ",
          desc = "Database",
          group = "Number",
          action = "enew | SQLua",
          key = "d",
        },
        -- -----------------------------------------------------
        {
          icon = " ",
          desc = "Recent",
          group = "Label",
          action = "Telescope oldfiles",
          key = "r",
        },
        {
          icon = " ",
          desc = "Config",
          group = "Number",
          action = "e $MYVIMRC",
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
  },
}
