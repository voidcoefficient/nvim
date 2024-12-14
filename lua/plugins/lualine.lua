return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts) opts.winbar = nil end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = {
          "%=",
          {
            "harpoon2",
            icons_enabled = true,
            icon = "⥥",
            indicators = { "h", "j", "k", "l" },
            active_indicators = { "H", "J", "K", "L" },
            _separator = " ",
            no_harpoon = "no harpoons",
          },
        },
        lualine_x = {},
        lualine_y = {
          {
            "os.date('%H:%M')",
            padding = {
              left = 1, -- `os.date` formats to `"15:00 " for some reason`. this centers it
              right = 0, -- doesn't matter
            },
          },
        },
        lualine_z = { "filename" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
}
