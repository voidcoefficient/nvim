-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.opt_global.shiftwidth = 2
vim.opt_global.tabstop = 2

require "lazy_setup"
require "polish"

-- custom keybinds
-- TODO: move
-- TODO: hydra-mode..?
local wk = require "which-key"
wk.add {
  { "<localleader>m", "<c-w><c-w>", desc = "switch windows" },
  { "<localleader>u", "<cmd>Telescope jumplist initial_mode=normal<cr>", desc = "list jumplist" },
  { "<localleader>q", "<cmd>Telescope quickfix initial_mode=normal<cr>", desc = "list quickfix" },
  { "<localleader>Q", "<cmd>Telescope quickfixhistory initial_mode=normal<cr>", desc = "list quickfixhistory" },
  { "<localleader>w", desc = "write/neorg" },
  { "<localleader>wj", "<cmd>Neorg journal today<cr><cmd>Neorg inject-metadata<cr>", desc = "journal today" },
  { "<localleader>wi", "<cmd>Neorg inject-metadata<cr>", desc = "inject metadata" },
  { "<localleader>wu", "<cmd>Neorg update-metadata<cr>", desc = "update metadata" },
  { "<localleader>wu", "<cmd>Neorg update-metadata<cr>", desc = "update metadata" },
  { "<ESC>", "<C-\\><C-n>", desc = "exit terminal mode", mode = "t" },
}
