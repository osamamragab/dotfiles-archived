call plug#begin('~/dotfiles/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'
Plug 'rhysd/clever-f.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'exu/pgsql.vim'
Plug 'fatih/vim-nginx'
Plug 'ekalinin/Dockerfile.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/molokai'
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()


set nocompatible

filetype plugin indent on

set encoding=utf-8

set exrc
set secure

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

set swapfile
set directory^=$HOME/.vim/tmp//

set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
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

highlight LineNr ctermbg=234

highlight TabLine ctermbg=233
highlight TabLineFill ctermfg=233

highlight Pmenu ctermbg=233 ctermfg=252
highlight PmenuSel ctermbg=235 ctermfg=252
highlight PmenuSbar ctermbg=233
highlight PmenuThumb ctermbg=236

highlight SignColumn ctermbg=234
highlight SignifySignAdd ctermfg=28
highlight SignifySignChange ctermfg=26


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


" esc is far away
inoremap jj <esc>

" disable that stupid list
inoremap q: :q

" clear search highlight
nnoremap <C-n> :nohl<cr>

" delete without yanking
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" move faster between windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" show Go declarations
noremap <C-g> :GoDecls<cr>
inoremap <C-g> <esc>:<C-u>GoDecls<cr>

" coc completion menu
inoremap <silent><expr> <C-space> coc#refresh()

" nerdtree shortcuts
noremap <C-b> :NERDTreeToggle<cr>
nnoremap <leader>w <esc>:w<cr>
nnoremap <leader>q <esc>:q<cr>
nnoremap <leader>Q <esc>:q!<cr>
nnoremap <leader>n <esc>:nohlsearch<cr>


" disable C-<arrow> wired behavior
execute 'set <xUp>=\e[1;*A'
execute 'set <xDown>=\e[1;*B'
execute 'set <xRight>=\e[1;*C'
execute 'set <xLeft>=\e[1;*D'


" set headers file type to C
augroup cfiletype
	autocmd!
	autocmd BufNewFile,BufRead *.c,*.h set filetype=c
augroup END

" remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e
