local plugins = {
-- nvim-treesitter - https://github.com/nvim-treesitter/nvim-treesitter 
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

-- lspconfig - https://github.com/neovim/nvim-lspconfig
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

-- mason - https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "bash-language-server",
        "java-language-server",
        "quick_lint_js",
        "js-debug-adapter",
        "json-lsp",
      },
    },
  },

-- rust.vim - https://github.com/rust-lang/rust.vim
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function() -- Required to initiate lua file
      vim.g.rustfmt_autosave = 1 -- autoformating on save
    end
  },

-- rust-tools - https://github.com/simrat39/rust-tools.nvim
  {
    "simrat39/rust-tools.nvim",
    ft    = "rust",
    dependencies  = "neovim/nvim-lspconfig",
    opts  = function ()
      return require "custom.configs.rust-tools"
    end,
    config  = function (_, opts)
      require('rust-tools').setup(opts)
    end
  },

-- scalameta/nvim-metals - https://github.com/scalameta/nvim-metals
  {
    "scalameta/nvim-metals",
    ft = "scala",
  },

-- nvim-dap - https://github.com/mfussenegger/nvim-dap
  {
    "mfussenegger/nvim-dap",
  },

-- blamer.nvim - https://github.com/APZelos/blamer.nvim
  {
    "APZelos/blamer.nvim",
    -- opts = function ()
    --   require "custom.configs.blamer-nvim"
    -- end,
  }

}

return plugins
