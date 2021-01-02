if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi

shopt -s dirspell direxpand
shopt -s nocaseglob
shopt -s no_empty_cmd_completion
shopt -s checkhash
shopt -s autocd
shopt -s globstar extglob dotglob
