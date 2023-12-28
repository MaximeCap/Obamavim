return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>ee', ':Neotree toggle<CR>', {})
    vim.keymap.set('n', '<leader>ef', ':Neotree focus<CR>', {})

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        hijack_netrw_behavior = "open_default"
      }
    })
  end
}
