return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("nightfox").setup()
    vim.cmd("colorscheme carbonfox")
  end,
}
