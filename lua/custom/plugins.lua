local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Basic
        "lua",
        "vim",

        -- Web dev
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "jsdoc",
        "tsx",
        "json",
        "astro",

        -- TreeJS
        "glsl",

        -- Ops
        "dockerfile",
        "yaml"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Web
        "emmet-ls",
        "astro-language-server",
        "typescript-language-server",
        "css-lsp",
        "tailwindcss-language-server",
        -- Ops
        "docker-compose-language-service",
        "dockerfile-language-server",
        -- Utils
        "commitlint",
        "eslint_d"
      }
    }
  }
}

return plugins
