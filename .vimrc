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

let &t_ut=''

call plug#begin('~/dotfiles/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'moll/vim-node'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
call plug#end()

colorscheme sonokai
