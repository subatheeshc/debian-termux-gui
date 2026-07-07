#!/data/data/com.termux/files/usr/bin/bash

echo "=== Debian Termux GUI Setup v2 ==="

echo "[1/6] Updating Termux..."
pkg update -y

echo "[2/6] Installing required packages..."
pkg install proot-distro termux-x11-nightly dbus git -y

echo ""
read -p "Enter Debian username: " USERNAME

if [ -z "$USERNAME" ]; then
    USERNAME="linuxuser"
fi

echo "Using user: $USERNAME"

echo "[3/6] Installing Debian..."

if proot-distro list | grep -q "debian"; then
    echo "Debian is available"
fi

if [ ! -d "$PREFIX/var/lib/proot-distro/installed-rootfs/debian" ]; then
    proot-distro install debian
else
    echo "Debian already installed"
fi


echo "[4/6] Configuring Debian user..."

proot-distro login debian --user root -- bash -c "
apt update
apt install sudo xfce4 xfce4-goodies dbus-x11 -y

if ! id $USERNAME >/dev/null 2>&1; then
    useradd -m -s /bin/bash $USERNAME
fi

echo '$USERNAME ALL=(ALL:ALL) ALL' > /etc/sudoers.d/$USERNAME
chmod 440 /etc/sudoers.d/$USERNAME
"


echo "[5/6] Installing launcher scripts..."

mkdir -p ~/debian-termux-gui/scripts

if [ -d "./scripts" ]; then
    cp ./scripts/*.sh ~/debian-termux-gui/scripts/
    chmod +x ~/debian-termux-gui/scripts/*.sh
fi


echo "[6/6] Complete"

echo ""
echo "Login:"
echo "proot-distro login debian --user $USERNAME"
echo ""
echo "GUI:"
echo "~/debian-termux-gui/scripts/start-debian-gui.sh"
