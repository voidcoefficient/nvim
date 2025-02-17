---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "= L&P Firm = Research & Development =",
      }
      return opts
    end,
  },
}
