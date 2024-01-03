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
      require("mini.move").setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = "<S-h>",
          right = "<S-l>",
          up = "<S-k>",
          down = "<S-j>",

          -- Move current line in Normal mode
          line_left = "<S-h>",
          line_right = "<S-l>",
          line_up = "<S-k>",
          line_down = "<S-j>",
        },

        -- Options which control moving behavior
        options = {
          -- Automatically reindent selection during linewise vertical move
          reindent_linewise = true,
        },
      })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
}
