Debian Termux GUI Setup

Automated setup project to run Debian Linux with XFCE GUI on Android using Termux, proot-distro and Termux:X11.

Features

- Debian installation automation
- XFCE desktop environment setup
- Termux:X11 GUI support
- Root user and normal user support
- Automatic sudo configuration
- GUI start and stop launcher scripts
- Username customization
- Git backup support

Requirements

Before starting:

- Android device
- Latest Termux
- Termux:X11 application
- Internet connection
- Enough storage space

Install Termux:X11 from the official source and keep it ready before starting GUI.

Installation

Clone the repository:

git clone https://github.com/subatheeshc/debian-termux-gui.git
cd debian-termux-gui

Give permission:

chmod +x setup.sh

Run setup:

./setup.sh

The installer will:

- Install required Termux packages
- Install Debian using proot-distro
- Install XFCE desktop
- Create Debian user
- Configure sudo permission
- Prepare GUI scripts

Debian Login

Root user

proot-distro login debian --user root

Normal user

proot-distro login debian --user YOUR_USERNAME

Sudo Test

Inside Debian:

sudo whoami

Expected:

root

GUI Start

Start Termux:X11 application first.

Then run:

~/debian-termux-gui/scripts/start-debian-gui.sh

GUI Stop

~/debian-termux-gui/scripts/stop-debian-gui.sh

Scripts

scripts/
├── debian-root.sh
├── debian-user.sh
├── start-debian-gui.sh
└── stop-debian-gui.sh

debian-root.sh

Open Debian as root user.

debian-user.sh

Open Debian as normal user.

start-debian-gui.sh

Starts Debian XFCE desktop through Termux:X11.

stop-debian-gui.sh

Stops GUI processes safely.

Important Notes

- This project does not require Android root access.
- It uses proot-distro, so some kernel-level features are unavailable.
- Performance depends on device hardware.
- GUI performance is better on devices with higher RAM and CPU power.

Backup

Create a local backup:

tar -czvf debian-termux-gui-backup.tar.gz debian-termux-setup

Restore:

tar -xzvf debian-termux-gui-backup.tar.gz

Troubleshooting

GUI does not start

Check:

- Termux:X11 is running
- Display variable is configured
- Debian packages are installed correctly

Sudo problem

Login as root and check:

groups YOUR_USERNAME

The user should belong to the sudo group.

License

This project is provided for learning, development and personal use.
