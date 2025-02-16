return {
  "AstroNvim/astrotheme",
  config = function()
    require("astrotheme").setup {
      palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
      background = { -- :h background, palettes to use when using the core vim background colors
        light = "astrolight",
        dark = "astrodark",
      },

      style = {
        transparent = true, -- Bool value, toggles transparency.
        inactive = false, -- Bool value, toggles inactive window color.
        float = false, -- Bool value, toggles floating windows background colors.
        neotree = false, -- Bool value, toggles neo-trees background color.
        border = true, -- Bool value, toggles borders.
        title_invert = true, -- Bool value, swaps text and background colors.
        italic_comments = false, -- Bool value, toggles italic comments.
        simple_syntax_colors = true, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
      },

      termguicolors = false, -- Bool value, toggles if termguicolors are set by AstroTheme.
      terminal_color = false, -- Bool value, toggles if terminal_colors are set by AstroTheme.

      plugin_default = "auto", -- Sets how all plugins will be loaded
      -- "auto": Uses lazy / packer enabled plugins to load highlights.
      -- true: Enables all plugins highlights.
      -- false: Disables all plugins.
    }
  end,
}
