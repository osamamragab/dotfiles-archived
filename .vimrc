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
set smartindent
set smarttab
set softtabstop=2
set ruler
set undolevels=1000
set backspace=indent,eol,start

filetype indent on

colorscheme monokai

call plug#begin('~/dotfiles/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-github-dashboard'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
call plug#end()
