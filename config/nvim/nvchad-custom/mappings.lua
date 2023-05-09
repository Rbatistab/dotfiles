local M = {}

-- M.comment = {
--   -- comment with "CTRL-/" on insert mode
--   -- [BUG] - Not working
--   i = {
--     ["C-/"] = {
--       function()
--         require("Comment.api").toggle.linewise.current()
--       end,
--       "toggle comment",
--     },
--   }
-- }

M.general = {
  i = {
    ["jj"]  = { "<ESC>", "Escape insert mode" },
    ["<C-s>"]   = { "<cmd> w <CR>", "Save file" };
  }
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugger sidebar"
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "Update all cratea"
    }
  }
}
return M
