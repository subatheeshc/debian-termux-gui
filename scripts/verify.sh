#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Verification Module
# ============================================

set -e

CONFIG="$HOME/debian-termux-gui/config/user.conf"

if [ ! -f "$CONFIG" ]; then
    echo "[ERROR] Config file not found."
    exit 1
fi

source "$CONFIG"

echo "============================================"
echo " Installation Verification"
echo "============================================"
echo

# --------------------------------------------------
# Debian container
# --------------------------------------------------
echo "[CHECK] Debian container..."

if proot-distro list -q | grep -qx "debian"; then
    echo "[OK] Debian installed."
else
    echo "[ERROR] Debian not installed."
    exit 1
fi

echo

# --------------------------------------------------
# Debian user
# --------------------------------------------------
echo "[CHECK] Debian user..."

if proot-distro login debian -- id "$DEBIAN_USER" >/dev/null 2>&1; then
    echo "[OK] User '$DEBIAN_USER' found."
else
    echo "[ERROR] User '$DEBIAN_USER' not found."
    exit 1
fi

echo

# --------------------------------------------------
# Sudo
# --------------------------------------------------
echo "[CHECK] sudo..."

if proot-distro login debian -- command -v sudo >/dev/null 2>&1; then
    echo "[OK] sudo installed."
else
    echo "[ERROR] sudo not installed."
    exit 1
fi

echo

# --------------------------------------------------
# dbus-run-session
# --------------------------------------------------
echo "[CHECK] dbus-run-session..."

if proot-distro login debian -- command -v dbus-run-session >/dev/null 2>&1; then
    echo "[OK] dbus-run-session found."
else
    echo "[ERROR] dbus-run-session missing."
    exit 1
fi

echo

# --------------------------------------------------
# XFCE
# --------------------------------------------------
echo "[CHECK] XFCE..."

if proot-distro login debian -- command -v startxfce4 >/dev/null 2>&1; then
    echo "[OK] XFCE installed."
else
    echo "[ERROR] XFCE not installed."
    exit 1
fi

echo

# --------------------------------------------------
# Termux:X11
# --------------------------------------------------
echo "[CHECK] Termux:X11..."

if command -v termux-x11 >/dev/null 2>&1; then
    echo "[OK] Termux:X11 installed."
else
    echo "[ERROR] Termux:X11 not installed."
    exit 1
fi

echo
echo "============================================"
echo "[OK] Verification completed successfully."
echo "============================================"
