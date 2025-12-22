#!/bin/bash

# GitHub Copilot Workflow Setup Script
# Installs structured workflows and rules for GitHub Copilot

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
COPILOT_DIR="$PROJECT_ROOT/.github-copilot"

echo "Setting up GitHub Copilot workflows in $PROJECT_ROOT"

# Create directory structure
mkdir -p "$COPILOT_DIR"/{agents,commands,engineering/{bugs,design,frd,refactors,releases,reviews,spikes,test-plans},memories,rules,scripts,templates,validators}

# Copy shared workflows from ai-sdlc-workflows if available
WORKFLOWS_DIR="$PROJECT_ROOT/../ai-sdlc-workflows"

if [ -d "$WORKFLOWS_DIR" ]; then
    echo "Found ai-sdlc-workflows directory, copying shared resources..."

    # Copy shared agents
    if [ -d "$WORKFLOWS_DIR/shared/agents" ]; then
        cp -r "$WORKFLOWS_DIR/shared/agents"/* "$COPILOT_DIR/agents/" 2>/dev/null || true
    fi

    # Copy shared rules
    if [ -d "$WORKFLOWS_DIR/shared/rules" ]; then
        cp -r "$WORKFLOWS_DIR/shared/rules"/* "$COPILOT_DIR/rules/" 2>/dev/null || true
    fi

    # Copy shared templates
    if [ -d "$WORKFLOWS_DIR/shared/templates" ]; then
        cp -r "$WORKFLOWS_DIR/shared/templates"/* "$COPILOT_DIR/templates/" 2>/dev/null || true
    fi
fi

# Create placeholder files for project-specific content
touch "$COPILOT_DIR/engineering/bugs/.gitkeep"
touch "$COPILOT_DIR/engineering/design/.gitkeep"
touch "$COPILOT_DIR/engineering/frd/.gitkeep"
touch "$COPILOT_DIR/engineering/refactors/.gitkeep"
touch "$COPILOT_DIR/engineering/releases/.gitkeep"
touch "$COPILOT_DIR/engineering/reviews/.gitkeep"
touch "$COPILOT_DIR/engineering/spikes/.gitkeep"
touch "$COPILOT_DIR/engineering/test-plans/.gitkeep"

echo "GitHub Copilot workflows setup complete!"
echo ""
echo "Next steps:"
echo "1. Review and customize the agents in .github-copilot/agents/"
echo "2. Review the rules in .github-copilot/rules/"
echo "3. Start using commands like /plan and /feature"
echo "4. Create project-specific documents in the engineering/ subdirectories"
echo ""
echo "For more information, see .github-copilot/README.md"