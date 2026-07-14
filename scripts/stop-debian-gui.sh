#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Stop Debian GUI (Termux:X11)
# ============================================

set -e

echo "============================================"
echo " Stopping Debian GUI"
echo "============================================"

echo

echo "[STEP] Stopping XFCE..."

pkill -f xfce4-session >/dev/null 2>&1 || true
pkill -f startxfce4 >/dev/null 2>&1 || true

echo "[STEP] Stopping Termux:X11..."

pkill -f "termux-x11" >/dev/null 2>&1 || true

echo
echo "[OK] Debian GUI stopped."
