#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# Stop TigerVNC Server
# ============================================

set -e

DISPLAY_NUMBER=":1"

echo "============================================"
echo " Stopping TigerVNC"
echo "============================================"

echo

proot-distro login debian -- bash <<EOF

vncserver -kill "$DISPLAY_NUMBER" >/dev/null 2>&1 || true

EOF

echo
echo "[OK] TigerVNC server stopped."
echo
echo "Display: $DISPLAY_NUMBER"
