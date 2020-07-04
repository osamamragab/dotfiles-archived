syntax on

set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
set nobackup
set noswapfile
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set copyindent
set smartindent
set smarttab
set ruler
set undolevels=1000
set backspace=indent,eol,start
set belloff=all
set splitright
set splitbelow
set nocompatible

filetype off

colorscheme monokai

call plug#begin('~/dotfiles/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-github-dashboard'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
call plug#end()
