return {
  {
    "nvim-treesitter/nvim-treesitter",
    otps = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "php",
        "rust",
        "scss",
        "sql",
        "svlete",
      },
      autotag = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")

      vim.filetype.add({
        extension = {
          astro = "astro",
        }
      })
      vim.treesitter.language.register("astro", "astro")
    end,
  },
}
