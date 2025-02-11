return {
  "folke/trouble.nvim",
  opts = {
    auto_close = true,
    auto_jump = true,
    focus = true,

    modes = {
      diag = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.4,
        },
      },
    },

    icons = {
      ---@type trouble.Indent.symbols
      indent = {
        top = "  ",
        middle = "  ",
        last = "  ",
        fold_open = "[O] ",
        fold_closed = "[F] ",
        ws = "  ",
      },
      folder_closed = "[D] ",
      folder_open = "[O] ",
      kinds = {
        Array = "  ",
        Boolean = "  ",
        Class = "  ",
        Constant = "  ",
        Constructor = "  ",
        Enum = "  ",
        EnumMember = "  ",
        Event = "  ",
        Field = "  ",
        File = "  ",
        Function = "  ",
        Interface = "  ",
        Key = "  ",
        Method = "  ",
        Module = "  ",
        Namespace = "  ",
        Null = "  ",
        Number = "  ",
        Object = "  ",
        Operator = "  ",
        Package = "  ",
        Property = "  ",
        String = " ",
        Struct = "  ",
        TypeParameter = "  ",
        Variable = "  ",
      },
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<localleader>t",
      desc = "trouble",
    },
    {
      "<localleader>tt",
      "<cmd>Trouble diag toggle<cr>",
      desc = "diagnostics",
    },
    {
      "<localleader>tb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "buffer diagnostics",
    },
    {
      "<localleader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "symbols",
    },
    {
      "<localleader>tl",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "location list",
    },
    {
      "<localleader>tL",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ...",
    },
    {
      "<localleader>tq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "quickfix list",
    },
  },
}
