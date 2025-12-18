#!/bin/bash
# install.sh - Global installation of AI SDLC Workflows
# Usage: curl -fsSL https://raw.githubusercontent.com/qwickapps/ai-sdlc-workflows/main/install.sh | bash
#    or: ./install.sh

set -e

INSTALL_DIR="${AI_SDLC_HOME:-$HOME/.ai-sdlc-workflows}"
REPO_URL="https://github.com/qwickapps/ai-sdlc-workflows.git"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   AI SDLC Workflows - Installation     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Check for git
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: git is required but not installed.${NC}"
    echo "Please install git and try again."
    exit 1
fi

# Clone or update
if [[ -d "$INSTALL_DIR" ]]; then
    echo -e "${YELLOW}Existing installation found at $INSTALL_DIR${NC}"
    echo "Updating..."

    cd "$INSTALL_DIR"

    # Check for local changes
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        echo -e "${YELLOW}Warning: Local changes detected. Stashing...${NC}"
        git stash --quiet
    fi

    git pull --ff-only origin main
    echo -e "${GREEN}Updated to latest version.${NC}"
else
    echo "Installing to: $INSTALL_DIR"
    git clone "$REPO_URL" "$INSTALL_DIR"
    echo -e "${GREEN}Cloned successfully.${NC}"
fi

# Make scripts executable
chmod +x "$INSTALL_DIR"/*.sh 2>/dev/null || true
chmod +x "$INSTALL_DIR/shared/validators"/*.sh 2>/dev/null || true

# Get version info
cd "$INSTALL_DIR"
VERSION=$(git describe --tags 2>/dev/null || git rev-parse --short HEAD)

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Version: $VERSION"
echo "Location: $INSTALL_DIR"
echo ""
echo -e "${BLUE}Supported AI CLIs:${NC}"
echo "  - Claude Code (.claude/)"
echo "  - Cursor (.cursor/)"
echo "  - Windsurf (.cascade/)"
echo "  - Aider (.aider/)"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Navigate to your project directory"
echo "  2. Run setup for your preferred CLI(s):"
echo ""
echo "     ${GREEN}$INSTALL_DIR/setup.sh --claude${NC}     # Claude Code"
echo "     ${GREEN}$INSTALL_DIR/setup.sh --cursor${NC}     # Cursor"
echo "     ${GREEN}$INSTALL_DIR/setup.sh --windsurf${NC}   # Windsurf"
echo "     ${GREEN}$INSTALL_DIR/setup.sh --aider${NC}      # Aider"
echo "     ${GREEN}$INSTALL_DIR/setup.sh --all${NC}        # All CLIs"
echo ""
echo "  3. Customize the generated config files for your project"
echo ""
echo -e "${BLUE}To update later:${NC}"
echo "     $INSTALL_DIR/update.sh"
echo ""
