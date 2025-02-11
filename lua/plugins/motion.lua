---@type LazySpec
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    labels = "hjklasdfgqwertyuiopzxcvbnm", -- prioritizes home row
    modes = {
      search = {
        enabled = true,
      },
    },
    jump = {
      autojump = true,
    },
    label = {
      uppercase = false,
    },
    rainbow = {
      enabled = true,
      shade = 5,
    },
  },
  keys = {
    { "<localleader><localleader>", mode = { "n" }, function() require("flash").jump() end, desc = "flash" },
    {
      "<localleader>T",
      mode = { "n" },
      function() require("flash").treesitter {} end,
      desc = "flash treesitter",
    },
    {
      "<localleader>f",
      mode = { "n" },
      function() require("flash").treesitter_search {} end,
      desc = "flash treesitter",
    },
    { "<localleader>r", mode = { "n" }, function() require("flash").remote() end, desc = "flash remote" },
    {
      "#",
      mode = { "n" },
      function()
        require("flash").jump {
          pattern = vim.fn.expand "<cword>",
        }
      end,
      desc = "flash with current word",
    },
    {
      "<localleader> ",
      mode = { "n" },
      desc = "flash diagnostics",
      function()
        require("flash").jump {
          matcher = function(win)
            ---@param diag Diagnostic
            return vim.tbl_map(
              function(diag)
                return {
                  pos = { diag.lnum + 1, diag.col },
                  end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
                }
              end,
              vim.diagnostic.get(vim.api.nvim_win_get_buf(win))
            )
          end,
          action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
              vim.api.nvim_win_set_cursor(match.win, match.pos)
              vim.diagnostic.open_float()
            end)
            state:restore()
          end,
        }
      end,
    },
  },
}
