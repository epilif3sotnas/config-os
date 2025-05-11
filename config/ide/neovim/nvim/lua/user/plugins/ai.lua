return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
            accept_suggestion = "<C-l>",
			accept_word = "<C-S-l>",
			clear_suggestion = "<C-h>",
        },
        color = {
          suggestion_color = "#808080",
          cterm = 244,
        },
        log_level = "off", -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function() return false end,
      }
    end,
  },
}
