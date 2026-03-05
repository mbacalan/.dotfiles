return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = function()
      local TS = require("nvim-treesitter")
      TS.update(nil, { summary = true })
    end,
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    event = { "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "bash",
          "c",
          "diff",
          "git_config",
          "gitcommit",
          "git_rebase",
          "gitignore",
          "gitattributes",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "printf",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
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
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        opts = {},
      }
    }
  },
}
