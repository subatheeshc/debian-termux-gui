#!/data/data/com.termux/files/usr/bin/bash

CONFIG="$HOME/debian-termux-gui/config/user.conf"

if [ ! -f "$CONFIG" ]
then
    echo "Config not found."
    exit 1
fi

source "$CONFIG"

if [ -z "$USERNAME" ]
then
    echo "Username not configured."
    exit 1
fi

echo "[INFO] Creating Debian user: $USERNAME"

proot-distro login debian -- bash -c "
if id $USERNAME >/dev/null 2>&1
then
    echo '[OK] User already exists.'
else
    apt update
    apt install sudo -y
    useradd -m -s /bin/bash $USERNAME
    echo '[OK] User created.'
fi
"

echo "[OK] User setup completed."
