setopt autocd
setopt interactive_comments
setopt prompt_subst
setopt histignorespace
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_ignore_all_dups
stty stop undef

autoload -U vcs_info
zstyle ":vcs_info:*" enable git svn
zstyle ":vcs_info:*" formats "(%b) "
precmd() { vcs_info; }
PS1='%B%F{cyan}%c %F{blue}${vcs_info_msg_0_}%F{%(?.green.red)}>%f%b '

HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTFILE="${HISTFILE:-${XDG_STATE_HOME:-$HOME/.local/state}/history}"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
alias doas="doas "

fpath=("${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions" $fpath)
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
KEYTIMEOUT=1

# vi keys in completion menu
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "^[[Z" reverse-menu-complete
bindkey -v "^?" backward-delete-char

bindkey "^[[P" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# edit line in vi
autoload edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line
bindkey -M vicmd '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M visual '^[[P' vi-delete

bindkey -s "^o" '^uxdg-open "$(fzf-tmux)" >/dev/null\n'
bindkey -s "^s" '"$(fzf-tmux)"\n'
bindkey -s "^f" '^ucd "$(dirname "$(fzf-tmux)")"\n'
bindkey -s "^t" '^u[ -f TODO.md ] && $EDITOR TODO.md || notes todo\n'

ZSHPLUGINSDIR="${ZSHPLUGINSDIR:-/usr/share/zsh/plugins}"
[ -f "$ZSHPLUGINSDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] &&
	. "$ZSHPLUGINSDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
if [ -f "$ZSHPLUGINSDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ]; then
	ZSH_AUTOSUGGEST_STRATEGY=(history completion)
	. "$ZSHPLUGINSDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fi
if [ -f "$ZSHPLUGINSDIR/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
	. "$ZSHPLUGINSDIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
	bindkey -a "k" history-substring-search-up
	bindkey -a "j" history-substring-search-down
	bindkey "^[[A" history-substring-search-up
	bindkey "^[[B" history-substring-search-down
fi

[ -f "/usr/share/z/z.sh" ] && . "/usr/share/z/z.sh"
