
#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# Debian Termux GUI Installer v4.0 Stable
# Foundation Part 1
# ============================================

set -e

VERSION="4.0.0"
PROJECT_NAME="debian-termux-gui"

PROJECT_DIR="$HOME/$PROJECT_NAME"
CONFIG_DIR="$PROJECT_DIR/config"
SCRIPT_DIR="$PROJECT_DIR/scripts"
LOG_DIR="$PROJECT_DIR/logs"

CONFIG_FILE="$CONFIG_DIR/user.conf"
LOG_FILE="$LOG_DIR/setup.log"


# Colors

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RESET="\033[0m"
# ============================================
# Logging Setup
# ============================================

mkdir -p "$LOG_DIR"

exec > >(tee -a "$LOG_FILE") 2>&1


# ============================================
# Error Handler
# ============================================

error_exit()
{
    echo -e "${RED}[ERROR]${RESET} Installation failed."
    echo "Check log file:"
    echo "$LOG_FILE"
    exit 1
}

trap error_exit ERR
# ============================================
# Installer Banner
# ============================================

clear

echo -e "${BLUE}"
echo "============================================"
echo " Debian Termux GUI Installer v$VERSION"
echo " Stable Release"
echo "============================================"
echo -e "${RESET}"

echo
echo "Project : $PROJECT_NAME"
echo "Location: $PROJECT_DIR"
echo


# ============================================
# Environment Check
# ============================================

check_environment()
{

    echo -e "${YELLOW}[CHECK]${RESET} Checking Termux environment..."


    if [ -z "$PREFIX" ]; then
        echo -e "${RED}[ERROR]${RESET} This script must run inside Termux."
        exit 1
    fi


    if ! command -v proot-distro >/dev/null 2>&1
    then
        echo -e "${YELLOW}[INFO]${RESET} Installing proot-distro..."

        pkg update -y
        pkg install proot-distro -y
    fi


    echo -e "${GREEN}[OK]${RESET} Environment ready."

}
# ============================================
# Create Directory Structure
# ============================================

create_structure()
{

    echo -e "${YELLOW}[SETUP]${RESET} Creating directories..."


    mkdir -p \
    "$PROJECT_DIR" \
    "$CONFIG_DIR" \
    "$SCRIPT_DIR" \
    "$LOG_DIR"


    echo -e "${GREEN}[OK]${RESET} Directory structure created."

}
# ============================================
# User Configuration
# ============================================

create_config()
{

    if [ ! -f "$CONFIG_FILE" ]
    then

        echo -e "${YELLOW}[CONFIG]${RESET} Creating configuration..."


        read -p "Enter Debian username (default: user): " USERNAME


if [ -z "$USERNAME" ]
then
    USERNAME="user"
fi


        cat > "$CONFIG_FILE" <<EOF
# Debian Termux GUI Configuration

VERSION=$VERSION

USERNAME=$USERNAME

DESKTOP=XFCE

INSTALL_MODE=FULL

EOF


        echo -e "${GREEN}[OK]${RESET} Configuration saved."

    else

        echo -e "${GREEN}[INFO]${RESET} Existing configuration found."

    fi

}
# ============================================
# Main Installer Execution
# ============================================

check_environment

create_structure

create_config


echo
echo -e "${GREEN}============================================${RESET}"
echo -e "${GREEN} Debian Termux GUI v$VERSION${RESET}"
echo -e "${GREEN} Foundation Setup Completed${RESET}"
echo -e "${GREEN}============================================${RESET}"

echo
echo "Next modules will add:"
echo "- Professional installer menu"
echo "- Minimal / Full installation"
echo "- Debian deployment"
echo "- XFCE Desktop setup"
echo "- Firefox ESR"
echo "- TigerVNC"
echo "- Verification system"
# ============================================
# Installer Menu
# ============================================

show_menu()
{

    clear

    echo -e "${BLUE}"
    echo "============================================"
    echo " Debian Termux GUI Installer v$VERSION"
    echo "============================================"
    echo -e "${RESET}"

    echo
    echo "1) Minimal Installation"
    echo "2) Full Installation"
    echo "3) Verify Installation"
    echo "4) Repair / Fix"
    echo "5) Exit"
    echo

}


installer_menu()
{

    while true
    do

        show_menu

        read -p "Select option: " CHOICE


        case $CHOICE in

            1)
    echo -e "${GREEN}[START]${RESET} Launching Minimal Installation..."

    bash "$SCRIPT_DIR/install-minimal.sh"

    break
    ;;


            2)
    echo -e "${GREEN}[START]${RESET} Launching Full Installation..."

    bash "$SCRIPT_DIR/install-full.sh"

    break
    ;;


            3)
    echo -e "${GREEN}[START]${RESET} Launching Verification..."

    bash "$SCRIPT_DIR/verify.sh"

    break
    ;;


            4)
    echo -e "${GREEN}[START]${RESET} Launching Repair Module..."

    bash "$SCRIPT_DIR/repair.sh"

    break
    ;;


            5)
    echo "Thank you for using Debian Termux GUI v$VERSION"
    echo
    echo "Installation session ended."
    exit 0
    ;;


            *)
                echo -e "${RED}Invalid option${RESET}"
                sleep 2
                ;;

        esac

    done

}
# ============================================
# Main Execution
# ============================================

check_environment

create_structure

create_config

installer_menu
# ============================================
# Finish Screen
# ============================================

finish_screen()
{

    clear

    echo -e "${GREEN}"
    echo "============================================"
    echo " Debian Termux GUI v$VERSION"
    echo " Installation Completed"
    echo "============================================"
    echo -e "${RESET}"

    echo
    echo "Username : $USERNAME"
    echo "Desktop  : $DESKTOP"
    echo "Mode     : $INSTALL_MODE"
    echo

    echo "Thank you for using Debian Termux GUI."
    echo

}


finish_screen
