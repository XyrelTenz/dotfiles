return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "justinhj/battery.nvim",
  },
  config = function()
    require("battery").setup({
      show_percent = true,
      show_plugged_icon = true,
      vertical_icons = true,
      update_rate_seconds = 30,
      show_status_when_no_battery = true,
      show_unplugged_icon = true,
      multiple_battery_selection = 1,
    })

    -- ==========================================
    -- CosmicInk Config Logic
    -- ==========================================

    local colors = {
      BG = "#16181b",
      FG = "#c5c4c4",
      YELLOW = "#e8b75f",
      CYAN = "#00bcd4",
      DARKBLUE = "#2b3e50",
      GREEN = "#00e676",
      ORANGE = "#ff7733",
      VIOLET = "#7a3ba8",
      MAGENTA = "#d360aa",
      BLUE = "#4f9cff",
      RED = "#ff3344",
    }

    local function get_mode_color()
      local mode_color = {
        n = colors.DARKBLUE,
        i = colors.VIOLET,
        v = colors.RED,
        [""] = colors.BLUE,
        V = colors.RED,
        c = colors.MAGENTA,
        no = colors.RED,
        s = colors.ORANGE,
        S = colors.ORANGE,
        [""] = colors.ORANGE,
        ic = colors.YELLOW,
        R = colors.ORANGE,
        Rv = colors.ORANGE,
        cv = colors.RED,
        ce = colors.RED,
        r = colors.CYAN,
        rm = colors.CYAN,
        ["r?"] = colors.CYAN,
        ["!"] = colors.RED,
        t = colors.RED,
      }
      return mode_color[vim.fn.mode()] or colors.DARKBLUE
    end

    local function get_opposite_color(mode_color)
      local opposite_colors = {
        [colors.RED] = colors.CYAN,
        [colors.BLUE] = colors.ORANGE,
        [colors.GREEN] = colors.MAGENTA,
        [colors.MAGENTA] = colors.DARKBLUE,
        [colors.ORANGE] = colors.BLUE,
        [colors.CYAN] = colors.YELLOW,
        [colors.VIOLET] = colors.GREEN,
        [colors.YELLOW] = colors.RED,
        [colors.DARKBLUE] = colors.VIOLET,
      }
      return opposite_colors[mode_color] or colors.FG
    end

    local function get_animated_color(mode_color)
      local all_colors = {
        colors.RED,
        colors.BLUE,
        colors.GREEN,
        colors.MAGENTA,
        colors.ORANGE,
        colors.CYAN,
        colors.VIOLET,
        colors.YELLOW,
        colors.DARKBLUE,
      }
      local possible_opposites = {}
      for _, color in ipairs(all_colors) do
        if color ~= mode_color then
          table.insert(possible_opposites, color)
        end
      end
      if #possible_opposites > 0 then
        return possible_opposites[math.random(1, #possible_opposites)]
      else
        return colors.FG
      end
    end

    local function interpolate_color(color1, color2, step)
      local blend = function(c1, c2, stp)
        return math.floor(c1 + (c2 - c1) * stp)
      end
      local r1, g1, b1 = tonumber(color1:sub(2, 3), 16), tonumber(color1:sub(4, 5), 16), tonumber(color1:sub(6, 7), 16)
      local r2, g2, b2 = tonumber(color2:sub(2, 3), 16), tonumber(color2:sub(4, 5), 16), tonumber(color2:sub(6, 7), 16)
      return string.format("#%02X%02X%02X", blend(r1, r2, step), blend(g1, g2, step), blend(b1, b2, step))
    end

    local function get_middle_color(color_step)
      color_step = color_step or 0.5
      local color1 = get_mode_color()
      local color2 = get_opposite_color(color1)
      return interpolate_color(color1, color2, color_step)
    end

    local function hide_in_width()
      return vim.fn.winwidth(0) > 80
    end

    math.randomseed(os.time())

    local icon_sets = {
      stars = { "★", "☆", "✧", "✦", "✶", "✷", "✸", "✹" },
      runes = {
        "✠",
        "⛧",
        "𖤐",
        "ᛟ",
        "ᚨ",
        "ᚱ",
        "ᚷ",
        "ᚠ",
        "ᛉ",
        "ᛊ",
        "ᛏ",
        "☠",
        "☾",
        "♰",
        "✟",
        "☽",
        "⚚",
        "🜏",
      },
      hearts = { "❤", "♥", "♡", "❦", "❧" },
      waves = { "≈", "∿", "≋", "≀", "⌀", "≣", "⌇" },
      crosses = { "☨", "✟", "♰", "♱", "⛨", "" },
    }

    local function get_random_icon(icons)
      return icons[math.random(#icons)]
    end

    local function shuffle_table(tbl)
      local n = #tbl
      while n > 1 do
        local k = math.random(n)
        tbl[n], tbl[k] = tbl[k], tbl[n]
        n = n - 1
      end
    end

    local icon_sets_list = {}
    for _, icons in pairs(icon_sets) do
      table.insert(icon_sets_list, icons)
    end
    shuffle_table(icon_sets_list)

    local function reverse_table(tbl)
      local reversed = {}
      for i = #tbl, 1, -1 do
        table.insert(reversed, tbl[i])
      end
      return reversed
    end

    local reversed_icon_sets = reverse_table(icon_sets_list)

    local function create_separator(side, use_mode_color)
      return {
        function()
          return side == "left" and "" or ""
        end,
        color = function()
          local color = use_mode_color and get_mode_color() or get_opposite_color(get_mode_color())
          return { fg = color }
        end,
        padding = { left = 0 },
      }
    end

    local function create_mode_based_component(content, icon, color_fg, color_bg)
      return {
        content,
        icon = icon,
        color = function()
          local mode_color = get_mode_color()
          local opposite_color = get_opposite_color(mode_color)
          return { fg = color_fg or colors.FG, bg = color_bg or opposite_color, gui = "bold" }
        end,
      }
    end

    local function mode()
      local mode_map = {
        n = "N",
        i = "I",
        v = "V",
        [""] = "V",
        V = "V",
        c = "C",
        no = "N",
        s = "S",
        S = "S",
        ic = "I",
        R = "R",
        Rv = "R",
        cv = "C",
        ce = "C",
        r = "R",
        rm = "M",
        ["r?"] = "?",
        ["!"] = "!",
        t = "T",
      }
      return mode_map[vim.fn.mode()] or "[UNK]"
    end

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.FG, bg = colors.BG } },
          inactive = { c = { fg = colors.FG, bg = colors.BG } },
        },
        disabled_filetypes = { "neo-tree", "undotree", "sagaoutline", "diff" },
      },
      sections = { lualine_a = {}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {} },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "location",
            color = function()
              return { fg = colors.FG, gui = "bold" }
            end,
          },
        },
        lualine_x = {
          {
            "filename",
            color = function()
              return { fg = colors.FG, gui = "bold,italic" }
            end,
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- LEFT SIDE
    ins_left({
      mode,
      color = function()
        return { fg = colors.BG, bg = get_mode_color(), gui = "bold" }
      end,
      padding = { left = 1, right = 1 },
    })
    ins_left(create_separator("left", true))
    ins_left({
      function()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      end,
      icon = " ",
      color = function()
        return { fg = get_mode_color(), gui = "bold" }
      end,
    })
    ins_left(create_separator("right"))
    ins_left(create_mode_based_component("filename", nil, colors.BG))
    ins_left(create_separator("left"))
    ins_left({
      function()
        return ""
      end,
      color = function()
        return { fg = get_middle_color() }
      end,
      cond = hide_in_width,
    })
    ins_left({
      function()
        local git = vim.b.gitsigns_status_dict
        if git then
          return string.format("+%d ~%d -%d", git.added or 0, git.changed or 0, git.removed or 0)
        end
        return ""
      end,
      color = { fg = colors.YELLOW, gui = "bold" },
      cond = hide_in_width,
    })

    for _, icons in pairs(icon_sets_list) do
      ins_left({
        function()
          return get_random_icon(icons)
        end,
        color = function()
          return { fg = get_animated_color() }
        end,
        cond = hide_in_width,
      })
    end

    ins_left({ "searchcount", color = { fg = colors.GREEN, gui = "bold" } })

    -- RIGHT SIDE
    ins_right({
      function()
        local reg = vim.fn.reg_recording()
        return reg ~= "" and "[" .. reg .. "]" or ""
      end,
      color = { fg = "#ff3344", gui = "bold" },
    })
    ins_right({ "selectioncount", color = { fg = colors.GREEN, gui = "bold" } })

    -- [ADDED] BATTERY COMPONENT
    ins_right({
      function()
        local ok, battery = pcall(require, "battery")
        if ok then
          return battery.get_status_line()
        end
        return ""
      end,
      color = { fg = colors.GREEN, gui = "bold" }, -- Matches theme style
    })

    for _, icons in ipairs(reversed_icon_sets) do
      ins_right({
        function()
          return get_random_icon(icons)
        end,
        color = function()
          return { fg = get_animated_color() }
        end,
        cond = hide_in_width,
      })
    end

    ins_right({
      function()
        local msg = "No Active Lsp"
        local buf_ft = vim.bo.filetype
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        local lsp_short_names = {
          pyright = "py",
          tsserver = "ts",
          rust_analyzer = "rs",
          lua_ls = "lua",
          clangd = "c++",
          bashls = "sh",
          jsonls = "json",
          html = "html",
          cssls = "css",
          tailwindcss = "tw",
          dockerls = "docker",
          sqlls = "sql",
          yamlls = "yml",
        }
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return lsp_short_names[client.name] or client.name:sub(1, 2)
          end
        end
        return msg
      end,
      icon = " ",
      color = { fg = colors.YELLOW, gui = "bold" },
    })

    ins_right({
      function()
        return ""
      end,
      color = function()
        return { fg = get_middle_color() }
      end,
      cond = hide_in_width,
    })
    ins_right(create_separator("right"))
    ins_right(create_mode_based_component("location", nil, colors.BG))
    ins_right(create_separator("left"))

    ins_right({
      "branch",
      icon = " ",
      fmt = function(branch)
        if not branch or branch == "" then
          return "No Repo"
        end
        local function truncate(s, l)
          if #s > l then
            return s:sub(1, l)
          end
          return s
        end
        local segs = {}
        for s in branch:gmatch("[^/]+") do
          table.insert(segs, s)
        end
        for i = 1, #segs - 1 do
          segs[i] = truncate(segs[i], 1)
        end
        if #segs == 1 then
          return segs[1]
        end
        segs[1] = segs[1]:upper()
        for i = 2, #segs - 1 do
          segs[i] = segs[i]:lower()
        end
        local res = table.concat(segs, "", 1, #segs - 1) .. "›" .. segs[#segs]
        return #res > 15 and res:sub(1, 15) .. "…" or res
      end,
      color = function()
        return { fg = get_mode_color(), gui = "bold" }
      end,
    })

    ins_right(create_separator("right"))
    ins_right(create_mode_based_component("progress", nil, colors.BG))

    require("lualine").setup(config)
  end,
}
