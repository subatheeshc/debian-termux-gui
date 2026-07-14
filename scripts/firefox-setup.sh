#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Firefox ESR Module
# ============================================

set -e

echo "============================================"
echo " Firefox ESR Setup"
echo "============================================"

echo

echo "[INFO] Installing Firefox ESR..."

proot-distro login debian -- bash -c "


apt install -y firefox-esr

"

echo

echo "[OK] Firefox ESR installation completed."
