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

vim.cmd.colorscheme('dracula')
