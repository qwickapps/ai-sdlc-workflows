#!/bin/bash
# update.sh - Update global AI SDLC Workflows installation
# Usage: ~/.ai-sdlc-workflows/update.sh

set -e

INSTALL_DIR="${AI_SDLC_HOME:-$HOME/.ai-sdlc-workflows}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   AI SDLC Workflows - Update           ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Verify installation exists
if [[ ! -d "$INSTALL_DIR" ]]; then
    echo -e "${RED}Error: Installation not found at $INSTALL_DIR${NC}"
    echo ""
    echo "Install first with:"
    echo "  curl -fsSL https://raw.githubusercontent.com/qwickapps/ai-sdlc-workflows/main/install.sh | bash"
    exit 1
fi

cd "$INSTALL_DIR"

# Get current version
OLD_VERSION=$(git describe --tags 2>/dev/null || git rev-parse --short HEAD)
echo "Current version: $OLD_VERSION"

# Check for local changes
if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    echo -e "${YELLOW}Warning: Local changes detected. Stashing...${NC}"
    git stash --quiet
fi

# Fetch and check for updates
git fetch origin main --quiet

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [[ "$LOCAL" == "$REMOTE" ]]; then
    echo -e "${GREEN}Already up to date.${NC}"
else
    echo "Updating..."
    git pull --ff-only origin main

    # Make scripts executable
    chmod +x "$INSTALL_DIR"/*.sh 2>/dev/null || true
    chmod +x "$INSTALL_DIR/shared/validators"/*.sh 2>/dev/null || true

    NEW_VERSION=$(git describe --tags 2>/dev/null || git rev-parse --short HEAD)
    echo -e "${GREEN}Updated: $OLD_VERSION → $NEW_VERSION${NC}"

    # Show what changed
    echo ""
    echo -e "${BLUE}Changes:${NC}"
    git log --oneline "$LOCAL..$REMOTE" | head -10
fi

echo ""
echo -e "${GREEN}Update complete!${NC}"
echo ""
echo "All projects using symlinks are automatically updated."
echo ""
echo -e "${YELLOW}Note:${NC} If you have projects with copied files (Windows fallback),"
echo "re-run setup.sh in those projects to get updates:"
echo "  $INSTALL_DIR/setup.sh --claude --force"
echo ""
