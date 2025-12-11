# Claude Code Setup Guide

This guide walks through setting up AI SDLC Workflows with Claude Code.

## Prerequisites

- [Claude Code CLI](https://claude.ai/code) installed
- A project directory

## Setup Steps

### 1. Copy the `.claude` Folder and CLAUDE.md

```bash
# From the ai-sdlc-workflows repository
cp -r claude/.claude/ your-project/.claude/
cp claude/CLAUDE.md your-project/CLAUDE.md
```

Your project should now have:
```
your-project/
├── .claude/
│   ├── commands/       # Slash commands (/feature, /bug, etc.)
│   ├── templates/      # Document templates (FRD, Design, etc.)
│   ├── agents/         # Agent persona definitions
│   ├── memories/       # ADRs (architectural decisions)
│   ├── engineering/    # Working documents (gitignore this)
│   └── settings.example.json
├── CLAUDE.md           # Critical rules for Claude Code
└── ... your code ...
```

### 2. Update .gitignore

Add working documents to gitignore:

```bash
echo ".claude/engineering/" >> your-project/.gitignore
echo ".claude/settings.local.json" >> your-project/.gitignore
```

### 3. (Optional) Configure Settings

```bash
cp .claude/settings.example.json .claude/settings.json
```

Edit permissions as needed for your project.

## Folder Structure Explained

### commands/
Slash commands that trigger workflows:
- `/feature` - Full SDLC feature development
- `/bug` - Bug investigation and fix
- `/plan` - Quick planning
- `/refactor` - Code restructuring
- `/commit` - Controlled commit
- `/release` - Version management
- `/spike` - Technical research
- `/code-review` - Code review
- `/docs` - Documentation update

### templates/
Document templates used during workflows:
- `FRD.md` - Feature Request Document
- `DESIGN.md` - Design Proposal
- `TEST-PLAN.md` - Test Plan
- `REVIEW.md` - Code Review Report
- `BUG.md` - Bug Analysis
- `SPIKE.md` - Investigation Report
- `RELEASE.md` - Release Document

### agents/
Agent personas for different SDLC phases:
- `architect.md` - Design phase
- `coder.md` - Implementation phase
- `product-manager.md` - Requirements phase
- `quality-engineer.md` - Testing phase
- `reviewer.md` - Review phase
- `tech-writer.md` - Documentation phase
- `devops.md` - Deployment phase
- `engineering-manager.md` - Coordination

### memories/
Architecture Decision Records (ADRs):
- Documented decisions that affect the project
- Indexed in `ADR-INDEX.md`
- Committed to version control

### engineering/
Working documents created during workflows:
- `frd/` - Feature Request Documents
- `design/` - Design Proposals
- `test-plans/` - Test Plans
- `reviews/` - Code Review Reports
- `spikes/` - Investigation Reports
- `bugs/` - Bug Analysis
- `releases/` - Release Documents

**These are NOT committed** - they guide implementation but aren't deliverables.

## Using Workflows

### Start a Feature

```
/feature Add user authentication with OAuth2
```

Claude will follow the full SDLC:
1. **Requirements** (Product Manager) - Ask clarifying questions
2. **Design** (Architect) - Propose architecture, check existing patterns
3. **Test Strategy** (Quality Engineer) - Define test plan
4. **Implementation** (Coder) - Write code and tests
5. **Review** (Reviewer) - Check quality and security
6. **Documentation** (Tech Writer) - Update README, CHANGELOG
7. **Commit** - Show diff, wait for approval

Each phase requires your explicit "approved" to proceed.

### Fix a Bug

```
/bug Users can't log in with email containing "+"
```

Workflow:
1. **Investigation** - Understand and reproduce
2. **Root Cause** - Find the actual problem
3. **Fix** - Implement minimal fix
4. **Regression Test** - Add test to prevent recurrence
5. **Commit** - Wait for approval

### Quick Planning

```
/plan Add a helper function for date formatting
```

Workflow:
1. **Analyze** - Understand the request
2. **Options** - Present approaches with tradeoffs
3. **Approve** - Wait for selection
4. **Implement** - Execute chosen approach

### Controlled Commit

```
/commit
```

Workflow:
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

REUSE: Following existing context pattern from AuthContext

[Shows design document]

Approve to proceed to test planning?

You: approved

... [continues through phases] ...

Claude: [Shows final diff]

Ready to commit with message:
feat(ui): add dark mode toggle to header

- Add ThemeContext for theme state management
- Add ThemeToggle button component
- Persist preference in localStorage
- Default to OS prefers-color-scheme

Approve to commit?

You: approved

Claude: [Commits changes]
```

## Creating Custom Commands

See `COMMAND-PATTERNS.md` for detailed guidance on creating custom slash commands.

Basic structure:

```markdown
---
description: My custom workflow
argument-hint: [what to pass]
---

# My Workflow

Instructions for Claude...
```

## Tips

### For Faster Workflows

- Use `/plan` instead of `/feature` for small tasks
- Be specific in your initial request to reduce questions
- Combine approvals when confident

### For Better Results

- Answer clarifying questions thoroughly
- Review FRD and Design documents carefully
- Push back if Claude proposes unnecessary complexity
- Use "abort" to restart if going off track

### ADRs

Record significant architectural decisions in `memories/`:
1. Copy from existing ADR
2. Number sequentially
3. Update `ADR-INDEX.md`

## Reference

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- `COMMAND-PATTERNS.md` in this repo for command creation guide
