local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  -- 'clangd',
  'cssls',
  -- 'cssmodules_ls',
  -- 'emmet_ls',
  'eslint',
  'html',
  'jsonls',
  'tsserver',
  -- 'rust_analyzer',
  -- 'gopls'
})

lsp.on_attach(function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr}

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, bufopts)
  vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, bufopts)
  vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, bufopts)
  vim.keymap.set('n', 'gr', function () vim.lsp.buf.references() end, bufopts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, bufopts)
  vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end, bufopts)
  vim.keymap.set('n', '<leader>D', function() vim.lsp.buf.type_definition() end, bufopts)
  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, bufopts)
  vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, bufopts)

  vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, bufopts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, bufopts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, bufopts)
  vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setloclist() end, bufopts)

  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, bufopts)
  end
end)

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm(cmp_select),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mapping
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
