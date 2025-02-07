return {
  "leath-dub/snipe.nvim",
  keys = {
    { "<localleader>b", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" },
  },
  opts = {
    ui = {
      max_height = -1,
      position = "center",
    },
  },
}
