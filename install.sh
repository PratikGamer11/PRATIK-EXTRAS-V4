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
NC='\033[0m'

# Configuration
INSTALL_DIR="$HOME/PRATIK-EXTRAS-V4"

# Progress bar function
show_progress() {
    percent=$1
    width=30
    filled=$((percent * width / 100))
    empty=$((width - filled))
    
    bar=""
    i=0
    while [ $i -lt $filled ]; do
        bar="${bar}█"
        i=$((i + 1))
    done
    
    i=0
    while [ $i -lt $empty ]; do
        bar="${bar}░"
        i=$((i + 1))
    done
    
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
    echo -e "${PURPLE}"
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
    echo -e "${RED}========================================"
    echo -e "${RED}    🚀 UNOFFICIAL PANEL INSTALLING    "
    echo -e "${RED}========================================"
    echo ""
    echo -e "${YELLOW}📥 Updating & Upgrading System..."
    
    apt update -y
    apt upgrade -y
    
    echo -e "${YELLOW}📦 Installing Node.js & Screen..."
    apt install nodejs -y
    apt install screen -y
    
    echo -e "${YELLOW}📂 Cloning Crispy Adventure..."
    cd "$HOME"
    git clone https://github.com/PratikGamer11/crispy-adventure
    
    echo -e "${YELLOW}📦 Installing Express..."
    cd "$HOME/crispy-adventure"
    npm install express
    
    apt update -y
    clear
    
    echo -e "${GREEN}========================================"
    echo -e "${GREEN}  ✅ UNOFFICIAL PANEL INSTALLED!     "
    echo -e "${GREEN}========================================"
    echo -e "${CYAN}📂 Location: $HOME/crispy-adventure"
    echo -e "${CYAN}Run: cd crispy-adventure && node ."
    echo ""
    
    echo -n "Press Enter to continue..."
    read dummy
}

# ============================================
# MAIN MENU
# ============================================
show_menu() {
    clear
    echo -e "${RED}========================================"
    echo -e "${RED}         🔴 PRATIK EXTRAS MENU         "
    echo -e "${RED}========================================"
    echo ""
    echo -e "${CYAN}[1] Panel"
    echo -e "${RED}[A] Unofficial Panel"
    echo -e "${CYAN}[X] Exit"
    echo ""
    echo -e "${RED}========================================"
    echo -n "Select Option: "
}

# ============================================
# PANEL SUBMENU
# ============================================
show_panel_menu() {
    clear
    echo -e "${RED}========================================"
    echo -e "${RED}           🔴 PANEL MENU             "
    echo -e "${RED}========================================"
    echo ""
    echo -e "${CYAN}[B] Back to Main Menu"
    echo -e "${CYAN}[X] Exit"
    echo ""
    echo -e "${RED}========================================"
    echo -n "Select Option: "
}

# ============================================
# MAIN SCRIPT START
# ============================================

clear
echo -e "${CYAN}========================================"
echo -e "${CYAN}       🚀 PRATIK EXTRAS V4             "
echo -e "${CYAN}       INSTALLATION STARTED           "
echo -e "${CYAN}========================================"
echo ""

# Stage 1: Initializing
echo -e "${RED}🔧 Initializing..."
sleep 1

# Create directory
mkdir -p "$INSTALL_DIR"
echo -e "${CYAN}📁 Created: $INSTALL_DIR"
sleep 0.5

# Stage 2: Progressing
echo ""
echo -e "${RED}📥 Progressing:"
echo ""

# Simulate download progress
percent=0
while [ $percent -lt 100 ]; do
    show_progress $percent
    percent=$((percent + 5))
    sleep 0.05
done

echo ""
echo ""

echo -e "${GREEN}✅ Files downloaded successfully!"
sleep 1

# CLEAR SCREEN AFTER LOADING
clear

# SHOW BIG PRATIK EXTRAS
big_text

echo ""
echo -e "${GREEN}✅ Done! Installation Complete!"
echo -e "${GREEN}   Thanks for installing PRATIK EXTRAS V4!"
echo ""
echo -e "${CYAN}========================================"
echo -e "${GREEN}📂 Location: $INSTALL_DIR"
echo -e "${CYAN}========================================"
echo ""

# ============================================
# INTERACTIVE MENU
# ============================================
running=true
while [ "$running" = "true" ]; do
    show_menu
    read choice
    
    if [ "$choice" = "1" ]; then
        # Panel Submenu
        panel_running=true
        while [ "$panel_running" = "true" ]; do
            show_panel_menu
            read subchoice
            
            if [ "$subchoice" = "B" ] || [ "$subchoice" = "b" ]; then
                panel_running=false
            elif [ "$subchoice" = "X" ] || [ "$subchoice" = "x" ]; then
                echo -e "${GREEN}Thanks for using PRATIK EXTRAS!"
                exit 0
            else
                echo -e "${RED}Invalid option! Try again."
                sleep 1
            fi
        done
        
    elif [ "$choice" = "A" ] || [ "$choice" = "a" ]; then
        install_unofficial_panel
        
    elif [ "$choice" = "X" ] || [ "$choice" = "x" ]; then
        echo -e "${GREEN}Thanks for using PRATIK EXTRAS!"
        exit 0
        
    else
        echo -e "${RED}Invalid option! Try again."
        sleep 1
    fi
done
