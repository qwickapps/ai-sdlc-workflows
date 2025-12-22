# GitHub Copilot Setup Guide

This guide walks through setting up AI SDLC Workflows with GitHub Copilot.

## Prerequisites

- [GitHub Copilot](https://github.com/features/copilot) enabled in your IDE
- A project directory

## Setup Steps

### 1. Copy the `.github-copilot` Folder

```bash
# From the ai-sdlc-workflows repository
cp -r github-copilot/.github-copilot/ your-project/.github-copilot/
```

Your project should now have:
```
your-project/
├── .github-copilot/
│   ├── agents/         # Agent persona definitions
│   ├── commands/       # Workflow command definitions
│   ├── rules/          # Quality and process rules
│   ├── templates/      # Document templates
│   ├── validators/     # Validation scripts
│   ├── scripts/        # Utility scripts
│   └── memories/       # ADRs (architectural decisions)
└── ... your code ...
```

### 2. Update .gitignore

Add working documents to gitignore:

```bash
echo ".github-copilot/engineering/" >> your-project/.gitignore
```

### 3. Integrate with QwickBrain (Optional)

If using QwickBrain for document management, ensure the integration is configured in your project settings.

## Usage

With GitHub Copilot enabled, the workflows will guide your development process through structured phases with approval gates.

Start with `/feature` or `/bug` commands to initiate workflows.