#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

banner() {
clear
echo -e "${CYAN}"
banner() {
clear

echo -e "\e[1;36m"

cat << "EOF"
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
EOF

echo -e "\e[0m"
}
echo -e "${NC}"
}

install_unofficial_panel() {

echo -e "${GREEN}[+] Updating System...${NC}"
apt update -y && apt upgrade -y

echo -e "${GREEN}[+] Installing Packages...${NC}"
apt install -y nodejs screen git npm

echo -e "${GREEN}[+] Cloning Repository...${NC}"
git clone https://github.com/PratikGamer11/crispy-adventure

cd crispy-adventure || exit

echo -e "${GREEN}[+] Installing Express...${NC}"
npm install express

echo
echo -e "${GREEN}Installation Completed Successfully!${NC}"
}

unofficial_menu() {
while true; do

banner

echo -e "${YELLOW}========================================${NC}"
echo -e "${GREEN}         PANEL OPTIONS${NC}"
echo -e "${YELLOW}========================================${NC}"
echo

echo -e "${CYAN}[A] UnOfficial Panel${NC}"
echo -e "${RED}[0] Back${NC}"
echo

read -rp "Select Option: " option

case "$option" in
A|a)
install_unofficial_panel
read -n 1 -s -r -p "Press any key to continue..."
;;
0)
main_menu
;;
*)
echo "Invalid Option"
sleep 2
;;
esac

done
}

main_menu() {
while true; do

banner

echo -e "${YELLOW}========================================${NC}"
echo -e "${GREEN}          MAIN MENU${NC}"
echo -e "${YELLOW}========================================${NC}"
echo

echo -e "${RED}[1] Panel${NC}"
echo -e "${RED}[0] Exit${NC}"
echo

read -rp "Select Option: " choice

case "$choice" in
1)
unofficial_menu
;;
0)
clear
exit
;;
*)
echo "Invalid Option"
sleep 2
;;
esac

done
}

main_menu
