#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Debian User Module
# ============================================

CONFIG="$HOME/debian-termux-gui/config/user.conf"


if [ ! -f "$CONFIG" ]
then
    echo "Error: Configuration file not found."
    echo "Run setup.sh first."
    exit 1
fi


source "$CONFIG"


if [ -z "$USERNAME" ]
then
    echo "Error: Username not configured."
    exit 1
fi


echo "[INFO] Starting Debian session..."
echo "User: $USERNAME"


proot-distro login debian --user "$USERNAME"
