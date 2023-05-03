local plugins = {
-- nvim-treesitter 
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "bash",

        -- favs 
        "c",
        "cpp",
        "rust",

        -- utils
        -- "typescript",
        "javascript",
        "markdown",
        "python",
        -- "scala",
        "java",
        -- "html",
        -- "css",
      },
    },
  },

-- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function ()
        require "custom.configs.null-ls"
      end
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

}

return plugins
