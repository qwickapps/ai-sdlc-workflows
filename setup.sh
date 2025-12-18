#!/bin/bash
# setup.sh - Per-project setup for AI SDLC Workflows
# Usage: ~/.ai-sdlc-workflows/setup.sh --claude [--cursor] [--windsurf] [--aider] [--all]

set -e

INSTALL_DIR="${AI_SDLC_HOME:-$HOME/.ai-sdlc-workflows}"
TARGET_DIR="${PWD}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

show_help() {
    echo "AI SDLC Workflows - Project Setup"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --claude      Set up Claude Code (.claude/)"
    echo "  --cursor      Set up Cursor (.cursor/)"
    echo "  --windsurf    Set up Windsurf (.cascade/)"
    echo "  --aider       Set up Aider (.aider/)"
    echo "  --all         Set up all supported CLIs"
    echo "  --target DIR  Target directory (default: current directory)"
    echo "  --force       Overwrite existing symlinks"
    echo "  --help, -h    Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --claude                    # Set up Claude Code only"
    echo "  $0 --claude --windsurf         # Set up Claude and Windsurf"
    echo "  $0 --all                       # Set up all CLIs"
    echo "  $0 --claude --target ~/myproj  # Set up in specific directory"
}

# Parse arguments
TOOLS=()
FORCE=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --claude) TOOLS+=("claude") ;;
        --cursor) TOOLS+=("cursor") ;;
        --windsurf) TOOLS+=("windsurf") ;;
        --aider) TOOLS+=("aider") ;;
        --all) TOOLS=("claude" "cursor" "windsurf" "aider") ;;
        --target) TARGET_DIR="$2"; shift ;;
        --force) FORCE=true ;;
        --help|-h) show_help; exit 0 ;;
        *) echo -e "${RED}Unknown option: $1${NC}"; show_help; exit 1 ;;
    esac
    shift
done

