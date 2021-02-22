shopt -s dirspell
shopt -s nocaseglob
shopt -s no_empty_cmd_completion
shopt -s checkhash
shopt -s autocd
shopt -s globstar extglob dotglob

__git_branch() {
	br="$(git symbolic-ref HEAD --short 2>/dev/null)"
	[ "$br" ] && echo "($br) "
}

export PS1='\[\e[1;36m\]\W \[\e[34m\]$(__git_branch)\[\e[32m\]>\[\e[m\] '

export HISTSIZE=1000
export HISTFILESIZE=2000

[ -s "$HOME/dotfiles/.aliases" ] && . "$HOME/dotfiles/.aliases"

# https://github.com/rupa/z
[ -s "$HOME/programs/z/z.sh" ] && . "$HOME/programs/z/z.sh"
