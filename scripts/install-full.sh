#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Full Installation Module
# ============================================

set -e
PROJECT_DIR="$HOME/debian-termux-gui"
SCRIPT_DIR="$PROJECT_DIR/scripts"
echo "============================================"
echo " Full Installation"
echo "============================================"

echo

echo "[INFO] Full installation started..."
echo
echo "[STEP] Installing Debian..."

bash "$SCRIPT_DIR/debian-install.sh"
echo
echo "[STEP] Creating Debian user..."

bash "$SCRIPT_DIR/create-user.sh"
echo
echo "[STEP] Configuring sudo access..."

bash "$SCRIPT_DIR/sudo-setup.sh"
echo
echo "[STEP] Installing XFCE Desktop..."

bash "$SCRIPT_DIR/xfce-setup.sh"
echo
echo "[STEP] Installing Firefox ESR..."

bash "$SCRIPT_DIR/firefox-setup.sh"
echo
echo "[STEP] Installing TigerVNC..."

bash "$SCRIPT_DIR/vnc-setup.sh"
# Future installation:
# - Debian installation
# - XFCE desktop
# - Firefox ESR
# - Utilities
# - VNC
# - Termux:X11
echo
echo "[STEP] Setting up Termux:X11..."

bash "$SCRIPT_DIR/x11-setup.sh"

echo
echo "[OK] Full installation module ready."