# Default to claude if no tool specified
if [[ ${#TOOLS[@]} -eq 0 ]]; then
    echo -e "${YELLOW}No CLI specified. Defaulting to Claude Code.${NC}"
    echo "Use --help to see all options."
    echo ""
    TOOLS=("claude")
fi

# Verify installation exists
if [[ ! -d "$INSTALL_DIR" ]]; then
    echo -e "${RED}Error: AI SDLC Workflows not installed.${NC}"
    echo ""
    echo "Install first with:"
    echo "  curl -fsSL https://raw.githubusercontent.com/qwickapps/ai-sdlc-workflows/main/install.sh | bash"
    exit 1
fi

# Verify target directory exists
if [[ ! -d "$TARGET_DIR" ]]; then
    echo -e "${RED}Error: Target directory does not exist: $TARGET_DIR${NC}"
    exit 1
fi

# Function to create symlink with fallback
create_link() {
    local source="$1"
    local target="$2"
    local name=$(basename "$target")

    # Skip if target already exists and is not a symlink (local override)
    if [[ -e "$target" && ! -L "$target" ]]; then
        echo -e "  ${YELLOW}⊘${NC} $name ${CYAN}(local override exists)${NC}"
        return 0
    fi

    # Handle existing symlink
    if [[ -L "$target" ]]; then
        if [[ "$FORCE" == "true" ]]; then
            rm "$target"
        else
            # Check if it points to our installation
            local current_target=$(readlink "$target" 2>/dev/null || true)
            if [[ "$current_target" == "$source" ]]; then
                echo -e "  ${GREEN}✓${NC} $name ${CYAN}(already linked)${NC}"
                return 0
            else
                rm "$target"
            fi
        fi
    fi

    # Create symlink
    if ln -sf "$source" "$target" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} $name"
    else
        # Fallback: copy with marker (for systems where symlinks fail)
        cp "$source" "$target"
        echo "$source" > "${target}.ai-sdlc-source"
        echo -e "  ${YELLOW}⊕${NC} $name ${CYAN}(copied - symlink failed)${NC}"
    fi
}

# Function to add gitignore entries
add_gitignore_entries() {
    local gitignore="$1/.gitignore"
    local entries=(
        "# AI SDLC Workflows - local files"
        ".claude/engineering/"
        ".claude/settings.local.json"
        ".cursor/engineering/"
        ".cascade/engineering/"
        ".windsurf/engineering/"
        ".aider/engineering/"
        "*.ai-sdlc-source"
    )

    # Create .gitignore if it doesn't exist
    touch "$gitignore"

    for entry in "${entries[@]}"; do
        if ! grep -qF "$entry" "$gitignore" 2>/dev/null; then
            echo "$entry" >> "$gitignore"
        fi
    done
}

# ============================================================================
# CLAUDE CODE SETUP
# ============================================================================
setup_claude() {
    local target="$TARGET_DIR/.claude"
    echo -e "${BLUE}━━━ Claude Code ━━━${NC}"

    # Create directories
    mkdir -p "$target/commands" "$target/templates" "$target/rules" \
             "$target/agents" "$target/validators" "$target/engineering"

    # Commands
    echo -e "${CYAN}Commands:${NC}"
    for file in "$INSTALL_DIR/claude/.claude/commands/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/commands/$(basename "$file")"
    done

    # Templates
    echo -e "${CYAN}Templates:${NC}"
    for file in "$INSTALL_DIR/shared/templates/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/templates/$(basename "$file")"
    done

    # Rules
    echo -e "${CYAN}Rules:${NC}"
    for file in "$INSTALL_DIR/shared/rules/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/rules/$(basename "$file")"
    done

    # Agents
    echo -e "${CYAN}Agents:${NC}"
    for file in "$INSTALL_DIR/shared/agents/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/agents/$(basename "$file")"
    done

    # Validators
    echo -e "${CYAN}Validators:${NC}"
    for file in "$INSTALL_DIR/shared/validators/"*.sh; do
        [[ -f "$file" ]] && create_link "$file" "$target/validators/$(basename "$file")"
    done

    # CLAUDE.md
    if [[ ! -f "$TARGET_DIR/CLAUDE.md" ]]; then
        if [[ -f "$INSTALL_DIR/claude/CLAUDE.md.template" ]]; then
            cp "$INSTALL_DIR/claude/CLAUDE.md.template" "$TARGET_DIR/CLAUDE.md"
            echo -e "${GREEN}Created CLAUDE.md from template${NC}"
        fi
    else
        echo -e "${YELLOW}CLAUDE.md exists - not modified${NC}"
    fi

    echo -e "${GREEN}✓ Claude Code setup complete${NC}"
}

# ============================================================================
# CURSOR SETUP
# ============================================================================
setup_cursor() {
    local target="$TARGET_DIR/.cursor"
    echo -e "${BLUE}━━━ Cursor ━━━${NC}"

    mkdir -p "$target/rules" "$target/templates"

    # Rules (use .mdc extension for Cursor)
    echo -e "${CYAN}Rules:${NC}"
    for file in "$INSTALL_DIR/shared/rules/"*.md; do
        if [[ -f "$file" ]]; then
            local base=$(basename "${file%.md}")
            create_link "$file" "$target/rules/${base}.mdc"
        fi
    done

    # Templates
    echo -e "${CYAN}Templates:${NC}"
    for file in "$INSTALL_DIR/shared/templates/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/templates/$(basename "$file")"
    done

    echo -e "${GREEN}✓ Cursor setup complete${NC}"
}

# ============================================================================
# WINDSURF SETUP
# ============================================================================
setup_windsurf() {
    local target="$TARGET_DIR/.cascade"
    echo -e "${BLUE}━━━ Windsurf ━━━${NC}"

    mkdir -p "$target/rules" "$target/templates" "$target/workflows" "$target/engineering"

    # Rules
    echo -e "${CYAN}Rules:${NC}"
    for file in "$INSTALL_DIR/shared/rules/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/rules/$(basename "$file")"
    done

    # Templates
    echo -e "${CYAN}Templates:${NC}"
    for file in "$INSTALL_DIR/shared/templates/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/templates/$(basename "$file")"
    done

    # Workflows (if exist)
    if [[ -d "$INSTALL_DIR/windsurf/.cascade/workflows" ]]; then
        echo -e "${CYAN}Workflows:${NC}"
        for file in "$INSTALL_DIR/windsurf/.cascade/workflows/"*.yml; do
            [[ -f "$file" ]] && create_link "$file" "$target/workflows/$(basename "$file")"
        done
    fi

    # Agents
    if [[ -d "$INSTALL_DIR/shared/agents" ]]; then
        mkdir -p "$target/agents"
        echo -e "${CYAN}Agents:${NC}"
        for file in "$INSTALL_DIR/shared/agents/"*.yml; do
            [[ -f "$file" ]] && create_link "$file" "$target/agents/$(basename "$file")"
        done
    fi

    # Config
    if [[ -f "$INSTALL_DIR/windsurf/.cascade/config.yml" && ! -f "$target/config.yml" ]]; then
        cp "$INSTALL_DIR/windsurf/.cascade/config.yml" "$target/config.yml"
        echo -e "${GREEN}Created config.yml${NC}"
    fi

    echo -e "${GREEN}✓ Windsurf setup complete${NC}"
}

# ============================================================================
# AIDER SETUP
# ============================================================================
setup_aider() {
    local target="$TARGET_DIR/.aider"
    echo -e "${BLUE}━━━ Aider ━━━${NC}"

    mkdir -p "$target/rules" "$target/templates"

    # Rules
    echo -e "${CYAN}Rules:${NC}"
    for file in "$INSTALL_DIR/shared/rules/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/rules/$(basename "$file")"
    done

    # Templates
    echo -e "${CYAN}Templates:${NC}"
    for file in "$INSTALL_DIR/shared/templates/"*.md; do
        [[ -f "$file" ]] && create_link "$file" "$target/templates/$(basename "$file")"
    done

    # CONVENTIONS.md
    if [[ ! -f "$TARGET_DIR/CONVENTIONS.md" ]]; then
        if [[ -f "$INSTALL_DIR/aider/CONVENTIONS.md" ]]; then
            cp "$INSTALL_DIR/aider/CONVENTIONS.md" "$TARGET_DIR/CONVENTIONS.md"
            echo -e "${GREEN}Created CONVENTIONS.md${NC}"
        fi
    else
        echo -e "${YELLOW}CONVENTIONS.md exists - not modified${NC}"
    fi

    # .aider.conf.yml
    if [[ ! -f "$TARGET_DIR/.aider.conf.yml" ]]; then
        if [[ -f "$INSTALL_DIR/aider/.aider.conf.yml" ]]; then
            cp "$INSTALL_DIR/aider/.aider.conf.yml" "$TARGET_DIR/.aider.conf.yml"
            echo -e "${GREEN}Created .aider.conf.yml${NC}"
        fi
    else
        echo -e "${YELLOW}.aider.conf.yml exists - not modified${NC}"
    fi

    echo -e "${GREEN}✓ Aider setup complete${NC}"
}

# ============================================================================
# MAIN EXECUTION
# ============================================================================

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   AI SDLC Workflows - Project Setup    ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "Target: ${CYAN}$TARGET_DIR${NC}"
echo -e "Source: ${CYAN}$INSTALL_DIR${NC}"
echo ""

# Execute setup for selected tools
for tool in "${TOOLS[@]}"; do
    case $tool in
        claude) setup_claude ;;
        cursor) setup_cursor ;;
        windsurf) setup_windsurf ;;
        aider) setup_aider ;;
    esac
    echo ""
done

# Add gitignore entries
add_gitignore_entries "$TARGET_DIR"
echo -e "${GREEN}Updated .gitignore${NC}"

echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           Setup Complete!              ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "  1. Customize project config files (CLAUDE.md, etc.)"
echo "  2. Add project-specific commands/templates as needed"
echo "  3. Start using workflows: /feature, /bug, /plan, etc."
echo ""
echo -e "${BLUE}To add custom commands:${NC}"
echo "  Create .claude/commands/my-command.md (not a symlink)"
echo ""
echo -e "${BLUE}To override a base command:${NC}"
echo "  rm .claude/commands/bug.md  # Remove symlink"
echo "  # Then create your own .claude/commands/bug.md"
echo ""
echo -e "${BLUE}To update the framework:${NC}"
echo "  $INSTALL_DIR/update.sh"
echo ""
