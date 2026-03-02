return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "saifulapm/neotree-file-nesting-config",
  },
  keys = {
    { "<leader>er", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  },
  opts = {
    hide_root_node = true,
    retain_hidden_root_indent = true,
    filesystem = {
      filtered_items = {
        show_hidden_count = false,
        never_show = {
          ".DS_Store",
        },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
    window = {
      width = 60,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
  },
  config = function(_, opts)
    opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
    require("neo-tree").setup(opts)
  end,
}
