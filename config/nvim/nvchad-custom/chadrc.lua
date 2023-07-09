---@type ChadrcConfig 
local M = {}
M.ui = {theme = 'decay'}
M.plugins  = "custom.plugins"
M.mappings = require "custom.mappings"
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    side = "right",
  },
}
return M
