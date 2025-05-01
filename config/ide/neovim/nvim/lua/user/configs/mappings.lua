vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "<leader><S-h>", ":leftabove vsplit<CR>", { desc = "Split left" })
vim.keymap.set("n", "<leader><S-l>", ":vsplit<CR>", { desc = "Split right" })
vim.keymap.set("n", "<leader><S-k>", ":leftabove split<CR>", { desc = "Split up" })
vim.keymap.set("n", "<leader><S-j>", ":split<CR>", { desc = "Split down" })

vim.keymap.set("n", "<leader>po", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>pr", function() Snacks.picker.recent() end, { desc = "Find recent files" })

vim.keymap.set("n", "<leader>f<S-G>", function() Snacks.picker.grep() end, { desc = "Grep live project" })

vim.keymap.set("n", "<leader>ba", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers" })

vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })

vim.keymap.set("n", "g<S-i>", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Go to implementation" })

vim.keymap.set("n", "<leader>dl", function() require("dap").list_breakpoints() end, { desc = "List breakpoints" })

vim.keymap.set("n", "<A-S-h>", "<C-w>h")
vim.keymap.set("n", "<A-S-j>", "<C-w>j")
vim.keymap.set("n", "<A-S-k>", "<C-w>k")
vim.keymap.set("n", "<A-S-l>", "<C-w>l")

vim.keymap.set("t", "<A-S-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<A-S-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<A-S-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<A-S-l>", "<C-\\><C-n><C-w>l")

return {
  {
    "rebelot/heirline.nvim",
    opts = function()
      vim.keymap.set("n", "<leader>bb", ":bp<cr>", { desc = "Previous buffer" })
      vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "Next buffer" })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {}
      vim.keymap.set("n", "<C-\\>", function()
        require("toggleterm.terminal").Terminal
          :new({
            direction = "vertical",
            on_open = function()
              vim.cmd "wincmd H"
              vim.api.nvim_win_set_width(0, 40)
            end,
          })
          :toggle()
      end)
    end,

    lazy = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["L"] = "open_nofocus", -- Custom key
        },
      },
      commands = {
        open_nofocus = function(state)
          require("neo-tree.sources.filesystem.commands").open(state)
          vim.schedule(function() -- Ensures focus returns after file loads
            vim.cmd "Neotree focus"
          end)
        end,
      },
    },
  },
}
