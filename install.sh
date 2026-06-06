#!/bin/bash

# ============================================
# PROGRESS BAR INSTALLER WITH COLOR CHANGES
# ============================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m'      # Orange/Brown
LIME='\033[1;32m'       # Bright Green
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m'            # No Color

# Progress bar function
show_progress() {
    local percent=$1
    local width=30
    local filled=$((percent * width / 100))
    local empty=$((width - filled))
    
    # Build bar
    local bar=""
    for ((i=0; i<filled; i++)); do
        bar+="█"
    done
    for ((i=0; i<empty; i++)); do
        bar+="░"
    done
    
    # Color based on percentage
    local color=$NC
    if [ $percent -le 30 ]; then
        color=$YELLOW
    elif [ $percent -le 60 ]; then
        color=$ORANGE
    else
        color=$LIME
    fi
    
    # Print progress bar
    printf "\r${color}[${bar}]${NC} ${percent}%%"
}

# Function to display big text (simple method)
big_text() {
    echo ""
    echo -e "${PURPLE}${BOLD}"
    echo "  ██████╗ ███████╗████████╗██████╗  ██████╗ ██████╗  "
    echo "  ██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██╔══██╗ "
    echo "  ██║  ██║█████╗     ██║   ██████╔╝██║   ██║██████╔╝ "
    echo "  ██║  ██║██╔══╝     ██║   ██╔══██╗██║   ██║██╔══██╗ "
    echo "  ██████╔╝███████╗   ██║   ██║  ██║╚██████╔╝██║  ██║ "
    echo "  ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ "
    echo "  ██████╗██████╗ ███████╗ █████╗  ██████╗██╗  ██╗"
    echo "  ██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝██║  ██║"
    echo "  ██║  ██║██████╔╝█████╗  ███████║██║     ███████║"
    echo "  ██║  ██║██╔══██╗██╔══╝  ██╔══██║██║     ██╔══██║"
    echo "  ██████╔╝██║  ██║███████╗██║  ██║╚██████╗██║  ██║"
    echo "  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝"
    echo -e "${NC}"
}

# Clear screen and show header
clear
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}       🚀 INSTALLATION STARTED         ${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# Stage 1: Initializing (Red text)
echo -e "${RED}🔧 Initializing...${NC}"
sleep 1

# Stage 2: Progressing with colored progress bar
echo -e "${RED}📥 Progressing:${NC}"
echo ""

# Simulate download progress (0-100%)
for percent in $(seq 0 5 100); do
    show_progress $percent
    sleep 0.08
done

echo ""
echo ""

# Stage 3: Done! (Green text)
echo -e "${GREEN}✅ Done! Installation Complete!${NC}"
echo -e "${GREEN}   Thanks for installing!${NC}"
echo ""

# Show BIG PRATIK EXTRAS
big_text

echo ""
echo -e "${CYAN}========================================${NC}"
