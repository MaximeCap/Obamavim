return {
  "stevearc/conform.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = function()
    local opts = {
      format = {
        lsp_fallback = true,
        async = false,
        timeout = 500,
      },
      formatter_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
    }

    return opts;
  end,
}
