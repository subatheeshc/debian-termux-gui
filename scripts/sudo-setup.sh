#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Sudo Setup Module
# ============================================

set -e

CONFIG="$HOME/debian-termux-gui/config/user.conf"

if [ ! -f "$CONFIG" ]; then
    echo "[ERROR] Config file not found."
    exit 1
fi

source "$CONFIG"

echo "============================================"
echo " Sudo Setup"
echo "============================================"
echo
if [ -z "$DEBIAN_USER" ]; then
    echo "[ERROR] DEBIAN_USER is not configured."
    exit 1
fi

echo "[INFO] Configuring sudo for $DEBIAN_USER..."

proot-distro login debian -- bash -c "
apt update
apt install -y sudo

usermod -aG sudo $DEBIAN_USER
"
echo
echo "[OK] Sudo setup completed."
