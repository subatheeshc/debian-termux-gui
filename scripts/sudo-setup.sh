#!/bin/bash

echo "[INFO] Installing sudo..."

apt update
apt install -y sudo

echo "[INFO] Configuring sudo access for Debian user..."

if [ -n "$DEBIAN_USER" ]; then
    echo "$DEBIAN_USER ALL=(ALL:ALL) ALL" > /etc/sudoers.d/$DEBIAN_USER
    chmod 440 /etc/sudoers.d/$DEBIAN_USER
else
    echo "DEBIAN_USER not found"
    exit 1
fi

echo "[OK] Sudo setup completed for $DEBIAN_USER"
