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

echo "[INFO] Installing XFCE desktop..."


proot-distro login debian -- bash -c "


apt install -y \
    xfce4 \
    xfce4-goodies \
    mousepad \
    thunar \
    xarchiver

"


echo

echo "[OK] XFCE installation completed."
