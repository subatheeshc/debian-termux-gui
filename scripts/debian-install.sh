#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Debian Installation Module
# ============================================

set -e

echo "============================================"
echo " Debian Installation"
echo "============================================"

echo

echo "[CHECK] Checking proot-distro..."

if ! command -v proot-distro >/dev/null 2>&1
then
    echo "[INFO] Installing proot-distro..."

    pkg update -y
    pkg install proot-distro -y
fi


echo

echo "[CHECK] Checking Debian container..."


if proot-distro list -q | grep -qx "debian"
then

    echo "[OK] Debian is already installed."

else

    echo "[INFO] Installing Debian..."

    proot-distro install debian

fi


echo

echo "[OK] Debian installation module ready."
