[ -s "$HOME/dotfiles/.aliases" ] && . "$HOME/dotfiles/.aliases"

wttr() {
	curl -s "wttr.in/$1?m1"
}

# find with case insensitivity
ifind() {
	find . -iname "*$1*"
}

# colorful man pages
man() {
	LESS_TERMCAP_mb=$'\e[01;31m' \
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	command man "$@"
}

__git_branch() {
	br="$(git symbolic-ref HEAD --short 2>/dev/null)"
	[ "$br" ] && echo "($br) "
}

export PS1='\[\e[1;36m\]\W \[\e[34m\]$(__git_branch)\[\e[32m\]>\[\e[m\] '

# https://github.com/rupa/z
[ -f "$HOME/programs/z/z.sh" ] && . "$HOME/programs/z/z.sh"
