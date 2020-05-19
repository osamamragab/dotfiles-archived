set runtimepath+=~/dotfiles/vendor/.vim_runtime

source ~/dotfiles/vendor/.vim_runtime/vimrcs/basic.vim
source ~/dotfiles/vendor/.vim_runtime/vimrcs/filetypes.vim
source ~/dotfiles/vendor/.vim_runtime/vimrcs/plugins_config.vim
source ~/dotfiles/vendor/.vim_runtime/vimrcs/extended.vim

try
source ~/dotfiles/vendor/.vim_runtime/my_configs.vim
catch
endtry

syntax on

set backspace=indent,eol,start

set tabstop=2 shiftwidth=2 expandtab

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
