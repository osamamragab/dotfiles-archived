syntax on

filetype plugin indent on

set encoding=utf-8

set nocompatible

set number
set linebreak
set showbreak=+++
set ruler
set undolevels=1000
set belloff=all
set splitright
set splitbelow

set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch

set nobackup
set nowritebackup
set noswapfile

set textwidth=100
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set copyindent
set smartindent
set smarttab
set backspace=indent,eol,start

set clipboard=unnamed

call plug#begin('~/dotfiles/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
call plug#end()

colorscheme sonokai

let mapleader=" "

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>w <esc>:w<CR>
nnoremap <leader>q <esc>:q<CR>
nnoremap <leader>Q <esc>:q!<CR>
nnoremap <leader>n <esc>:nohlsearch<CR>

execute "set <xUp>=\e[1;*A"
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"
