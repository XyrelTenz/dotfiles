return {
  "nvim-neo-tree/neo-tree.nvim",
  cond = not vim.g.vscode,
  branch = "v3.x",
  event = "VeryLazy",

  -- INFO: Dependencies
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "DaikyXendo/nvim-material-icon",
      config = function()
        require("nvim-web-devicons").setup()
      end,
    },
  },

  --  INFO: Keymaps
  keys = {
    { "<leader>er", "<Cmd>Neotree toggle reveal<CR>", desc = "Explorer Neotree" },
  },

  --  INFO: Config
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_cursor_hijack = true,
    hide_root_node = true,
    hide_by_name = true,
    title = false,

    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },

    window = {
      position = "float",
      width = 150,
      title = "",
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["z"] = "close_all_nodes",
        ["A"] = "add_directory",
        ["P"] = {
          "toggle_preview",
          config = { use_float = true, use_image_nvim = true },
        },
        ["<C-b>"] = { "scroll_preview", config = { direction = -10 } },
        ["<C-f>"] = { "scroll_preview", config = { direction = 10 } },
      },
    },

    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = "no"
          vim.opt_local.foldcolumn = "0"
        end,
      },
    },

    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = false, leave_dirs_open = false },
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_hidden = true,
        hide_by_name = { "node_modules" },
        hide_by_pattern = {},
        always_show = { "dist" },
        always_show_by_pattern = {},
        never_show = {},
        never_show_by_pattern = {},
      },
      commands = {
        delete = function(state)
          local node = state.tree:get_node()
          local inputs = require("neo-tree.ui.inputs")
          inputs.confirm("Are you sure you want to trash " .. node.name .. "?", function(confirmed)
            if not confirmed then
              return
            end
            vim.fn.system({ "trash-put", vim.fn.fnameescape(node.path) })
            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,
      },
    },

    default_component_configs = {
      -- INFO: Icons
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
        default = "*",
        highlight = "NeoTreeFileIcon",
        -- The custom `provider` function has been removed!
        -- Neo-tree will automatically use nvim-web-devicons now.
      },

      modified = {
        symbol = "",
        highlight = "NeoTreeModified",
      },

      git_status = {
        symbols = {
          added = "✚",
          deleted = "✖",
          modified = "",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
        align = "float",
      },

      indent = {
        indent_size = 3,
        padding = 0,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },

    renderers = {
      file = {
        { "indent" },
        { "icon" },
        {
          "container",
          content = {
            { "name", zindex = 10 },
            { "symlink_target", zindex = 10, highlight = "NeoTreeSymbolicLinkTarget" },
            { "modified", zindex = 20, align = "right" },
            { "clipboard", zindex = 10 },
            { "bufnr", zindex = 10 },
            { "git_status", zindex = 10, align = "right" },
            { "file_size", zindex = 10, align = "right" },
            { "type", zindex = 10, align = "right" },
            { "last_modified", zindex = 10, align = "right" },
            { "created", zindex = 10, align = "right" },
          },
        },
      },
    },
  },
}
