export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

fpath+="$HOME/.zsh/pure"

autoload -U promptinit; promptinit

PURE_PROMPT_SYMBOL="$"

prompt pure

source "$HOME/dotfiles/.include_all"
