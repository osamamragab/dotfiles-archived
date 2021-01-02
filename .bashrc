[[ $- != *i* ]] && return

[ -s "$HOME/dotfiles/.aliases" ] && . "$HOME/dotfiles/.aliases"
[ -s "$HOME/dotfiles/.functions" ] && . "$HOME/dotfiles/.functions"

__git_branch() {
	br="$(git symbolic-ref HEAD --short 2> /dev/null)"
	[ -z "$br" ] && exit 0
	echo "($br) "
}

export PS1='\[\e[1;36m\]\W \[\e[34m\]$(__git_branch)\[\e[32m\]>\[\e[m\] '

# https://github.com/rupa/z
[ -f "$HOME/programs/z/z.sh" ] && . "$HOME/programs/z/z.sh"
