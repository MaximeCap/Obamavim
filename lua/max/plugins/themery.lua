return {
  "zaldih/themery.nvim",
  config = function()
    require("themery").setup({
      themeConfigFile = "~/.config/nvim/lua/theme.lua", -- Described below
      themes = {
        {
          name = "Light",
          colorscheme = "dawnfox",
          before = [[
            vim.opt.background = 'light'
          ]],
        },
        {
          name = "Dark",
          colorscheme = "Carbonfox",
          before = [[
            vim.opt.background = 'dark'
          ]],
        },
      },
    })
  end,
}
