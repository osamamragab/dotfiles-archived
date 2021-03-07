#!/bin/sh
# vim: wrap

cdir=$(dirname "$(readlink -f "$0")")
[ -x "$cdir/setup.sh" ] && {
	echo "running dotfiles setup script..."
	"$cdir/setup.sh"
}

alias i="doas xbps-install -Sy"

! command -v doas > /dev/null 2>&1 && {
	echo "installing doas..."
	sudo xbps-install -Sy opendoas
}

echo "updating system..."
doas xbps-install -u xbps
doas xbps-install -Syu

echo "installing x..."
i xorg xorg-server xinit libX11-devel libXft-devel libXinerama glib-devel

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
i curl wget ssh gnupg2 pass passmenu sxhkd nnn maim dunst xdg-utils entr nq youtube-dl rsync exa ripgrep fd skim fzf bat xz translate-shell scron cronie libnotify tree unclutter urlscan urlview uftp highlight redshift newsboat spt sc-im surfraw thttpd miniserve youtube-viewer mps-youtube stagit hyperfine diskus pam-gnupg abook notmuch isync msmtp

echo "installing manual pages..."
i man-pages man-pages-devel man-pages-posix cheat tldr

echo "installing audio tools..."
i alsa-utils alsa-plugins-pulseaudio pulseaudio pamixer pulsemixer

echo "installing multimedia tools..."
i ffmpeg ImageMagick mpv sxiv obs gimp

echo "installing music players..."
i mpd mpc ncmpcpp

echo "installing pdf tools..."
i zathura zathura-pdf-mupdf mupdf wkhtmltopdf

echo "installing video/photo/audio editors..."
i openshot shotcut darktable darktable-cli audacity ardour lmms

echo "installing system monitoring tools..."
i htop iotop gotop procs lm_sensors strace iftop bmon duf dust

echo "installing email tools..."
i neomutt msmtp

echo "installing chatting applications..."
i irssi weechat weechat-python Signal-Desktop telegram-desktop cordless tuir toxcore toxic utox

echo "installing web browsers..."
i chromium lynx w3m amfora tor torbrowser-launcher

echo "installing networking tools..."
i nmap netcat wireshark socat inetutils net-tools iperf3 iputils aircrack-ng arp-scan geoip speedometer

echo "installing torrent tools..."
i transmission transmission-remote rtorrent

echo "installing compilers..."
i rustup go python3 nodejs yarn R ruby lua apl sassc flex bison
curl -fsSL "https://deno.land/x/install/install.sh" | sh

echo "installing programming tools..."
i gdb valgrind binutils upx ctags delve jq grpc protobuf terraform ninja shellcheck pylint black vale tflint tokei misspell pgcli
go get -u -v github.com/google/pprof github.com/securego/gosec google.golang.org/protobuf/cmd/protoc-gen-go github.com/fullstorydev/grpcurl github.com/cosmtrek/air github.com/timakin/bodyclose
pip install jupyter vint mycli ptpython
yarn global add typescript eslint babel degit surge http-server serve nodemon tsserver ts-node sass pug live-server parcel prettier svgo

echo "installing markup/latex tools..."
i pandoc groff mdocml texlive lowdown glow

echo "installing docker..."
i docker docker-compose docker-credential-pass

echo "installing arduino..."
i arduino arduino-cli

echo "installing fonts..."
i font-ibm-plex-otf font-inconsolata-otf

prgdir="$HOME/programs"
[ ! -e "$prgdir" ] && mkdir -p "$prgdir"
cd "$prgdir"

git_username=$(git config --global --get user.username)
[ -z "$git_username" ] && {
	printf "github username: "
	read git_username
}

if [ "$git_username" ]; then
	echo "installing suckless programs..."
	suckless_programs="dwm st dmenu dwmblocks surf slock sent"
	for p in $suckless_programs; do
		echo "installig $p"

		[ "$p" = "surf" ] && {
			echo "installing surf dependencies..."
			i webkit2gtk-devel gcr-devel gst-libav gst-plugin-good1
		}

		[ ! -e "$prgdir/$p" ] && git clone "git@github.com:$git_username/$p.git"
		cd "$prgdir/$p"
		git checkout main
		doas make install
		make clean
	done
	cd "$prgdir"
fi

echo "installing mutt-wizard..."
[ ! -e "$prgdir/mutt-wizard" ] && git clone "git@github.com:LukeSmithxyz/mutt-wizard.git"
cd "$prgdir/mutt-wizard"
git checkout master
doas make install

cd "$prgdir"

echo "installing telegram cli..."
[ ! -e "$prgdir/tg" ] && git clone "git@github.com:kenorb-contrib/tg.git"
cd "$prgdir/tg"
git checkout master
doas make install

cd "$prgdir"

echo "installing z..."
[ ! -e "$prgdir/z" ] && git clone "git@github.com:rupa/z.git"
doas ln -s "$prgdir/z/z.1" "/usr/local/share/man/man1/z.1"

cd "$cdir"
