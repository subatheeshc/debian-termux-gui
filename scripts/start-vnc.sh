#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Start TigerVNC Server
# ============================================

set -e

CONFIG="$HOME/debian-termux-gui/config/user.conf"

if [ ! -f "$CONFIG" ]; then
    echo "Configuration file not found."
    exit 1
fi

source "$CONFIG"

USER_NAME="${DEBIAN_USER:-$USERNAME}"

if [ -z "$USER_NAME" ]; then
    echo "Debian username is not configured."
    exit 1
fi

DISPLAY=":1"
GEOMETRY="1280x720"

echo "============================================"
echo " Starting TigerVNC"
echo "============================================"
echo

proot-distro login debian --user "$USER_NAME" -- bash -c "
vncserver -kill $DISPLAY >/dev/null 2>&1 || true
rm -f /tmp/.X1-lock
rm -f /tmp/.X11-unix/X1
rm -f ~/.config/tigervnc/*.pid

vncserver $DISPLAY -geometry $GEOMETRY -localhost no
"

echo

proot-distro login debian --user "$USER_NAME" -- vncserver -list

echo
echo "[OK] TigerVNC command finished."
