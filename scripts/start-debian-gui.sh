#!/data/data/com.termux/files/usr/bin/bash

CONFIG="$HOME/debian-termux-gui/config/user.conf"

if [ ! -f "$CONFIG" ]; then
    echo "Configuration not found."
    echo "Run setup.sh first."
    exit 1
fi

source "$CONFIG"

if [ -z "$DEBIAN_USER" ]; then
    echo "Debian username is not configured."
    exit 1
fi

echo "Starting Termux:X11..."

if ! pgrep -f "termux-x11 :0" >/dev/null; then
    termux-x11 :0 >/dev/null 2>&1 &
    sleep 3
fi

echo "Starting Debian GUI..."

proot-distro login debian --user "$DEBIAN_USER" -- bash -c '
export DISPLAY=:0
export XDG_RUNTIME_DIR=/tmp/runtime-'$DEBIAN_USER'
export PULSE_SERVER=127.0.0.1

mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

rm -rf /tmp/.X11-unix
mkdir -p /tmp/.X11-unix

ln -sf /data/data/com.termux/files/usr/tmp/.X11-unix/X0 /tmp/.X11-unix/X0

dbus-run-session startxfce4
'
