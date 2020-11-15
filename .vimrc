call plug#begin('~/dotfiles/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'exu/pgsql.vim'
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
set nowrap

set hlsearch
set smartcase
set ignorecase
set incsearch

set nobackup
set nowritebackup

" set noswapfile
set swapfile
set directory^=$HOME/.vim/tmp//

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

"let g:molokai_original = 1
let g:rehash256 = 1

colorscheme molokai

hi LineNr ctermbg=234

hi TabLine ctermbg=233
hi TabLineFill ctermfg=233

hi Pmenu ctermbg=233 ctermfg=252
hi PmenuSel ctermbg=235 ctermfg=252
hi PmenuSbar ctermbg=233
hi PmenuThumb ctermbg=236

hi SignColumn ctermbg=234
hi SignifySignAdd ctermfg=28
hi SignifySignChange ctermfg=26

let mapleader = ' '

let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goimports'
let g:go_def_mode = 'gopls'
let g:go_list_type = "quickfix"
let g:go_echo_command_info = 1
let g:go_autodetect_gopath = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_info_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_implements_mode = 'gopls'
let g:go_gopls_complete_unimported = 1
let g:go_diagnostics_enabled = 1
let g:go_doc_popup_window = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_operators = 1

let python_highlight_all = 1

let g:sql_type_default = 'pgsql'

let g:NERDTreeWinPos = 'right'
let NERDTreeShowHidden = 1

let g:airline_theme = 'sonokai'

let g:signify_sign_change = '~'

let g:floaterm_keymap_toggle = '<C-space>'
let g:floaterm_position = 'bottom'
let g:floaterm_width = 1.0
let g:floaterm_height = 0.2

imap jj <Esc>

map q: :q

" nnoremap <C-l> :nohl<CR>

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <C-g> :GoDecls<CR>
imap <C-g> <esc>:<C-u>GoDecls<CR>

inoremap <silent><expr> <C-space> coc#refresh()

map <C-b> :NERDTreeToggle<CR>
nnoremap <leader>w <esc>:w<CR>
nnoremap <leader>q <esc>:q<CR>
nnoremap <leader>Q <esc>:q!<CR>
nnoremap <leader>n <esc>:nohlsearch<CR>

execute 'set <xUp>=\e[1;*A'
execute 'set <xDown>=\e[1;*B'
execute 'set <xRight>=\e[1;*C'
execute 'set <xLeft>=\e[1;*D'
