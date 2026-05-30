#!/bin/sh -x

export LC_CTYPE=en_US.UTF-8

export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1
export QT_FONT_DPI=112

# jcs's cleanup()
cleanup() {
	echo "cleaning up"
	pkill dbus-daemon redshift
	rm -f ~/.Xauthority
	rm -f ~/.local/share/Trash
	rm -f ~/*.core
}
trap cleanup INT TERM QUIT

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-x11`
fi

export XDG_RUNTIME_DIR="/tmp/runtime-$(whoami)"
if ! test -d "${XDG_RUNTIME_DIR}"; then
	mkdir "${XDG_RUNTIME_DIR}"
	chmod 0700 "${XDG_RUNTIME_DIR}"
fi

#if [ `xrandr --query | awk '/^DP-2-1 /{print $2; exit}'` = "connected" ]; then
#	xrandr 	--output eDP-1 --mode 1920x1080 --pos 1920x0 --rotate normal \
#			--output DP-2-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
#fi
xrandr --output eDP-1 --mode 1280x720

xset b 0 0 0
xset r rate 350 35

xset s off
xset dpms 0 0 0
xbacklight -set 40%

xset +fp /usr/local/share/fonts/X11/misc
xset +fp /usr/local/share/fonts/vga
xset +fp /usr/local/share/fonts/spleen

xsetroot -cursor_name left_ptr
hsetroot -tile ~/.wall
setxkbmap -layout jp,us -option grp:win_space_toggle

xinput set-prop /dev/wsmouse 308 1
xinput set-prop /dev/wsmouse 312 2
xinput set-prop /dev/wsmouse 309 6 7 4 5

xidle -timeout 300 -program ~/bin/lock &
redshift -l -6.90:107.62 -t 5500:4000 -m randr &

#fvwm
ratpoison

cleanup
