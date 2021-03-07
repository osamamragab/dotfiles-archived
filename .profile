#!/bin/sh

export TERMINAL="st"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

export GOPATH="$HOME/go"

export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.deno/bin:$HOME/.yarn/bin:$PATH"

export SUDO_ASKPASS="$HOME/.local/bin/dmenuaskpass"

export LESS_TERMCAP_mb="$(printf '%b' '\e[01;31m')"
export LESS_TERMCAP_md="$(printf '%b' '\e[01;31m')"
export LESS_TERMCAP_me="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_se="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_so="$(printf '%b' '\e[01;44;33m')"
export LESS_TERMCAP_ue="$(printf '%b' '\e[0m')"
export LESS_TERMCAP_us="$(printf '%b' '\e[01;32m')"

[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx
