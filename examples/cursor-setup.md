# Cursor Setup Guide

This guide walks through setting up AI SDLC Workflows with Cursor IDE.

## Prerequisites

- [Cursor](https://cursor.com) installed
- A project directory

## Setup Steps

### 1. Copy the `.cursor` Folder

```bash
# From the ai-sdlc-workflows repository
cp -r cursor/.cursor/ /path/to/your-project/.cursor/
```

Your project should now have:
```
your-project/
├── .cursor/
│   └── rules/
│       ├── sdlc-core.md        # Always applied
│       ├── feature-workflow.md  # Manual activation
│       ├── bug-workflow.md      # Manual activation
│       ├── plan-workflow.md     # Manual activation
│       ├── refactor-workflow.md # Manual activation
│       └── agents.md            # Manual activation
└── ... your code ...
```

### 2. Understand Rule Types

Rules have different activation modes based on their frontmatter:

```yaml
---
alwaysApply: true   # Applied to every chat
alwaysApply: false  # Manual activation with @mention
---
```

In this setup:
- `sdlc-core.md` - Always applied (core rules)
- Workflow rules - Activated manually with `@rule-name`

## Using Workflows

### Core Rules (Always Active)

The `sdlc-core` rules are always active and enforce:
- No auto-commit without approval
- No legacy support unless requested
- Plan before implementing
- Update documentation
- Think critically

### Activating Workflow Rules

Use `@` to mention specific workflow rules in chat:

```
@feature-workflow Add user authentication
```

```
@bug-workflow Fix login failure with special characters
```

```
@plan-workflow Refactor the database module
```

```
@refactor-workflow Extract validation utilities
```

### Referencing Agent Personas

```
@agents What persona should I use for code review?
```

## Example Session

```
You: @feature-workflow Add a dark mode toggle to the application

Cursor: [Following feature-workflow rule]

## Phase 1: Requirements

I need to understand the requirements better:

1. Where should the toggle appear?
2. Should the preference persist?
3. What's your styling approach?
4. Should it respect OS dark mode preference?

You: Header, yes persist, we use Tailwind, yes respect OS preference

Cursor: **Requirements Document**

Feature: Dark Mode Toggle
- Location: Header component
- Persistence: localStorage
- Styling: Tailwind dark mode
- Default: OS preference

**GATE: Approve requirements to proceed to design?**

You: approved

Cursor: ## Phase 2: Design

[Searches codebase for existing patterns...]

**Design Proposal:**

REUSE FIRST analysis:
- Found: Header.tsx, Button component
- Found: Tailwind dark mode configured
- Not found: Theme context

Proposed approach:
1. Create ThemeContext (following AuthContext pattern)
2. Add ThemeToggle button to Header
3. Use localStorage for persistence

**GATE: Approve design to proceed to test strategy?**

You: approved

... [continues through phases] ...
```

## Rule File Format

Cursor rules use YAML frontmatter:

```markdown
---
description: What this rule does (shown when browsing rules)
alwaysApply: false
globs: ["*.tsx", "*.ts"]  # Optional: apply to specific files
---

# Rule Content

Instructions for Cursor...
```

### Frontmatter Options

| Field | Purpose |
|-------|---------|
| `description` | Explains the rule's purpose |
| `alwaysApply` | `true` = always active, `false` = manual |
| `globs` | File patterns for automatic activation |

## Tips

### For Better Results

- Use specific @mentions for workflows
- Answer clarifying questions thoroughly
- Review each phase before approving
- Reference @agents for persona guidance

### Creating Custom Rules

1. Create a new `.md` file in `.cursor/rules/`
2. Add frontmatter with description
3. Set `alwaysApply: false` for manual activation
4. Reference with `@rule-name` in chat

### If Cursor Ignores Rules

1. Check that `.cursor/rules/` exists at project root
2. Verify frontmatter is valid YAML
3. Explicitly mention the rule: `@feature-workflow`
4. Remind of key rules: "Remember to wait for approval"

## Customization

### Adding New Workflows

Create a new file in `.cursor/rules/`:

```markdown
---
description: My custom workflow for X
alwaysApply: false
---

# My Custom Workflow

## Phase 1: ...
## Phase 2: ...
```

### Modifying Existing Rules

Edit files in `.cursor/rules/` directly. Changes take effect in new chats.

### Setting Rules to Always Apply

Change `alwaysApply: true` in the frontmatter. Use sparingly to avoid rule conflicts.

## Reference

- [Cursor Rules Documentation](https://cursor.com/docs/context/rules)
- [Awesome Cursorrules](https://github.com/PatrickJS/awesome-cursorrules)
