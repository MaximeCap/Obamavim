return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  after = "feline.nvim",
  config = function()
    require("max.core.tabby")
  end,
}
