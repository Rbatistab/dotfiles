local M = {}

M.comment = {
  -- comment with "CTRL-/" on insert mode
  -- [BUG] - Not working
  i = {
    ["C-/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  }
}

return M
