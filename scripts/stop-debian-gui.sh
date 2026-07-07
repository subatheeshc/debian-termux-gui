#!/data/data/com.termux/files/usr/bin/bash

echo "Stopping Debian GUI..."

pkill -f xfce4-session
pkill -f startxfce4
pkill -f dbus-launch

echo "Stopping Termux:X11..."

pkill -f "termux-x11 :0"

echo "Done."
