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
    clear
done

echo ""
echo ""

echo -e "${GREEN}✅ Files downloaded successfully!${NC}"
sleep 1

# ============================================
# CLEAR SCREEN AFTER LOADING
# ============================================
clear

# ============================================
# SHOW BIG PRATIK EXTRAS
# ============================================
big_text

echo ""
echo -e "${GREEN}✅ Done! Installation Complete!${NC}"
echo -e "${GREEN}   Thanks for installing PRATIK EXTRAS V4!${NC}"
echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${GREEN}📂 Location: $INSTALL_DIR${NC}"
echo -e "${CYAN}========================================${NC}"
