return {
  "mistweaverco/kulala.nvim",
  keys = {
    {
      "<leader>Rs",
      function()
        require("kulala").run()
      end,
      desc = "Send request",
    },
    {
      "<leader>Ra",
      function()
        require("kulala").run_all()
      end,
      desc = "Send all requests",
    },
    {
      "<leader>Rb",
      function()
        require("kulala").scratchpad()
      end,
      desc = "Open scratchpad",
    },
    {
      "<leader>Rt",
      function()
        require("kulala").toggle_view()
      end,
      desc = "Toggle headers/body",
    },
  },
  ft = { "http", "rest" },
  opts = {
    -- POSTMAN STYLE SETUP
    -- "split" opens the result in a new window (instead of a popup)
    display_mode = "split",

    -- "vertical" puts the result side-by-side (Left: Code, Right: Result)
    split_direction = "vertical",

    -- Default to showing the Body (cleaner view)
    default_view = "body",

    -- Hide the default keys so you can use your own defined above
    global_keymaps = false,
  },
}
