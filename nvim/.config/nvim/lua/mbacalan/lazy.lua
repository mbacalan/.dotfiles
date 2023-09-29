require('lazy').setup({
  'wbthomason/packer.nvim',
  { 'dracula/vim', name = 'dracula' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
    }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'romgrk/nvim-treesitter-context',
  'nvim-tree/nvim-tree.lua',
  'nvim-lua/plenary.nvim',
  'ThePrimeagen/harpoon',
  'junegunn/gv.vim',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'lewis6991/gitsigns.nvim',
  'nvim-lualine/lualine.nvim',
  'editorconfig/editorconfig-vim',
  'folke/zen-mode.nvim',
  {
    'folke/trouble.nvim',
    opts = {
      icons = false,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
      },
      use_diagnostic_signs = false -- enabling this will the signs defined in your lsp client
    }
  }
})
