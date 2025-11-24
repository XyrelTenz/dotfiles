return {
  "nvim-flutter/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        border = "rounded",
        notification_style = "native",
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      debugger = {
        enabled = false,
        run_via_dap = false,
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "//",
        enabled = true,
      },
      dev_log = {
        enabled = false,
        open_cmd = "15split",
      },
      outline = {
        auto_open = false,
      },
      dev_tools = {
        autostart = false,
        auto_open_browser = false,
      },
      flutter_run_args = {
        "--offline",
      },
      lsp = {
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
        },
        -- Add this capabilities check to ensure colors load
        on_attach = function(client, bufnr)
          if client.server_capabilities.colorProvider then
            -- Enable native colors
            require("vim.lsp.document_color").buf_attach(bufnr)
          end
        end,
      },
    })
  end,
}
