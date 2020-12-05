[[ $- != *i* ]] && return

[ -s "$HOME/dotfiles/.aliases" ] && . "$HOME/dotfiles/.aliases"
[ -s "$HOME/dotfiles/.functions" ] && . "$HOME/dotfiles/.functions"

__prompt_color() {
	[ $? -eq 0 -o $? -eq 130 ] && printf "\[\e[32m\]" || printf "\[\e[31m\]"
}

__git_branch() {
	br="$(git symbolic-ref HEAD --short 2> /dev/null)"
	[ ! -z "$br" ] && printf "\[\e[34m(%s)\] " "$br" || exit 0
}

export PS1="\[\e[1;36m\]\W $(__git_branch)$(__prompt_color)>\[\e[m\] "
