return {
  'nvim-lua/plenary.nvim',
  'junegunn/gv.vim',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'editorconfig/editorconfig-vim',
  {
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup({
        global_settings = {
          mark_branch = true
        }
      })

      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file)
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup()
      -- prompt for a refactor to apply when the remap is triggered
      vim.keymap.set(
        { "n", "x" },
        "<leader>rr",
        function() require('refactoring').select_refactor() end
      )
      -- Note that not all refactor support both normal and visual mode

      -- You can also use below = true here to to change the position of the printf
      -- statement (or set two remaps for either one). This remap must be made in normal mode.
      vim.keymap.set(
        "n",
        "<leader>rp",
        function() require('refactoring').debug.printf({ below = false }) end
      )

      -- Print var

      vim.keymap.set({ "x", "n" }, "<leader>rv", function() require('refactoring').debug.print_var() end)
      -- Supports both visual and normal mode

      vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end)
      -- Supports only normal mode
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {}
  },
  {
    'Exafunction/codeium.nvim',
    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end,
  },
}
