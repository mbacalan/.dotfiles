vim.g.mapleader = " "

-- Center cursor while going up and down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- NERD Tree
-- let g:NERDTreeShowHidden = 1
-- nnoremap <C-t> :NERDTreeToggle<CR>
-- nnoremap <C-f> :NERDTreeFind<CR>

-- NERD Commenter
-- filetype plugin on
-- let g:NERDCreateDefaultMappings = 1
-- let g:NERDSpaceDelims = 1
