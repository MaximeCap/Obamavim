return {
  "echasnovski/mini.move",
  version = false,
  opts = {
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
  },
  config = true,
}
