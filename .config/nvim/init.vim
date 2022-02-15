set scrolloff=8
set number
" set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set updatetime=500
set noshowmode
set list

let g:ale_disable_lsp = 1

packadd! dracula
syntax enable
colorscheme dracula

call plug#begin('~/local/share/nvim/site/pack/*/start')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

let mapleader = " "
" nnoremap <leader>pv :Vex<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:lightline = {
    \ 'colorscheme': 'one',
    \ }

let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['eslint', 'tsserver'] }
