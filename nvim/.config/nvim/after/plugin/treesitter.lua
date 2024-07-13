require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    -- "html",
    "javascript",
    "typescript",
    "tsx",
    "css",
    "scss",
    "json",
    "vue",
    "markdown",
    "vim",
    "lua"
  },
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  }
}

-- TODO: Move to its own file? Follow Lazy plugin structure?
require('nvim-ts-autotag').setup({})
