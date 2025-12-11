# Windsurf Setup Guide

This guide walks through setting up AI SDLC Workflows with Windsurf (Cascade).

## Prerequisites

- [Windsurf](https://codeium.com/windsurf) installed
- A project directory

## Setup Steps

### 1. Copy the `.windsurf` Folder

```bash
# From the ai-sdlc-workflows repository
cp -r windsurf/.windsurf/ /path/to/your-project/.windsurf/
```

Your project should now have:
```
your-project/
├── .windsurf/
│   └── rules/
│       ├── sdlc-core.md
│       ├── feature-workflow.md
│       ├── bug-workflow.md
│       ├── plan-workflow.md
│       ├── refactor-workflow.md
│       └── agents.md
└── ... your code ...
```

### 2. (Optional) Copy Templates

If you want document templates for FRDs, Design docs, etc:
```bash
cp -r windsurf/templates/ /path/to/your-project/.windsurf/templates/
```

### 3. Create Working Directory (Optional)

For engineering documents during workflows:
```bash
mkdir -p /path/to/your-project/.windsurf/engineering/{frd,design,test-plans,reviews}
echo ".windsurf/engineering/" >> /path/to/your-project/.gitignore
```

## Using Workflows

### Activating Rules

Rules can be activated in several ways:

1. **@mention**: Type `@feature-workflow` in Cascade chat
2. **Keyword prefix**: Start message with `feature:`, `bug:`, `plan:`
3. **Automatic**: Core rules apply based on context

### Feature Development

```
@feature-workflow Add user authentication with OAuth2
```

Or:

```
feature: Add user authentication with OAuth2
```

Cascade will follow the full SDLC workflow with approval gates.

### Bug Fixes

```
@bug-workflow Login fails with special characters in password
```

Or:

```
bug: Login fails with special characters in password
```

### Quick Planning

```
@plan-workflow Add helper function for date formatting
```

Or:

```
plan: Add helper function for date formatting
```

### Refactoring

```
@refactor-workflow Extract validation logic to separate module
```

## Example Session

```
You: feature: Add dark mode toggle to the application

Cascade: [Adopts Product Manager mindset]

I'd like to understand the requirements better:

1. Where should the toggle appear? (header, settings, floating button?)
2. Should the preference persist across sessions?
3. What's your current styling approach? (CSS, Tailwind, styled-components?)
4. Should it respect the OS-level dark mode preference?

You: Header, yes persist in localStorage, we use Tailwind, yes respect OS preference

Cascade: Here are the documented requirements:

**Feature: Dark Mode Toggle**
- Location: Header component
- Persistence: localStorage
- Styling: Tailwind dark mode (class-based)
- Default: OS preference via prefers-color-scheme

**Success Criteria:**
- Toggle visible in header
- Clicking toggle switches theme immediately
- Preference saved to localStorage
- On first visit, respects OS preference
- On return visit, uses saved preference

Reply "approved" to proceed to design phase.

You: approved

Cascade: [Adopts Architect mindset]

Searching codebase for existing patterns...

Found:
- Header at src/components/Header.tsx
- Tailwind configured with class-based dark mode
- No existing theme management

**Design Proposal:**

1. Create `ThemeContext` for state management
2. Add toggle button to Header using existing Button component
3. Use `localStorage` key: `theme-preference`
4. Initialize: check localStorage → fallback to `prefers-color-scheme`

REUSE: Using existing Button component from design system.
NO NEW PATTERNS: Following existing context pattern from AuthContext.

Reply "approved" to proceed to test strategy.

You: approved

... [continues through phases] ...
```

## Character Limits

Windsurf has character limits for rules:
- Individual rule file: 6,000 characters
- Total combined rules: 12,000 characters

If you hit limits, keep rules focused and split into smaller files.

## Tips

### For Better Results

- Be specific in your initial request
- Answer clarifying questions thoroughly
- Review proposed designs before approving
- Say "stop" or "wait" if moving too fast

### If Cascade Ignores Rules

Sometimes Cascade may not follow rules perfectly. Try:
1. Explicitly mention the workflow: "Follow the feature workflow"
2. Remind it of key rules: "Remember: don't commit without my approval"
3. Use @mention: `@sdlc-core` to activate core rules

### Customization

Edit files in `.windsurf/rules/` to:
- Add domain-specific rules
- Modify workflow phases
- Add new agent personas
- Change approval requirements

## Reference

- [Windsurf Documentation](https://docs.windsurf.com/windsurf/cascade/memories)
- [Rules Directory](https://windsurf.com/editor/directory)
