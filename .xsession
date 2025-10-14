#!/bin/sh -x

export LANG=en_US.UTF-8

# jcs's cleanup()
cleanup() {
	echo "cleaning up"
	pkill dbus-daemon redshift picom
	rm -f ~/.Xauthority
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

xrdb -DHOME=$HOME < ~/.Xdefaults

export MOZ_USE_XINPUT2=1
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1

export GDK_SCALE=1.25
export QT_SCALE_FACTOR=1.25

xset s off
xset dpms 0 0 0
xidle -timeout 300 -program ~/bin/lock &

xset b 0 0 0
xset r rate 350 35

picom -b
redshift -l -6.90:107.62 -t 5000:4500 -m randr &
hsetroot -solid "#bcd7d8"
xbattmon &

sdorfehs

cleanup
