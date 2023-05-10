local api = require('nvim-tree.api')

local function on_attach(bufnr)
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-T>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-T>', { buffer = bufnr })
  vim.keymap.set('n', '<C-E>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-E>', { buffer = bufnr })
end

require('nvim-tree').setup({
  on_attach = on_attach,
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        default = "-",
        modified = "●",
        folder = {
          arrow_closed = ">",
          arrow_open = "<",
          default = "+",
          open = "u",
          empty = "-",
          empty_open = "-",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "UM",
          renamed = "➜",
          untracked = "★",
          deleted = "D",
          ignored = "◌",
        },
      },
    }
  }
})

vim.keymap.set('n', '<C-t>', ':NvimTreeToggle<cr>', { silent = true, noremap = true})
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFileToggle<cr>', { silent = true, noremap = true})
