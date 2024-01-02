return {
  {
    "ms-jpq/coq_nvim",
    branch = 'coq',
  },
  {
    "ms-jpq/coq.artifacts",
    branch = "artifacts"
  },
  {
    "ms-jpq/coq.thirdparty",
    branch = "3p"
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "linrongbin16/lsp-progress.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lsp-progress").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      local coq = require("coq")
      local clients = { "tsserver", "lua_ls" }
      for _, client in ipairs(clients) do
        lsp[client].setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
      end
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
    end,
  },
}
