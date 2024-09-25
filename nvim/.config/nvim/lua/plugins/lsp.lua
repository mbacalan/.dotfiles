return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local cmp_format = require('lsp-zero').cmp_format()

      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        formatting = cmp_format,
        mapping = cmp.mapping.preset.insert({
          ['<tab>'] = cmp_action.luasnip_supertab(),
          ['<s-tab>'] = cmp_action.luasnip_shift_supertab(),
          ['<c-space>'] = cmp.mapping.complete(),
          ['<c-e>'] = cmp.mapping.abort(),
          ['<cr>'] = cmp.mapping.confirm({select = false}),
        }),
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'codeium' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'buffer', keyword_length = 3 },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end,
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local lsp_attach = function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end

      lsp_zero.extend_lspconfig({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        lsp_attach = lsp_attach,
        format_on_save = true,
        float_order = 'rounded',
        sign_text = {
          error = '✘',
          warn = '▲',
          hint = '⚑',
          info = '»',
        }
      })

      lsp_zero.format_mapping('F3', {
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['biome'] = {'javascript', 'typescript'},
        }
      })

      require('mason-lspconfig').setup({
        ensure_installed = {
          -- 'clangd',
          'cssls',
          'eslint',
          'html',
          'jsonls',
          'ts_ls',
          'lua_ls',
          -- 'rust_analyzer',
          -- 'gopls'
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,

          html = function()
            require('lspconfig').html.setup({ filetypes = { "html", "templ" } })
          end,
        }
      })
    end
  }
}
