#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Termux:X11 Setup Module
# ============================================

set -e

echo "============================================"
echo " Termux:X11 Setup"
echo "============================================"

echo

echo "[CHECK] Updating repositories..."

pkg update -y


if ! command -v termux-x11 >/dev/null 2>&1
then

    echo "[INFO] Installing X11 repository..."

    pkg install x11-repo -y


    echo "[INFO] Installing Termux:X11..."

    pkg install termux-x11-nightly -y

else

    echo "[OK] Termux:X11 already installed."

fi


echo

echo "[OK] X11 setup completed."
