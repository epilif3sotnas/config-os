return {
  -- Multiple cursors
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
      { "<leader>k", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },
      { "<leader>j", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },

      { "gl", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursors to next match" },
      {
        "g<S-l>",
        "<Cmd>MultipleCursorsAddJumpPrevMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to previous match",
      },
    },
  },
}
