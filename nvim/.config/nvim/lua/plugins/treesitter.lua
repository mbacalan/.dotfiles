return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    event = { 'VeryLazy' },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "html",
          "javascript",
          "typescript",
          "tsx",
          "css",
          "scss",
          "json",
          "markdown",
          "vim",
          "lua"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
    dependencies = {
      'romgrk/nvim-treesitter-context',
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        enabled = true,
      },
      {
        'windwp/nvim-ts-autotag',
        event = 'VeryLazy',
        opts = {},
        config = function()
          require('nvim-ts-autotag').setup({})
        end,
      },
    }
  },
}
