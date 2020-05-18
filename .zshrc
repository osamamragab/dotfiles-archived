# Path to your oh-my-zsh installation.
export ZSH="$HOME/dotfiles/.oh-my-zsh"


plugins=(git)

source "$ZSH/oh-my-zsh.sh"

fpath+="$HOME/dotfiles/.zsh/pure"

autoload -U promptinit; promptinit
prompt pure

source "$HOME/dotfiles/.include_all"

chmod +x ~/.vocab
~/.vocab
