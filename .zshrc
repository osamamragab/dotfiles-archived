setopt autocd
setopt interactive_comments
stty stop undef

autoload -U colors && colors
PS1="%B%{$fg[cyan]%}%1d %{$fg[green]%}>%b "

HISTSIZE=2000
SAVEHIST=2000

autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -v "^?" backward-delete-char
bindkey "^[[P" delete-char

# vi cursor shapes
function zle-vicursorshape() {
	case $KEYMAP in
		vicmd) echo -ne "\e[1 q" ;;
		viins|main) echo -ne "\e[5 q" ;;
	esac
}
zle -N zle-vicursorshape
zle-line-init() {
	zle -K viins
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne "\e[5 q"
preexec() {
	echo -ne "\e[5 q"
}

autoload edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

[ -s "$HOME/dotfiles/.aliases" ] && . "$HOME/dotfiles/.aliases"
