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
        -- "c",
        -- "cpp",
        "rust",

        -- utils
        "typescript",
        "javascript",
        "markdown",
        "python",
        "json",
        "yaml",
        -- "html",
        -- "css",

        -- Smithy model
        "smithy",
      },
    },
  },

-- lspconfig - https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    init_options = {
      userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        rust = "html",
      },
    },
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
        "bash-language-server",
        "java-language-server",
        "lua-language-server",
        "js-debug-adapter",
        "rust-analyzer",
        "quick-lint-js",
        "markdownlint",
        "luau-lsp",
        "json-lsp",
        "prettier",
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

-- crates.nvim - https://github.com/Saecki/crates.nvim
  {
    "Saecki/crates.nvim",
    ft  = {"rust", "toml"},
    config = function (_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end
  },

-- nvim-cmp (autcompletion) - https://github.com/hrsh7th/nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp" 
      -- For cargo autocompletion, combine with crates.nvim
      table.insert(M.sources, {name = "crates"})
      return M
    end
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
  },

-- tmux
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

-- markdown.nvim
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
    -- configuration here or empty for defaults
    }
  },
-- markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    run = function() vim.fn["mkdp#util#install"]() end,
    ft = { "markdown" },
    config = function()
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_refresh_slow = 0
        vim.g.mkdp_command_for_global = 0
        vim.g.mkdp_open_to_the_world = 0
        vim.g.mkdp_open_ip = ''
        vim.g.mkdp_browser = ''
        vim.g.mkdp_echo_preview_url = 0
        vim.g.mkdp_browserfunc = ''
        vim.g.mkdp_preview_options = {
            mkit = {},
            katex = {},
            uml = {},
            maid = {},
            disable_sync_scroll = 0,
            sync_scroll_type = 'middle',
            hide_yaml_meta = 1,
            sequence_diagrams = {},
            flowchart_diagrams = {},
            content_editable = 'v:true',
            disable_filename = 0,
            toc = {}
        }
        vim.g.mkdp_markdown_css = ''
        vim.g.mkdp_highlight_css = ''
        vim.g.mkdp_port = ''
        vim.g.mkdp_page_title = '「${name}」'
        vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

}

return plugins
