# GitHub Copilot Workflows

This directory contains workflow configurations and templates optimized for GitHub Copilot.

## Structure

- `.github-copilot/` - Main configuration directory
  - `agents/` - Agent role definitions
  - `commands/` - Workflow command definitions
  - `rules/` - Quality and process rules
  - `templates/` - Document templates
  - `validators/` - Validation scripts
  - `scripts/` - Utility scripts
  - `memories/` - Architectural decisions and context

## Setup

Run the global setup script with GitHub Copilot support:

```bash
~/.ai-sdlc-workflows/setup.sh --github-copilot
```

## Features

- **Agent-based development** with specialized roles
- **Workflow commands** for common development tasks
- **Quality gates** and validation rules
- **Document templates** for consistent artifacts
- **Integration** with QwickBrain for document management

## Customization

Edit the files in `.github-copilot/` to customize workflows for your project needs.