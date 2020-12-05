[[ $- != *i* ]] && return

[ -s "$HOME/dotfiles/.aliases" ] && . "$HOME/dotfiles/.aliases"
[ -s "$HOME/dotfiles/.functions" ] && . "$HOME/dotfiles/.functions"

__prompt_color() {
	[ $? -eq 0 -o $? -eq 130 ] && printf '\e[32m' || printf '\e[31m'
}

export PS1='\e[1;36m\W $(__prompt_color)>\e[m '
