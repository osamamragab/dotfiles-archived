#!/bin/sh

cdir="$(dirname "$(readlink -f "$0")")"
if [ -x "$cdir/setup.sh" ]; then
	echo "running dotfiles setup script..."
	"$cdir/setup.sh"
fi

if ! command -v doas >/dev/null 2>&1; then
	echo "installing doas..."
	sudo xbps-install -Sy opendoas
	sudo echo "permit nopass keepenv :wheel" > /etc/doas.conf
fi

echo "updating system..."
doas xbps-install -u xbps
doas xbps-install -Syu

alias i="doas xbps-install -Sy"

echo "installing x..."
i xorg xorg-server xinit libX11-devel libXft-devel libXinerama libXinerama-devel libXrandr libXrandr-devel glib-devel

echo "installing filesystems support..."
i fuse fuse-exfat mtpfs simple-mtpfs autofs

echo "installing network manager..."
i NetworkManager ufw

echo "installing build tools..."
i gcc git make pkg-config

echo "installing text editor..."
i vim neovim

echo "installing x11 tools..."
i xdotool xclip xautolock xzoom

echo "installing general tools..."
i curl wget gnupg gnupg2 openssh pass passmenu tmux nnn slop maim dunst xdg-utils entr nq youtube-dl rsync exa ripgrep fd skim fzf bat delta xz translate-shell cronie libnotify tree xcompmgr unclutter urlview uftp redshift newsboat spt sc-im surfraw thttpd youtube-viewer tig pam-gnupg xwallpaper pmount mlocate zip unzip geoip screenkey openntpd fswebcam lprng bind-utils

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
i htop iotop gotop procs lm_sensors iftop bmon speedometer

echo "installing email tools..."
i neomutt msmtp isync notmuch

echo "installing chatting applications..."
i irssi weechat weechat-python Signal-Desktop telegram-tg telegram-desktop tuir toxcore toxic utox

echo "installing web browsers..."
i firefox lynx w3m amfora tor torbrowser-launcher

echo "installing networking tools..."
i nmap netcat lsof traceroute mtr wireshark wireshark-qt termshark inetutils net-tools socat websocat iperf3 iputils arp-scan aircrack-ng kismet hashcat hashcat-utils bettercap sqlmap
pip install mitmproxy

echo "installing torrent tools..."
i transmission rtorrent

echo "installing programming stuff..."
i clang tcc rustup go python3 nodejs yarn lua R ruby sassc postgresql13 mariadb sqlite redis flex bison c gdb valgrind strace ltrace clang-analyzer clang-tools-extra rust-analyzer binutils upx ctags delve jq grpc protobuf terraform shellcheck shfmt pylint black tflint tokei misspell pgcli xxd hexedit hex
go get -u -v github.com/google/pprof github.com/securego/gosec google.golang.org/protobuf/cmd/protoc-gen-go github.com/fullstorydev/grpcurl github.com/cosmtrek/air github.com/timakin/bodyclose
pip install jupyter mycli litecli
yarn global add typescript eslint prettier sass pug svgo
curl -fsSL "https://deno.land/x/install/install.sh" | DENO_INSTALL="${XDG_DATA_HOME:-$HOME/.local/share}/deno" sh

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
[ -d "$prgdir" ] || mkdir -p "$prgdir"

ghuser="$(git config --global --get user.username)"
if [ -z "$ghuser" ]; then
	printf "github username: "
	read ghuser
fi

if [ "$ghuser" ]; then
	echo "installing suckless programs..."
	for p in dwm st dmenu dwmblocks surf slock sent; do
		echo "installig $p"

		case "$p" in
			surf)
				echo "installing surf dependencies..."
				i webkit2gtk-devel gcr-devel gst-libav gst-plugins-good1
				;;
			sent)
				echo "installing sent dependencies..."
				i farbfeld
				;;
		esac

		[ -d "$prgdir/$p" ] || git clone "git@github.com:$ghuser/$p.git" "$prgdir/$p"
		cd "$prgdir/$p"
		git checkout main
		doas make install
		make clean
	done
fi

echo "installing mutt-wizard..."
[ -d "$prgdir/mutt-wizard" ] || git clone "git@github.com:LukeSmithxyz/mutt-wizard.git" "$prgdir/mutt-wizard"
cd "$prgdir/mutt-wizard"
git checkout master
doas make install

cd "$prgdir"

echo "installing z..."
[ -d "$prgdir/z" ] || git clone "git@github.com:rupa/z.git" "$prgdir/z"
doas cp -f "$prgdir/z/z.1" "/usr/local/share/man/man1/z.1"
doas chmod 644 "/usr/local/share/man/man1/z.1"

if [ ! -f "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim" ]; then
	echo "installing vim plug..."
	curl --create-dirs -fLo "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim" "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

cd "$cdir"

# vim: wrap
