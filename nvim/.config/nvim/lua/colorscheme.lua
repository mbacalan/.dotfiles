vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup({
  integrations = {
    gitsigns = true,
    telescope = true,
    cmp = true,
    treesitter = true,
    treesitter_context = true,
    native_lsp = { enabled = true },
  }
})

vim.cmd [[colorscheme catppuccin]]
