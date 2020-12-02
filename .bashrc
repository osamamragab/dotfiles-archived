[[ $- != *i* ]] && return

PS1='\u@\h:\w\$ '

[ -s "$HOME/dotfiles/.aliases" ] && . "$HOME/dotfiles/.aliases"
[ -s "$HOME/dotfiles/.functions" ] && . "$HOME/dotfiles/.functions"
