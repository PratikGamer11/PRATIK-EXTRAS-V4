#!/bin/bash

clear

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Please run as root${NC}"
    exit 1
fi

██████╗ ██████╗  █████╗ ████████╗██╗██╗  ██╗
██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║██║ ██╔╝
██████╔╝██████╔╝███████║   ██║   ██║█████╔╝
██╔═══╝ ██╔══██╗██╔══██║   ██║   ██║██╔═██╗
██║     ██║  ██║██║  ██║   ██║   ██║██║  ██╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═╝

███████╗██╗  ██╗████████╗██████╗  █████╗ ███████╗
██╔════╝╚██╗██╔╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
█████╗   ╚███╔╝    ██║   ██████╔╝███████║███████╗
██╔══╝   ██╔██╗    ██║   ██╔══██╗██╔══██║╚════██║
███████╗██╔╝ ██╗   ██║   ██║  ██║██║  ██║███████║
╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

██╗   ██╗██╗  ██╗
██║   ██║██║  ██║
██║   ██║███████║
╚██╗ ██╔╝╚════██║
 ╚████╔╝      ██║
  ╚═══╝       ╚═╝

install_unofficial_panel() {
    echo -e "${GREEN}[+] Updating system...${NC}"
    apt update -y
    apt upgrade -y

    echo -e "${GREEN}[+] Installing requirements...${NC}"
    apt install -y curl wget git screen nodejs npm

    echo -e "${GREEN}[+] Cloning repository...${NC}"
    cd /root || exit

    rm -rf crispy-adventure

    git clone https://github.com/PratikGamer11/crispy-adventure

    cd crispy-adventure || exit

    echo -e "${GREEN}[+] Installing Express...${NC}"
    npm install express

    echo
    echo -e "${GREEN}=========================================${NC}"
    echo -e "${GREEN}Unofficial Panel Installed Successfully!${NC}"
    echo -e "${GREEN}=========================================${NC}"

    exit 0
}

panel_menu() {
    while true; do
        banner

        echo "A) Unofficial Panel"
        echo "B) Back"
        echo

        read -rp "Select Option: " choice

        case "$choice" in
            A|a)
                install_unofficial_panel
                ;;
            B|b)
                main_menu
                ;;
            *)
                echo "Invalid option."
                sleep 2
                ;;
        esac
    done
}

main_menu() {
    while true; do
        banner

        echo "1) Panel"
        echo "0) Exit"
        echo

        read -rp "Select Option: " option

        case "$option" in
            1)
                panel_menu
                ;;
            0)
                exit 0
                ;;
            *)
                echo "Invalid option."
                sleep 2
                ;;
        esac
    done
}

main_menu
