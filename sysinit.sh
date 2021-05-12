#!/bin/sh
# vim: wrap

alias i="doas xbps-install -Sy"

if ! command -v doas > /dev/null 2>&1; then
	echo "installing doas..."
	sudo xbps-install -Sy opendoas
	sudo echo "permit nopass keepenv :wheel" > /etc/doas.conf
fi

echo "updating system..."
doas xbps-install -u xbps
doas xbps-install -Syu

echo "installing x..."
i xorg xorg-server xinit libX11-devel libXft-devel libXinerama libXinerama-devel libXrandr libXrandr-devel glib-devel

echo "installing filesystems support..."
i fuse fuse-exfat mtpfs simple-mtpfs autofs

echo "installing network manager..."
i NetworkManager ufw

echo "installing build tools..."
i gcc clang tcc git make pkg-config

echo "installing text editor..."
i vim neovim

echo "installing x11 tools..."
i xdotool xclip xautolock xzoom

echo "installing general tools..."
i curl wget gnupg gnupg2 openssh pass passmenu sxhkd nnn slop maim dunst xdg-utils entr nq youtube-dl rsync exa ripgrep fd skim fzf bat xz translate-shell cronie at libnotify tree unclutter urlscan urlview uftp highlight redshift newsboat spt sc-im surfraw thttpd miniserve youtube-viewer stagit tig hyperfine diskus pam-gnupg abook notmuch isync msmtp xwallpaper pmount mlocate zip unzip geoip speedometer screenkey openntpd fswebcam lprng bind-utils

echo "installing manual pages..."
i man-pages man-pages-devel man-pages-posix

echo "installing audio tools..."
i alsa-utils alsa-plugins-pulseaudio pulseaudio pamixer pulsemixer

echo "installing multimedia tools..."
i ffmpeg ImageMagick mpv sxiv obs gimp

echo "installing music players..."
i mpd mpc ncmpcpp

echo "installing pdf tools..."
i zathura zathura-pdf-mupdf mupdf wkhtmltopdf

echo "installing video/photo/audio editors..."
i openshot darktable audacity lmms

echo "installing system monitoring tools..."
i htop iotop gotop procs lm_sensors iftop bmon duf dust

echo "installing email tools..."
i neomutt msmtp

echo "installing chatting applications..."
i irssi weechat weechat-python Signal-Desktop telegram-desktop tuir toxcore toxic utox

echo "installing web browsers..."
i firefox lynx w3m amfora tor torbrowser-launcher

echo "installing networking tools..."
i nmap netcat lsof wireshark wireshark-qt termshark socat inetutils net-tools iperf3 iputils arp-scan aircrack-ng kismet hashcat hashcat-utils bettercap

echo "installing torrent tools..."
i transmission rtorrent

echo "installing programming stuff..."
i rustup go python3 nodejs yarn lua R ruby sassc postgresql13 redis flex bison c gdb valgrind strace ltrace rust-analyzer binutils upx ctags delve jq grpc protobuf terraform shellcheck shfmt pylint black tflint tokei misspell pgcli xxd hexedit
go get -u -v github.com/google/pprof github.com/securego/gosec google.golang.org/protobuf/cmd/protoc-gen-go github.com/fullstorydev/grpcurl github.com/cosmtrek/air github.com/timakin/bodyclose
pip install jupyter
yarn global add typescript eslint prettier sass pug svgo
DENO_INSTALL_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/deno/bin" \
curl -fsSL "https://deno.land/x/install/install.sh" | sh

echo "installing cheat sheet tools..."
i cheat tealdeer
doas curl https://cht.sh/:cht.sh -o /usr/local/bin/cht.sh && doas chmod +x "$_"

echo "installing markup/latex tools..."
i pandoc groff mdocml texlive lowdown glow

echo "installing docker..."
i docker docker-compose docker-credential-pass

echo "installing arduino..."
i arduino arduino-cli

echo "installing fonts..."
i font-ibm-plex-otf font-inconsolata-otf

echo "installing zsh..."
i zsh
chsh -s "$(which zsh)"

prgdir="$HOME/programs"
[ ! -e "$prgdir" ] && mkdir -p "$prgdir"
cd "$prgdir"

git_username="$(git config --global --get user.username)"
if [ -z "$git_username" ]; then
	printf "github username: "
	read git_username
fi

if [ "$git_username" ]; then
	echo "installing suckless programs..."
	suckless_programs="dwm st dmenu dwmblocks surf slock sent"
	for p in $suckless_programs; do
		echo "installig $p"

		if [ "$p" = "surf" ]; then
			echo "installing surf dependencies..."
			i webkit2gtk-devel gcr-devel gst-libav gst-plugins-good1
		fi

		[ ! -d "$prgdir/$p" ] && git clone "git@github.com:$git_username/$p.git"
		cd "$prgdir/$p"
		git checkout main
		doas make install
		make clean
	done
	unset p
	cd "$prgdir"
fi

echo "installing mutt-wizard..."
[ ! -e "$prgdir/mutt-wizard" ] && git clone "git@github.com:LukeSmithxyz/mutt-wizard.git"
cd "$prgdir/mutt-wizard"
git checkout master
doas make install

cd "$prgdir"

echo "installing z..."
[ ! -e "$prgdir/z" ] && git clone "git@github.com:rupa/z.git"
doas ln -s "$prgdir/z/z.1" "/usr/local/share/man/man1/z.1"

cdir="$(dirname "$(readlink -f "$0")")"
if [ -x "$cdir/setup.sh" ]; then
	echo "running dotfiles setup script..."
	"$cdir/setup.sh"
fi

if [ ! -f "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim" ]; then
	echo "installing vim plug..."
	curl --create-dirs -fLo "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim" "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

cd "$cdir"
