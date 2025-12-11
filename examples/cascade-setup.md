# Windsurf Cascade Setup Guide

This guide walks through setting up AI SDLC Workflows with Windsurf Cascade.

## Prerequisites

- [Windsurf](https://codeium.com/windsurf) installed
- A project directory

## Setup Steps

### 1. Copy the Rules File

```bash
# From the ai-sdlc-workflows repository
cp cascade/.windsurfrules /path/to/your-project/.windsurfrules
```

### 2. (Optional) Copy Templates

If you want to use the document templates:
```bash
cp -r cascade/templates/ /path/to/your-project/.cascade/templates/
```

### 3. Create Working Directory

```bash
mkdir -p /path/to/your-project/.cascade/engineering/{frd,design,test-plans,reviews}
```

### 4. Update .gitignore

Add to your `.gitignore`:
```
# AI working documents (not committed)
.cascade/engineering/
```

## Using Workflows

Cascade doesn't have slash commands like Claude Code, but you can trigger workflows with keywords in your prompts.

### Feature Workflow

Start your message with `feature:`:

```
feature: Add user authentication with OAuth2
```

Cascade will follow the full SDLC workflow.

### Bug Workflow

Start with `bug:`:

```
bug: Users can't log in with email containing "+"
```

Cascade will investigate, find root cause, fix, and test.

### Plan Workflow

Start with `plan:`:

```
plan: Refactor the database connection module
```

Cascade will analyze and present options before implementing.

### Refactor Workflow

Start with `refactor:`:

```
refactor: Extract common validation logic
```

Cascade will analyze impact and propose changes before implementing.

## Example Session

```
You: feature: Add a dark mode toggle

Cascade: I'll help you add a dark mode toggle. Let me first understand the requirements.

Questions:
1. Where should the toggle appear? (header, settings page, floating button?)
2. Should the preference persist across sessions?
3. What's your current styling approach? (CSS, Tailwind, styled-components?)
4. Should it respect the OS-level dark mode preference?

You: Header, yes persist, we use Tailwind, yes respect OS preference

Cascade: Perfect. Let me document these requirements and then propose a design.

**Feature Request Document**

**Feature:** Dark Mode Toggle
**Location:** Header component
**Persistence:** localStorage
**Styling:** Tailwind dark mode (class-based)
**Default:** OS preference via prefers-color-scheme

**Acceptance Criteria:**
- Toggle visible in header
- Clicking toggle switches theme immediately
- Preference saved to localStorage
- On first visit, respects OS preference
- On return visit, uses saved preference

Does this capture your requirements correctly? Reply "approved" to proceed to design.

You: approved

Cascade: [Analyzes codebase...]

I found:
- Header at src/components/Header.tsx
- Tailwind configured with class-based dark mode
- No existing theme management

**Design Proposal:**

1. Create `ThemeProvider` context
2. Add toggle button to Header
3. Use `localStorage` key: `theme-preference`
4. Initialize: check localStorage → fallback to OS preference

Architecture:
```
ThemeProvider (context)
    └── App
        └── Header
            └── ThemeToggle (button)
```

Approve to proceed with test planning?

You: approved

... [continues through phases] ...
```

## Differences from Claude Code

| Aspect | Claude Code | Cascade |
|--------|-------------|---------|
| Trigger | `/command` | `keyword:` prefix |
| Settings | `.claude/settings.json` | IDE settings |
| Commands | Markdown files | In rules file |
| Templates | Separate folder | Separate folder |

## Tips

### For Faster Workflows

- Be specific in your initial request
- Combine approvals when confident
- Use `plan:` for smaller tasks

### For Better Results

- Answer questions thoroughly
- Review proposed designs before approving
- Say "stop" or "wait" if Cascade is moving too fast

### If Cascade Ignores Rules

Sometimes Cascade may not follow the rules file perfectly. Try:
1. Explicitly reference the workflow: "Follow the feature workflow as defined in .windsurfrules"
2. Remind it of key rules: "Remember: don't commit without my approval"
3. Break into smaller tasks

## Customization

Edit `.windsurfrules` to:
- Add domain-specific rules
- Modify workflow phases
- Add new agent personas
- Change approval requirements
