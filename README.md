# Debian Termux GUI

![GitHub release](https://img.shields.io/github/v/release/subatheeshc/debian-termux-gui)
![GitHub license](https://img.shields.io/github/license/subatheeshc/debian-termux-gui)
![GitHub stars](https://img.shields.io/github/stars/subatheeshc/debian-termux-gui)
![Platform](https://img.shields.io/badge/platform-Android-green)
![Desktop](https://img.shields.io/badge/Desktop-XFCE-blue)

Run Debian Linux with XFCE Desktop Environment inside Termux with GUI support.

---
# Debian Termux GUI

A modular automation project to install and run a complete **Debian Linux XFCE Desktop Environment** on Android using **Termux**, **PRoot-Distro**, and **Termux:X11**.

Debian Termux GUI makes it easy to create a Linux desktop environment on Android with automated installation scripts, user management, desktop configuration, and GUI launcher tools.

---

# Features

## Debian System

- Automated Debian installation
- Debian user creation
- Root user support
- Normal user support
- Automatic sudo configuration
- User customization
- Configuration-based installation

---

## Desktop Environment

- XFCE Desktop Environment
- Lightweight Linux desktop
- Desktop session management
- GUI start and stop scripts
- Android-friendly desktop experience

---

## GUI Support

- Termux:X11 integration
- Display configuration automation
- Linux desktop on Android
- Easy GUI launching

---

## Installer Features

- Modular shell scripts
- Full installation mode
- Simple configuration system
- Automatic dependency installation
- Easy maintenance and updates

---

# Requirements

Before installation, make sure you have:

## Device Requirements

- Android 8.0 or newer
- ARM64 device recommended
- Minimum 4GB free storage

Recommended:

- 4GB RAM or higher
- 6GB+ free storage

---

## Software Requirements

Required applications:

- Latest Termux
- Termux:X11
- Internet connection

Install Termux:X11 from the official source before starting the GUI setup.

---

# Installation

## Clone Repository

```bash
git clone https://github.com/subatheeshc/debian-termux-gui.git
```

Enter the project directory:

```bash
cd debian-termux-gui
```

Give permission:

```bash
chmod +x setup.sh
```

Run installer:

```bash
./setup.sh
```

Follow the instructions shown by the installer.

---

# Automatic Installation Process

The installer will:

- Update Termux packages
- Install required dependencies
- Install PRoot-Distro
- Install Debian Linux
- Create Debian user
- Configure user permissions
- Install XFCE Desktop
- Install Firefox ESR
- Setup Termux:X11
- Create GUI launcher scripts

---

# Configuration

Main configuration file:

```
config/user.conf
```

Example:

```bash
VERSION=4.0.0

USERNAME=fox

DEBIAN_USER=fox

DESKTOP=XFCE

INSTALL_MODE=FULL
```

You can customize the Debian username before installation.

---

# Starting Debian GUI

Start the Debian XFCE desktop:

```bash
bash scripts/start-debian-gui.sh
```

The launcher will:

- Start Termux:X11
- Enter Debian environment
- Set display variables
- Start XFCE Desktop

---

# Stopping Debian GUI

Stop the desktop session:

```bash
bash scripts/stop-debian-gui.sh
```

---

# Project Structure

```
debian-termux-gui/

├── config/
│   └── user.conf
│
├── scripts/
│
│   ├── setup.sh
│   ├── install-full.sh
│   │
│   ├── debian-install.sh
│   ├── create-user.sh
│   ├── xfce-setup.sh
│   ├── firefox-setup.sh
│   ├── x11-setup.sh
│   │
│   ├── start-debian-gui.sh
│   ├── stop-debian-gui.sh
│   │
│   └── vnc/
│
├── README.md
├── LICENSE
└── CHANGELOG.md
```

---

# Components Status

| Component | Status |
|---|---|
| Debian Installation | Stable |
| User Management | Stable |
| XFCE Desktop | Stable |
| Firefox ESR | Stable |
| Termux:X11 | Stable |
| TigerVNC | Experimental |

---

# TigerVNC Support

TigerVNC support is currently experimental.

The recommended GUI method is:

```
Termux:X11
```

Future versions will improve:

- VNC stability
- Session management
- Automatic recovery
- Diagnostics

---

# Troubleshooting

## Termux:X11 Not Found

Install:

```bash
pkg install x11-repo
pkg install termux-x11-nightly
```

---

## Check Configuration

```bash
cat config/user.conf
```

---

## Check Debian Installation

```bash
proot-distro list
```

---

## Restart GUI

Stop:

```bash
bash scripts/stop-debian-gui.sh
```

Start:

```bash
bash scripts/start-debian-gui.sh
```

---

# Roadmap

## Version 4.0.0

Current release:

- Debian automation
- XFCE desktop installation
- Firefox ESR
- Termux:X11 support
- Modular installer

---

## Version 4.1.0

Planned:

- Improved VNC module
- Better logging
- Auto diagnostics
- Auto repair system
- Improved error handling

---

## Version 5.0.0

Future:

- GUI installer
- Plugin system
- Backup and restore
- Update manager
- Multiple desktop environments
- Theme manager

---

# Contributing

Contributions are welcome.

You can help by:

- Reporting bugs
- Suggesting features
- Improving scripts
- Testing on different devices

Steps:

1. Fork this repository
2. Create a feature branch
3. Commit changes
4. Submit a Pull Request

---

# License

This project is licensed under the MIT License.

See:

```
LICENSE
```

for details.

---

# Author

**subatheeshc**

GitHub:

https://github.com/subatheeshc

Repository:

https://github.com/subatheeshc/debian-termux-gui

---

# Acknowledgements

Special thanks to:

- Termux Project
- Termux:X11 Project
- PRoot-Distro
- Debian Project
- XFCE Desktop Project
- TigerVNC Project

---

# Support

If you like this project:

⭐ Star the repository

🐛 Report issues

💡 Share improvements

---

Made with ❤️ for Android Linux enthusiasts.
