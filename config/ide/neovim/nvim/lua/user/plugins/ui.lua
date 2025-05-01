return {
  -- transparent UI
  { "tribela/transparent.nvim", auto = true, config = true },

  -- Neotree configs
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = {
        "filesystem",
      },
      source_selector = {
        winbar = false,
        statusline = false,
      },
      window = {
        position = "right",
      },
    },
  },
}
