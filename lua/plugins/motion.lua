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
    { "<localleader>f", mode = { "n" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
    {
      "<localleader>t",
      mode = { "n" },
      function() require("flash").treesitter_search() end,
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
  },
}
