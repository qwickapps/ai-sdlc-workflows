# Claude Code Setup Guide

This guide walks through setting up AI SDLC Workflows with Claude Code.

## Prerequisites

- [Claude Code CLI](https://claude.ai/code) installed
- A project directory

## Setup Steps

### 1. Copy the `.claude` Folder

```bash
# From the ai-sdlc-workflows repository
cp -r claude/ /path/to/your-project/.claude/
```

Your project should now have:
```
your-project/
├── .claude/
│   ├── commands/
│   ├── templates/
│   ├── agents/
│   └── settings.example.json
└── ... your code ...
```

### 2. Copy CLAUDE.md

```bash
cp claude/CLAUDE.md /path/to/your-project/CLAUDE.md
```

This file contains the critical rules that Claude Code will follow.

### 3. Create Engineering Folder

```bash
mkdir -p /path/to/your-project/.claude/engineering/{frd,design,test-plans,reviews,spikes,bugs,releases}
```

### 4. Update .gitignore

Add to your `.gitignore`:
```
# AI working documents (not committed)
.claude/engineering/
.claude/settings.local.json
```

### 5. (Optional) Customize Settings

Copy and modify the settings:
```bash
cp .claude/settings.example.json .claude/settings.json
```

Edit permissions as needed for your project.

## Using Workflows

### Start a Feature

```
/feature Add user authentication with OAuth2
```

Claude will:
1. Ask clarifying questions (Product Manager)
2. Propose a design (Architect)
3. Define test strategy (Quality Engineer)
4. Implement with tests (Coder)
5. Review the code (Reviewer)
6. Update documentation (Tech Writer)
7. Wait for approval to commit

### Fix a Bug

```
/bug Users can't log in with email containing "+"
```

Claude will:
1. Investigate the issue
2. Identify root cause
3. Propose fix
4. Add regression test
5. Wait for approval to commit

### Quick Planning

```
/plan Add a helper function for date formatting
```

Claude will:
1. Analyze the request
2. Check for existing utilities
3. Present options
4. Wait for approval
5. Implement

### Controlled Commit

```
/commit
```

Claude will:
1. Run tests
2. Check documentation is updated
3. Show diff
4. Wait for explicit "approved"

## Example Session

```
You: /feature Add a dark mode toggle

Claude: [Product Manager mode]
I'd like to understand the requirements better:

1. Where should the toggle appear? (header, settings, both?)
2. Should the preference persist across sessions?
3. Do we have existing theme/styling infrastructure to build on?
4. Should it respect OS-level dark mode preference?

You: Header, yes persist, we use Tailwind, yes respect OS preference

Claude: [Creates FRD document]
Here's my understanding of the requirements:
- Dark mode toggle in header
- Persists preference in localStorage
- Uses Tailwind's dark mode (class-based)
- Defaults to OS preference, user can override

Approve to proceed to design?

You: approved

Claude: [Architect mode]
Let me check the existing codebase...

Found: Header component at src/components/Header.tsx
Found: Tailwind config with dark mode class
Found: No existing theme context

Design proposal:
1. Create ThemeContext for state management
2. Add toggle button to Header
3. Use localStorage for persistence
4. Check prefers-color-scheme on initial load

[Shows design document]

Approve to proceed to test planning?

You: approved

... [continues through phases] ...
```

## Tips

### For Faster Workflows

- Use `/plan` instead of `/feature` for small tasks
- Combine approvals: "approved, skip test plan" if you trust the approach
- Be specific in your initial request to reduce questions

### For Better Results

- Answer clarifying questions thoroughly
- Review FRD and Design documents carefully
- Push back if the AI proposes unnecessary complexity
- Use "abort" to restart if going off track

### Customization

- Edit agent files to match your team's style
- Add domain-specific templates
- Modify commands for your workflow
