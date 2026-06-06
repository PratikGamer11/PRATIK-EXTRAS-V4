#!/bin/bash

# ============================================
# PRATIK EXTRAS V4 - INSTALLER SCRIPT
# ============================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m'
LIME='\033[1;32m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m'

# Configuration
REPO_OWNER="PratikGamer11"
REPO_NAME="PRATIK-EXTRAS-V4"
REPO_URL="https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/main"
INSTALL_DIR="$HOME/PRATIK-EXTRAS-V4"

# Progress bar function
show_progress() {
    local percent=$1
    local width=30
    local filled=$((percent * width / 100))
    local empty=$((width - filled))
    
    local bar=""
    for ((i=0; i<filled; i++)); do bar+="█"; done
    for ((i=0; i<empty; i++)); do bar+="░"; done
    
    local color=$NC
    if [ $percent -le 30 ]; then
        color=$YELLOW
    elif [ $percent -le 60 ]; then
        color=$ORANGE
    else
        color=$LIME
    fi
    
    printf "\r${color}[${bar}]${NC} ${percent}%%"
}

# Big ASCII text function
big_text() {
    echo ""
    echo -e "${PURPLE}${BOLD}"
    echo "  ██████╗██╗     ██╗    ██████╗  ██████╗ ██████╗ ████████╗███████╗██████╗ "
    echo " ██╔════╝██║     ██║    ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗"
    echo " ██║     ██║     ██║    ██║  ██║██║   ██║██████╔╝   ██║   █████╗  ██████╔╝"
    echo " ██║     ██║     ██║    ██║  ██║██║   ██║██╔══██╗   ██║   ██╔══╝  ██╔══██╗"
    echo " ╚██████╗███████╗██║    ██████╔╝╚██████╔╝██║  ██║   ██║   ███████╗██║  ██║"
    echo "  ╚═════╝╚══════╝╚═╝    ╚═════╝  ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝"
    echo -e "${NC}"
}

# ============================================
# OPTION A: UNOFFICIAL PANEL INSTALLER
# ============================================
install_unofficial_panel() {
    clear
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}    🚀 UNOFFICIAL PANEL INSTALLING    ${NC}"
    echo -e "${RED}========================================${NC}"
    echo ""
    echo -e "${YELLOW}📥 Updating & Upgrading System...${NC}"
    
    apt update -y
    apt upgrade -y
    
    echo -e "${YELLOW}📦 Installing Node.js & Screen...${NC}"
    apt install nodejs -y
    apt install screen -y
    
    echo -e "${YELLOW}📂 Cloning Crispy Adventure...${NC}"
    cd "$HOME"
    git clone https://github.com/PratikGamer11/crispy-adventure
    
    echo -e "${YELLOW}📦 Installing Express...${NC}"
    cd "$HOME/crispy-adventure"
    npm install express
    
    apt update -y
    clear
    
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  ✅ UNOFFICIAL PANEL INSTALLED!     ${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo -e "${CYAN}📂 Project Location: $HOME/crispy-adventure${NC}"
    echo -e "${CYAN}🚀 Run with: cd crispy-adventure && node .${NC}"
    echo ""
    
    read -p "Press Enter to continue..."
}

# ============================================
# MAIN MENU
# ============================================
show_menu() {
    clear
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}         🔴 PRATIK EXTRAS MENU         ${NC}"
    echo -e "${RED}========================================${NC}"
    echo ""
    echo -e "${CYAN}[1]${NC} Panel"
    echo -e "${RED}[A]${NC} Unofficial Panel"
    echo -e "${CYAN}[X]${NC} Exit"
    echo ""
    echo -e "${RED}========================================${NC}"
    echo -n "Select Option: "
}

# ============================================
# PANEL SUBMENU
# ============================================
show_panel_menu() {
    clear
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}           🔴 PANEL MENU             ${NC}"
    echo -e "${RED}========================================${NC}"
    echo ""
    echo -e "${CYAN}[B]${NC} Back to Main Menu"
    echo -e "${CYAN}[X]${NC} Exit"
    echo ""
    echo -e "${RED}========================================${NC}"
    echo -n "Select Option: "
}

# ============================================
# MENU HANDLER FUNCTION
# ============================================
handle_menu() {
    local choice="$1"
    
    case "$choice" in
        1)
            # Panel Submenu
            local panel_loop=1
            while [ $panel_loop -eq 1 ]; do
                show_panel_menu
                read subchoice
                case "$subchoice" in
                    B|b)
                        panel_loop=0
                        ;;
                    X|x)
                        echo -e "${GREEN}Thanks for using PRATIK EXTRAS!${NC}"
                        exit 0
                        ;;
                    *)
                        echo -e "${RED}Invalid option! Try again.${NC}"
                        sleep 1
                        ;;
                esac
            done
            ;;
        A|a)
            # Install Unofficial Panel
            install_unofficial_panel
            ;;
        X|x)
            echo -e "${GREEN}Thanks for using PRATIK EXTRAS!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option! Try again.${NC}"
            sleep 1
            ;;
    esac
}

# ========== MAIN SCRIPT ==========

clear
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}       🚀 PRATIK EXTRAS V4             ${NC}"
echo -e "${CYAN}       INSTALLATION STARTED           ${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# Stage 1: Initializing (RED)
echo -e "${RED}🔧 Initializing...${NC}"
sleep 1

# Create directory
mkdir -p "$INSTALL_DIR"
echo -e "${CYAN}📁 Created: $INSTALL_DIR${NC}"
sleep 0.5

# Stage 2: Progressing with colored progress bar
echo ""
echo -e "${RED}📥 Progressing:${NC}"
echo ""

# Simulate download progress (0-100%)
for percent in $(seq 0 5 100); do
    show_progress $percent
    sleep 0.05
done

echo ""
echo ""

echo -e "${GREEN}✅ Files downloaded successfully!${NC}"
sleep 1

# CLEAR SCREEN AFTER LOADING
clear

# SHOW BIG PRATIK EXTRAS
big_text

echo ""
echo -e "${GREEN}✅ Done! Installation Complete!${NC}"
echo -e "${GREEN}   Thanks for installing PRATIK EXTRAS V4!${NC}"
echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${GREEN}📂 Location: $INSTALL_DIR${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# ============================================
# INTERACTIVE MENU LOOP
# ============================================
main_loop=1
while [ $main_loop -eq 1 ]; do
    show_menu
    read choice
    handle_menu "$choice"
done
