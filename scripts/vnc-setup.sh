#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI
# TigerVNC Setup Module
# ============================================

set -e

echo "============================================"
echo " TigerVNC Setup"
echo "============================================"

echo
echo "[INFO] Installing TigerVNC..."

proot-distro login debian -- bash <<'EOF'

apt install -y tigervnc-standalone-server

mkdir -p ~/.vnc

cat > ~/.vnc/xstartup <<'EOT'
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

export XDG_SESSION_DESKTOP=XFCE
export XDG_CURRENT_DESKTOP=XFCE

exec startxfce4
EOT

chmod +x ~/.vnc/xstartup

EOF

echo
echo "[OK] TigerVNC installation completed."
