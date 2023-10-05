require('telescope').load_extension('fzf')

local telescope = require("telescope")
local builtin = require('telescope.builtin')
local trouble = require("trouble.providers.telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({ hidden = true, no_ignore = false })
end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fG', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
