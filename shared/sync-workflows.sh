#!/bin/bash
# shared/sync-workflows.sh
# Syncs rules and templates from shared/ to all CLI directories
# Usage: ./shared/sync-workflows.sh

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get directories
SHARED_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SHARED_DIR/.." && pwd)"

echo -e "${GREEN}Syncing workflows from shared/ to all CLIs...${NC}\n"

# Check source directories exist
if [ ! -d "$SHARED_DIR/rules" ]; then
    echo -e "${RED}Error: $SHARED_DIR/rules not found${NC}"
    exit 1
fi

if [ ! -d "$SHARED_DIR/templates" ]; then
    echo -e "${RED}Error: $SHARED_DIR/templates not found${NC}"
    exit 1
fi

# Function to sync rules
sync_rules() {
    local target_dir="$1"
    local use_mdc="${2:-false}"
    local cli_name="$3"

    echo -e "${YELLOW}Syncing rules to $cli_name${NC}"

    # Create target directory
    mkdir -p "$target_dir"

    # Copy each rule file
    for rule in FACT-VERIFICATION INVESTIGATION-METHODS ITERATION-GATES SATISFACTORY-CRITERIA WRITING-STYLE; do
        local source="$SHARED_DIR/rules/${rule}.md"

        if [ ! -f "$source" ]; then
            echo -e "${RED}  ✗ ${rule}.md not found in source${NC}"
            continue
        fi

        local ext=".md"
        [ "$use_mdc" = "true" ] && ext=".mdc"
        local target="$target_dir/${rule}${ext}"

        cp "$source" "$target"
        echo -e "${GREEN}  ✓${NC} ${rule}${ext}"
    done
}

# Function to sync templates
sync_templates() {
    local target_dir="$1"
    local cli_name="$2"

    echo -e "${YELLOW}Syncing templates to $cli_name${NC}"

    # Create target directory
    mkdir -p "$target_dir"

    # Copy each template file
    for template in BUG DESIGN ESTIMATION FACT-CHECK FRD RELEASE REVIEW SPIKE STYLE-GUIDE TEST-PLAN; do
        local source="$SHARED_DIR/templates/${template}.md"

        if [ ! -f "$source" ]; then
            echo -e "${RED}  ✗ ${template}.md not found in source${NC}"
            continue
        fi

        local target="$target_dir/${template}.md"

        cp "$source" "$target"
        echo -e "${GREEN}  ✓${NC} ${template}.md"
    done
}

# Sync to Claude
sync_rules "$REPO_ROOT/claude/.claude/rules" "false" "Claude Code"
sync_templates "$REPO_ROOT/claude/.claude/templates" "Claude Code"
echo ""

# Sync to Cursor (use .mdc for rules)
sync_rules "$REPO_ROOT/cursor/.cursor/rules" "true" "Cursor"
sync_templates "$REPO_ROOT/cursor/.cursor/templates" "Cursor"
echo ""

# Sync to Windsurf .cascade
sync_rules "$REPO_ROOT/windsurf/.cascade/rules" "false" "Windsurf Cascade"
sync_templates "$REPO_ROOT/windsurf/.cascade/templates" "Windsurf Cascade"
echo ""

# Sync to Windsurf .windsurf
sync_rules "$REPO_ROOT/windsurf/.windsurf/rules" "false" "Windsurf Legacy"
sync_templates "$REPO_ROOT/windsurf/.windsurf/templates" "Windsurf Legacy"
echo ""

# Sync to Aider
sync_rules "$REPO_ROOT/aider/.aider/rules" "false" "Aider"
sync_templates "$REPO_ROOT/aider/.aider/templates" "Aider"
echo ""

echo -e "${GREEN}✓ Sync complete!${NC}"
echo -e "Rules and templates synced to all CLI directories."
