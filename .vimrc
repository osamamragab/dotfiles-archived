call plug#begin('~/dotfiles/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
Plug 'fatih/molokai'
call plug#end()

set nocompatible

filetype off
filetype plugin indent on

set encoding=utf-8

set autoread
set autowrite
set ttyfast
set lazyredraw
set number
set linebreak
set showbreak=++
set ruler
set undolevels=1000
set belloff=all
set splitright
set splitbelow
set noshowmode
set noshowmatch
set hidden

set hlsearch
set smartcase
set ignorecase
set incsearch

set nobackup
set nowritebackup
set noswapfile

set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set copyindent
set smartindent
set smarttab
set backspace=indent,eol,start

set clipboard^=unnamed
set clipboard^=unnamedplus

set display+=lastline

set mouse=a

set updatetime=300

set completeopt=menu,menuone
set nocursorcolumn
set nocursorline
set pumheight=10
set conceallevel=2

set fileformats=unix,dos,mac

syntax enable

set t_Co=256
set background=dark

let g:molokai_original = 1
let g:rehash256 = 1

colorscheme molokai

let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goimports'
let g:go_auto_type_info = 1

let python_highlight_all = 1

let g:NERDTreeWinPos = 'right'

let mapleader=' '

inoremap kj <Esc>

map q: :q

nnoremap <silent> <C-l> :nohl<CR><C-l>

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

inoremap <silent><expr> <c-space> coc#refresh()

map <C-b> :NERDTreeToggle<CR>
nnoremap <leader>w <esc>:w<CR>
nnoremap <leader>q <esc>:q<CR>
nnoremap <leader>Q <esc>:q!<CR>
nnoremap <leader>n <esc>:nohlsearch<CR>

execute 'set <xUp>=\e[1;*A'
execute 'set <xDown>=\e[1;*B'
execute 'set <xRight>=\e[1;*C'
execute 'set <xLeft>=\e[1;*D'
