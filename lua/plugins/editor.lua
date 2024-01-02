return {
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local treesitterConfig = require("nvim-treesitter.configs")
      treesitterConfig.setup({
        ensure_installed = { "lua", "javascript", "astro", "yaml", "graphql" },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.surround").setup()
    end,
  },
}
