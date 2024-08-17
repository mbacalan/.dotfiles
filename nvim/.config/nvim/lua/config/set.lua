vim.opt.ma = true
vim.opt.mouse = 'a'
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.updatetime = 300
vim.opt.list = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.wildmode = 'longest,list,full'
vim.opt.wildignore:append('**/node_modules/*')
vim.opt.wildignore:append('**/.git/*')
vim.opt.clipboard:append('unnamedplus')
vim.opt.laststatus = 3
vim.opt.signcolumn = 'yes'
vim.g.python3_host_prog = '/usr/bin/python3.11'

-- Center cursor while going up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- LSP
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = true,
    header = '',
    prefix = '',
  },
})

vim.filetype.add({ extension = { templ = "templ" } })
