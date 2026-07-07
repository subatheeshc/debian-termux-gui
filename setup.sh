#!/data/data/com.termux/files/usr/bin/bash

echo "=== Debian Termux GUI Setup ==="

echo "[1/4] Installing required Termux packages..."
pkg update -y
pkg install proot-distro termux-x11-nightly git dbus -y

echo "[2/4] Installing Debian..."
if proot-distro list | grep -q debian; then
    echo "Debian available"
fi

echo "[3/4] Creating script directory..."
mkdir -p ~/debian-termux-gui

echo "[4/4] Setup complete"

echo ""
echo "Next steps:"
echo "1. Install Debian:"
echo "   proot-distro install debian"
echo ""
echo "2. Start GUI:"
echo "   ./scripts/start-debian-gui.sh"
