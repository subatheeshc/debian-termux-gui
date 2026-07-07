#!/data/data/com.termux/files/usr/bin/bash

# Start Termux:X11 only if not running
if ! pgrep -f "termux-x11 :0" > /dev/null; then
    termux-x11 :0 >/dev/null 2>&1 &
    sleep 2
fi

# Start Debian XFCE
proot-distro login debian --user suba -- bash -c '
export DISPLAY=:0
export XDG_RUNTIME_DIR=$TMPDIR
export PULSE_SERVER=127.0.0.1
dbus-launch --exit-with-session startxfce4
'
