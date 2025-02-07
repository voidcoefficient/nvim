return {
  "leath-dub/snipe.nvim",
  keys = {
    { "<localleader>b", function() require("snipe").open_buffer_menu() end, desc = "list buffers" },
  },
  opts = {
    ui = {
      max_height = -1,
      position = "center",
    },
  },
}
