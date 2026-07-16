#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# XFCE Desktop Setup Module
# ============================================

set -e

echo "============================================"
echo " XFCE Desktop Setup"
echo "============================================"
echo

echo "[INFO] Installing XFCE Desktop..."

proot-distro login debian -- bash -c "

apt update

apt install -y \
    xfce4 \
    xfce4-goodies \
    dbus-x11 \
    dbus-user-session \
    mousepad \
    thunar \
    xarchiver \
    firefox-esr \
    nmap

"

echo
echo "[CHECK] Verifying XFCE installation..."

if proot-distro login debian -- command -v startxfce4 >/dev/null 2>&1; then
    echo "[OK] XFCE installed."
else
    echo "[ERROR] XFCE installation failed."
    exit 1
fi

echo

echo "[CHECK] Verifying dbus-run-session..."

if proot-distro login debian -- command -v dbus-run-session >/dev/null 2>&1; then
    echo "[OK] dbus-run-session installed."
else
    echo "[ERROR] dbus-run-session not found."
    exit 1
fi

echo
echo "[OK] XFCE setup completed."
